<?php

namespace App\Services;

use App\Models\User;
use App\Traits\ServiceTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

/*
    Store, Destroy, Update, Index, Show.
    Note. Service is being created for UserController. 
    And logic is being handled in UserService. And base structure is given in UserController.
*/
class UserService
{
    use ServiceTrait;
    // public function getUserAuthorization()
    // {
    //     return Session::get('user_id');
    // }

    /*
        userIndex function is showing listed data. ServiceTrait where all Services are handled. In index function
    */ 
    public function userIndex(Request $request, $id = null, $model){        
        $obj = $model::with(['roles' => function($q){
            // $q->where('name', 'admin');
        }])->get();
        if($obj){
            return $this->index($request, $id, $model, $obj);
        }else{
            return $this->index($request, $id, $model, $obj = null);
        }
    }

    /*
        userShow function is showing single  data. ServiceTrait where all Services are handled. In show function
    */ 
    public function userShow(Request $request, $id, $model){   
        if(isset($request)){
            // dd($request->all(), $request->keys()[0], $request[$request->keys()[0]]);
            return $this->show($request, $id, $model, $search = true);
        }
        return $this->show($request, $id, $model, $search = false);
        // $user = User::find($id);
        // return response()->json([
        //     'user' => $user,
        //     'status' => true, 
        //     'message' =>'User Profile'
        // ],  200);
    }
    
    public function userEdit($id){
        $user = User::find($id);
        return response()->json([
            'user' => $user,
            'status' => true, 
            'message' =>'user Edit.'
        ],  200);
    }

    /*
        userUpdate function is update data. ServiceTrait where all Services are handled. In update function
    */ 
    public function userUpdate(Request $request, $id){
        $user = User::findOrFail($id);
  
        //Validated
        $validateUser = Validator::make($request->all(), 
        [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            // 'password' => 'required',
            // 'c_password' => 'required|same:password'
        ]);

        if($validateUser->fails()){
            return response()->json([
                'status' => false,
                'message' => 'validation error',
                'errors' => $validateUser->errors()
            ], 401);
        }
    
        $user->name = $request->get('name');
        $user->email = $request->get('email');
    
        $user->save();
    
        return response()->json([
            'status' => true,
            'message' => 'User Updated Successfully.',
        ], 200);
    }

    /*
        userDestroy function is deleting data. ServiceTrait where all Services are handled. In destroy function
    */ 
    public function userDestroy($id){
        $user=User::find($id);
        $user->delete();
        return response()->json([
            'status' => true, 
            'message' =>'Selected User destroy.'
        ],  200);
    }
}
