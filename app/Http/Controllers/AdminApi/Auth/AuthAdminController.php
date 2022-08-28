<?php

namespace App\Http\Controllers\AdminApi\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RestCustomersRequest;
use App\Mail\TestMail;
use App\Models\RestCustomers;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;


class AuthAdminController extends Controller
{
    public function register(RestCustomersRequest $request): JsonResponse
    {
            $user = RestCustomers::create([
                "name" => $request->validated()['name'],
                "restaurant_id" => $request->validated()['restaurant_id'],
                "email" => $request->validated()['email'],
                "password" => Hash::make($request->validated()['password']),
            ]);

            return response()->json($user);
    }
    public function getAllUsers(){
        return response()->json(RestCustomers::all());
    }

    public function logout():JsonResponse
    {
        auth()->user()->tokens()->delete();

        return response()->json([
            "message" =>"Logout successful.",
            "status" => true,
            "status_code" => 200
        ],200);
    }

    public function login(Request $request):JsonResponse
    {
        $validator = Validator::make($request->all(),[
            "email" => "required|email|exists:rest_customers,email",
            "password" => "required|string",
        ]);

        $user = RestCustomers::where('email', $validator->validated()['email'])->firstOrFail();

        if (Hash::check($validator->validated()['password'],$user->password))
        {
            $user->tokens()->delete();
            $token = $user->createToken('auth_token')->plainTextToken;
            return response()->json([
                'success' => true,
                'token' => $token,
                'userDetail' => $user,
            ]);
        }
        return response()->json([
            'status' => false,
            'status_code' => 401,
            'message' => 'User Not Found',
        ],401);

    }
    public function forgotPassword(Request $request)
    {

        $validator = Validator::make($request->all(),[
            "email" => "required|email|exists:rest_customers,email",
        ]);
        $newPassword = random_int(999,9999);
        $checkEmail = RestCustomers::where('email',$validator->validated()['email'])->first();
        $checkEmail->update(["password" => Hash::make($newPassword),]);

        try
        {
            Mail::to($checkEmail->email)->send( new TestMail($newPassword,$checkEmail));

            return response()->json(true,200);
        } catch (\Exception $exception)
        {
            return response()->json($exception->getMessage(),400);
        }

    }

}
