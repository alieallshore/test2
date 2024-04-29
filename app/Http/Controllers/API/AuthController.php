<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\AuthService;
use App\Services\UserService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    /**
     * Create User
     * @param Request $request
     * @return User 
     */
    protected $auth = null;

    public function __construct(AuthService $authService)
    { 
        $this->auth = $authService;
    }

    public function store(Request $request, $id = null, $model = 'App\Models\User')
    {
        return $this->auth->authStore($request, $id, $model);
    }

    /**
     * Login The User
     * @param Request $request
     * @return User
     */
    public function login(Request $request)
    {
        return $this->auth->userLogin($request);
    }

    public function logout(Request $request){
        return $this->auth->userLogout($request);
    }

    protected function guard()
    {
        return Auth::guard('sanctum');
    }

}