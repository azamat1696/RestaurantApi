<?php

namespace App\Http\Controllers\SuperAdminApi\Settings;

use App\Http\Controllers\Controller;
use App\Http\Requests\DistritsRequest;
use App\Models\Districts;

class DistrictsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(Districts::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(DistritsRequest $request)
    {
        $item = Districts::create($request->validated());
        return response()->json($item);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(DistritsRequest $request, $id)
    {
         $item = Districts::findOrFail($id);
         $item->update($request->validated());
         return response()->json($item);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Districts::destroy($id);
    }
}
