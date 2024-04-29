<?php
namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use PDO;

trait ServiceTrait
{
    /*
        This ServicesTrait is being used to handled common functionlaity of multiple services and handled in the same trait.
    */
    protected $explodeModel = null;
    protected $modelName = null;

    /*
        Exploding model name as it is comming from each services / controller.
    */
    public function modelExplode($model){
        $this->explodeModel  = explode('\Models', $model);
        $this->modelName =  substr($this->explodeModel[1], 1);
    }
    /*
        Listing down the data.
    */
    public function index(Request $request, $id = null, $model, $obj = null){
        $this->modelExplode($model);        
        if($obj){
            $data = $obj;
            return response()->json([
                strtolower($this->modelName)  => $data,
                'status' => true,
                'message' =>  $this->modelName . ' Data.',
            ], 200);    
        }else{
            $data = $model::all();
            return response()->json([
                strtolower($this->modelName)  => $data,
                'status' => true,
                'message' =>  $this->modelName . ' Data.',
            ], 200);
        }        
    }
    
    /*
        Storing form data.
    */
    public function store(Request $request, $id = null, $model, $requestArray){
        try {
            $this->modelExplode($model);
            if($requestArray){                
                $dataArray = [];
                foreach($requestArray as $key => $list){                    
                    $dataArray[$key] = $model::create(
                        $list
                    );                    
                }
                $data = $dataArray;
            }else{            
                $data = $model::create(
                    $request->all()
                );
            }

            return response()->json([
                strtolower($this->modelName)  => $data,
                'status' => true,
                'message' => $this->modelName . ' Created Successfully'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /*
        To show data.
    */
    public function show(Request $request, $id = null, $model, $search){
        $this->modelExplode($model);
        if($search){            
            $data = $model::where($request->keys()[0], 'LIKE','%'.$request[$request->keys()[0]].'%')->get();            
            return  response()->json([
                'status' => true, 
                'message' =>  $this->modelName . ' Show Search Result.',
                'data' => $data,            
            ]);
        }else{
            $data = $model::find($id);
            return  response()->json([
                'status' => true, 
                'message' =>  $this->modelName . ' Show.',
                'data' => $data,            
            ]);
        }    
    }

    /*
        To update data in tables for multiple services.
    */
    public function update(Request $request, $id = null, $model, $requestArray){
        try {
            $this->modelExplode($model);
            if($requestArray){                
                $dataArray = [];
                foreach($requestArray as $key => $list){          
                    $dataArray[$key] = $model::where('id', $list->id)->update(
                        $list
                    );     
                }
                $data = $dataArray;
            }else{            
                $data = $model::where('id', $id)->update(
                    $request->all()
                );
            }

            return response()->json([
                strtolower($this->modelName)  => $data,
                'status' => true,
                'message' => $this->modelName . ' Updated Successfully'
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /*
        To delete data for services dynamically .
    */
    public function destroy(Request $request, $id = null, $model){
        $this->modelExplode($model);
        $data = $model::where('id',(int)$id)->delete();                    
        return  response()->json([
            'status' => true, 
            'message' => $this->modelName . ' Deleted Successfully'        
        ]);
    }

}
