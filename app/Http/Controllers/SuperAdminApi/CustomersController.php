<?php

namespace App\Http\Controllers\SuperAdminApi;


use App\Http\Controllers\Controller;
use App\Http\Requests\CustomersRequest;
use App\Models\Customers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class CustomersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(Customers::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(CustomersRequest $request)
    {
        $customer = Customers::create([
            'name' => $request->validated()['name'],
            'surname' => $request->validated()['surname'],
            'phone' => $request->validated()['phone'],
            'email' => $request->validated()['email'],
            'password' => Hash::make($request->validated()['password']),
        ]);
        return response()->json($customer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Customers  $customers
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(CustomersRequest $request,$id)
    {
        $customer = Customers::find($id);
        $customer->update(
            [
                'name' => $request->validated()['name'],
                'surname' => $request->validated()['surname'],
                'phone' => $request->validated()['phone'],
                'email' => $request->validated()['email'],
                'password' => Hash::make($request->validated()['password']),
            ]
        );
        return response()->json($customer);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customers  $customers
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Customers::destroy($id);
    }
}
