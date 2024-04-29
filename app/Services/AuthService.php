<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\UserService;
use App\Traits\ServiceTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
/**
 * Class AuthService.
 */
class AuthService
{
    use ServiceTrait;

    /*
        Storing Registration data of a user.
        Note. Service is being created for AuthController. 
        And logic is being handled in AuthService. And base structure is given in AuthController.
    */
    public function authStore(Request $request, $id, $model){
        try {
            $requestArray = null;
            //Validated
            $validateUser = Validator::make($request->all(), 
            [
                'name' => 'required',
                'email' => 'required|email|unique:users,email',
                'password' => 'required',
                'c_password' => 'required|same:password'
            ]);

            validateAll($validateUser);        
            // $user = User::create([
            //     'name' => $request->name,
            //     'email' => $request->email,
            //     'password' => Hash::make($request->password)
            // ])->assignRole('User');

            // return response()->json([
            //     'status' => true,
            //     'message' => 'User Created Successfully',
            //     // 'token' => $user->createToken("API TOKEN")->plainTextToken
            // ], 200);
            $data = $this->store($request, $id, $model, $requestArray);
            $model::where('email', $request->email)->first()->assignRole('Manager');
            return $data;

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /*
        Logging in user which is being registered. With any associated role.
    */
    public function userLogin(Request $request){
        try {
            $validateUser = Validator::make($request->all(), 
            [
                'email' => 'required|email',
                'password' => 'required'
            ]);

            validateAll($validateUser);

            if(!Auth::attempt($request->only(['email', 'password']))){
                return response()->json([
                    'status' => false,
                    'message' => 'Email & Password does not match with our record.',
                ], 401);
            }

            $user = User::where('email', $request->email)->first();
            auth()->user()->tokens()->delete();
            $roles = $user->getRoleNames();
            $permissions = $user->getAllPermissions()->pluck('name');
            $pagePermissions = array();
            foreach ($permissions as $permission) {
                $data = explode('-', $permission);
                if(!in_array($data[0], $pagePermissions)){
                    $pagePermissions[] = $data[0];
                }
            }

            return response()->json([
                'user' => $user,
                'roles' => $roles,
                'permissions' => $permissions,
                'pagePermissions' => $pagePermissions,
                'status' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("Login Token")->plainTextToken
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 200);
        }
    }

    /*
        Logout user from the system  
    */
    public function userLogout(Request $request){
        $request->user()->currentAccessToken()->delete();
        $message = "Login token deleted";
        return response()->json([
            'status' => true, 
            'message' =>'Login token deleted'
        ],  200);
    }
    
}
