<?php

namespace App\Http\Controllers;

use App\Services\RoleService;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{

    protected $role = null;

    public function __construct(RoleService $roleService){
        // $this->authorizeResource(Role::class, 'association');
        $this->role = $roleService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id = null, $model = 'Spatie\Permission\Models\Role') {

        return $this->role->roleIndex($request, $id, $model);
    }

    public function create(Request $request)
    {
        // Only to View ROle Create.
    }

    public function store(Request $request, $id = null, $model = 'Spatie\Permission\Models\Role')
    {        
        return $this->role->roleStore($request, $id, $model);
    }

    public function show(Request $request, $id = null, $model = 'Spatie\Permission\Models\Role')
    {
        return $this->role->roleShow($request, $id, $model);
    }

    public function update(Request $request, $id = null, $model = 'Spatie\Permission\Models\Role')
    {
       return $this->role->roleUpdate($request, $id, $model);
    }

    public function destroy(Request $request, $id = null, $model = 'Spatie\Permission\Models\Role')
    {        
        return $this->role->roleDestroy($request, $id, $model);
    }

    public function association(Request $request, $id)
    {
        return $this->role->rolePermissionsAssociation($request, $id);
    }
}