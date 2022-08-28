<?php

namespace App\Http\Controllers\SuperAdminApi;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SuperAdminUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return response()->json(User::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(),[
            "name" => "required|string|max:191",
            "email" => "required|email|unique:users",
            "password" => "required|string",
        ]);
        $user = User::create([
            'name' => $validator->validated()['name'],
            'email' => $validator->validated()['email'],
            'password' => Hash::make($validator->validated()['password']),
        ]);
        return response()->json($user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Customers  $customers
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request,$id)
    {
        $validator = Validator::make($request->all(),[
            "name" => "required|string|max:191",
            "email" => "required|email",
            "password" => "required|string",
        ]);

        $user = User::find($id);
        $user->tokens()->delete();
        $user->update(
            [
                'name' => $validator->validated()['name'],
                'email' => $validator->validated()['email'],
                'password' => Hash::make($validator->validated()['password']),
            ]
        );
        return response()->json($user);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customers  $customers
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::destroy($id);
    }
}
