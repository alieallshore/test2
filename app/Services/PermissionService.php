<?php

namespace App\Services;

use App\Traits\ServiceTrait;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/*
    Store, Destroy, Update, Index, Show.
    Note. Service is being created for PermissionController. 
    And logic is being handled in PermissionService. And base structure is given in PermissionController.
*/
class PermissionService
{
    use ServiceTrait;
    protected $permissionsList = ['index', 'show', 'create', 'store', 'edit', 'update', 'destroy', 'search'];

    /*
        permissionIndex function is showing listed data. ServiceTrait where all Services are handled. In index function
    */ 
    public function permissionIndex(Request $request, $id, $model){        
        return $this->index($request, $id, $model);
    }

    /*
        permissionShow function is showing single  data. ServiceTrait where all Services are handled. In show function
    */ 
    public function permissionShow(Request $request, $id, $model){
        if(isset($request->search)){
            return $this->show($request, $id, $model, $search = true);
        }
        return $this->show($request, $id, $model, $search = false);  
    }

    /*
        permissionStore function is storing  data. ServiceTrait where all Services are handled. In store function
    */ 
    public function permissionStore(Request $request, $id, $model){
        try {            
            //Validated
            $validatePermission = Validator::make($request->all(), 
            [
                'name' => 'required',
                // 'guard_name' => 'required'
            ]);

            validateAll($validatePermission);
            $requestArray = null;
            foreach($this->permissionsList as $key => $list){
                $requestArray[$key]['guard_name'] = 'sanctum';
                $requestArray[$key]['name'] = $request->name . '.' . $list;
            }            
            return $this->store($request, $id, $model, $requestArray);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /*
        permissionEdit function is update data. ServiceTrait where all Services are handled. In update function
    */ 
    public function permissionEdit($id){
        $permission = Permission::find($id);
        $explodeName = explode('-', $permission->name);
        $permission['name'] = $explodeName[0];
        return  response()->json([
            'status' => true, 
            'message' => 'Permissions information fetched to edit.',
            'permission' => $permission
        ]);
    }

    /*
        permissionDestroy function is deleting data. ServiceTrait where all Services are handled. In destroy function
        Also it detaches from Roles. Where deleted permisison is assigned.
    */ 
    public function permissionDestroy($id){
        $permission = Permission::find($id);
        $explodeName = explode('-', $permission->name);
        $permission['name'] = $explodeName[0];
        foreach($this->permissionsList as $per){
            $permissionGet = Permission::where('name', $permission->name . '.' . $per)->first();
            if(isset($permissionGet)){
                $permissionGet->roles()->detach();
                Permission::where('id', $permissionGet->id)->delete();
            }
        }
        return  response()->json([
            'status' => true, 
            'message' => 'Role And Permissions destroyed.'                
        ]);
    }

    /*
        permissionUpdate function is update data. ServiceTrait where all Services are handled. In update function
    */ 
    public function permissionUpdate(Request $request, $id){
         $permission = Permission::where('id', $id)->first();
         $request->validate([
             'name' => 'required'
         ]);
         $explodeName = explode('-', $permission->name);
         $permission['name'] = $explodeName[0];
         foreach($this->permissionsList as $per){
            $permissionUpdate = Permission::where('name', $permission->name . '.' . $per)->first();
            $permissionUpdate->update([
                "name" => $request->name . '.' . $per
            ]);
         }
         return  response()->json([
             'status' => true, 
             'message' => 'Permissions Updated Successfully.',
            //  'permission' => $permission,
         ]);         
    }

}
