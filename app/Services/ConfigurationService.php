<?php

namespace App\Services;

use App\Models\Configuration;
use App\Traits\ServiceTrait;
use Illuminate\Http\Request;

/*
    Store, Destroy, Update, Index, Show.
    Note. Service is being created for ConfigurationController. 
    And logic is being handled in ConfigurationService. And base structure is given in ConfigurationController.
*/
class ConfigurationService
{
    use ServiceTrait;
    /*
        configurationIndex function is showing listed data. ServiceTrait where all Services are handled. In index function
    */ 
    public function configurationIndex(Request $request, $id, $model){        
        $obj = $model::get()->groupBy('type');
        if($obj){
            return $this->index($request, $id, $model, $obj);
        }else{
            return $this->index($request, $id, $model, $obj = null);
        }
    }

    /*
        configurationShow function is showing single  data. ServiceTrait where all Services are handled. In show function
    */ 
    public function configurationShow(Request $request, $id, $model){   
        if(isset($request->search)){
            return $this->show($request, $id, $model, $search = true);
        }
        return $this->show($request, $id, $model, $search = false);
        // $configuration = Configuration::find($id);
        // return response()->json([
        //     'configuration' => $configuration,
        //     'status' => true, 
        //     'message' =>'configuration Show.'
        // ],  200);
    }

    /*
        configurationStore function is storing  data. ServiceTrait where all Services are handled. In store function
    */ 
    public function configurationStore(Request $request){
        $configuration = new Configuration;
  
        $request->validate([
            // 'key' => 'required',
            // 'value' => 'required'
        ]);
    
        $configuration->key = $request->get('key');
        $configuration->value = $request->get('value');
        $configuration->title = $request->get('title');
        $configuration->description = $request->get('description');
        $configuration->input_type = $request->get('input_type');
        $configuration->editable = $request->get('editable');
        $configuration->weight = $request->get('weight');
        $configuration->params = $request->get('params');
        $configuration->order = $request->get('order');
    
        $configuration->save();
    
        return response()->json([
            'status' => true,
            'message' => 'Configuration Saved Successfully.',
        ], 200);
    }

    /*
        configurationUpdate function is update data. ServiceTrait where all Services are handled. In update function
    */ 
    public function configurationUpdate(Request $request, $id){
        $configuration = Configuration::findOrFail($id);
  
        $request->validate([
            // 'key' => 'required',
            // 'value' => 'required'
        ]);
    
        $configuration->key = $request->get('key');
        $configuration->value = $request->get('value');
        $configuration->title = $request->get('title');
        $configuration->description = $request->get('description');
        $configuration->input_type = $request->get('input_type');
        $configuration->editable = $request->get('editable');
        $configuration->weight = $request->get('weight');
        $configuration->params = $request->get('params');
        $configuration->order = $request->get('order');
    
        $configuration->save();
    
        return response()->json([
            'status' => true,
            'message' => 'Configuration Updated Successfully.',
        ], 200);
    }

    /*
        configurationDestroy function is deleting data. ServiceTrait where all Services are handled. In destroy function
    */ 
    public function configurationDestroy($id){
        $configuration=Configuration::find($id);
        $configuration->delete();
        return response()->json([
            'status' => true, 
            'message' =>'Selected configuration destroy.'
        ],  200);
    }
}
