<?php

namespace App\Http\Controllers;

use App\Services\ConfigurationService;
use Illuminate\Http\Request;

class ConfigurationController extends Controller
{

    protected $configuration = null;

    public function __construct(ConfigurationService $configurations){
        $this->configuration = $configurations;
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, $id = null, $model = '\App\Models\Configuration')
    {
        return $this->configuration->configurationIndex($request, $id, $model);
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
        return $this->configuration->configurationStore($request);
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function show(Request $request, $id = null, $model = 'App\Models\Configuration')
    {
        return $this->configuration->configurationShow($request, $id, $model);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        return $this->configuration->configurationUpdate($request, $id);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        return $this->configuration->configurationDestroy($id);
    }
}
