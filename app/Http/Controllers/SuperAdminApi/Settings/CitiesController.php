<?php

namespace App\Http\Controllers\SuperAdminApi\Settings;

use App\Http\Controllers\Controller;
use App\Http\Requests\CitiesRequest;
use App\Models\Cities;
use Illuminate\Http\Request;

class CitiesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(Cities::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(CitiesRequest $request)
    {
        $item = Cities::create($request->validated());
        return response()->json($item);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(CitiesRequest $request, $id)
    {
        $items = Cities::findOrFail($id);
        $items->update($request->validated());
        return response()->json($items);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
      Cities::destroy($id);
    }
}
