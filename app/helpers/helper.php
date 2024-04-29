<?php

use Illuminate\Http\Request;

    function validateAll($validateRole){
        if($validateRole->fails()){
            return response()->json([
                'status' => false,
                'message' => 'validation error',
                'errors' => $validateRole->errors()
            ], 401);
        }
    }

    function hasSingleImageFile(Request $request){
        if(!$request->hasFile('file_name')) {
            return response()->json(['upload_file_not_found'], 400);
        }        
        $allowedfileExtension=['pdf','jpg','png'];
        $files = $request->file('file_name'); 
        $errors = [];        
        $extension = $files->getClientOriginalExtension();
        $check = in_array($extension,$allowedfileExtension);
        $path = $request->file_name->store('public/images');
        $name = $request->file_name->getClientOriginalName();
        $request['banner'] = $path;

        return $request;
    }

    function surcessResponse(){
        return 'Success';
    }

    function failedResponse(){
        return 'Failed';
    }