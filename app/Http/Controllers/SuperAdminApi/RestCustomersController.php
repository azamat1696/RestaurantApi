<?php

namespace App\Http\Controllers\SuperAdminApi;

use App\Http\Controllers\Controller;
use App\Http\Requests\RestCustomersRequest;
use App\Models\RestCustomers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RestCustomersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(RestCustomers::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(RestCustomersRequest $request)
    {
        $user = RestCustomers::create([
            "name" => $request->validated()['name'],
            "restaurant_id" => $request->validated()['restaurant_id'],
            "email" => $request->validated()['email'],
            "password" => Hash::make($request->validated()['password']),
        ]);
        return response()->json($user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RestCustomers  $restCustomers
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(RestCustomersRequest $request,$id)
    {
         $user = RestCustomers::find($id);
         $user->update([
                 "name" => $request->validated()['name'],
                 "restaurant_id" => $request->validated()['restaurant_id'],
                 "email" => $request->validated()['email'],
                 "password" => Hash::make($request->validated()['password'])
                 ]);

        return response()->json($user);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RestCustomers  $restCustomers
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        RestCustomers::destroy($id);
    }
}
