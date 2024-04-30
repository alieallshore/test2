<?php

namespace App\Services;

use App\Traits\ServiceTrait;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/*
    Store, Destroy, Update, Index, Show.
    Note. Service is being created for RoleController. 
    And logic is being handled in RoleService. And base structure is given in RoleController.
*/
class RoleService
{
    use ServiceTrait;

    /*
        roleIndex function is showing listed data. ServiceTrait where all Services are handled. In index function
    */ 
    public function roleIndex(Request $request, $id, $model){        
        return $this->index($request, $id, $model);        
    }

    /*
        roleStore function is storing  data. ServiceTrait where all Services are handled. In store function
    */ 
    public function roleStore(Request $request, $id, $model){
        $request['guard_name'] = 'sanctum';
        $requestArray = null;
        //Validated
        $validateRole = Validator::make($request->all(), 
        [
            'name' => 'required',
            // 'guard_name' => 'required'
        ]);
        validateAll($validateRole);
        
        return $this->store($request, $id, $model, $requestArray);
    }

    /*
        roleShow function is showing single  data. ServiceTrait where all Services are handled. In show function
    */ 
    public function roleShow(Request $request, $id, $model){        
        if(isset($request->search)){
            return $this->show($request, $id, $model, $search = true);
        }
        return $this->show($request, $id, $model, $search = false);
    }

    /*
        roleDestroy function is deleting data. ServiceTrait where all Services are handled. In destroy function
    */ 
    public function roleDestroy(Request $request, $id, $model){
        $role = Role::where('id',(int)$id)->first();        
        if(isset($role)){
            $role->permissions()->detach();
            $data = $this->destroy($request, $id, $model);       
            return  response()->json([
                'data' => $data,
                'status' => true, 
                'message' => 'Role And Permissions destroyed.'      
                          
            ]);            
        }

    }

    /*
        roleUpdate function is update data. ServiceTrait where all Services are handled. In update function
    */ 
    public function roleUpdate(Request $request, $id, $model){       
        $requestArray = null;  
        $role = Role::where('id',$id)->first();

        $validateRole = Validator::make($request->all(), 
        [
            'name' => 'required',
            // 'guard_name' => 'required'
        ]);
        validateAll($validateRole);        
        $data = $this->update($request, $id, $model, $requestArray);
        $role->syncPermissions($request->permissions);
        
        return  response()->json([
            'data' => $data,
            'permissions' => $request->permissions
        ]);         
    }

    /*
        rolePermissionsAssociation function is being used to Associate already stored permissions wtih role selected.
    */ 
    public function rolePermissionsAssociation(Request $request, $id){        
        $role = Role::find($id);
        foreach($request->permission_id as $permission){
            $role->givePermissionTo($permission);
        }

        return  response()->json([
            'status' => true, 
            'message' => 'Associated Permission/s To Selected Role.',
            // 'permissions' => $role_permission
        ]);
    }

}
