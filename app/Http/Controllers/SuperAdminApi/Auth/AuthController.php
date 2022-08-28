<?php

namespace App\Http\Controllers\SuperAdminApi\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    public function register(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            "name" => "required|string|max:191",
            "email" => "required|email|unique:users",
            "password" => "required|string",
        ]);
        if(!$validator->fails()){
            $user = User::create([
                "name" => $request->name,
                "email" => $request->email,
                "password" => Hash::make($request->password),
            ]);

            $user_token = $user->createToken('auth_token')->plainTextToken;

            $response = [
                'success' => true,
                'token' => $user_token,
                'userDetail' =>$user,
                ];

            return response()->json($response,201);
        }

        return response()->json([
            "Register",
            "Errors" => $validator->errors(),
            'status'=>false,
            "status_code" => 400,
        ],400);
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
            "email" => "required|email|exists:users,email",
            "password" => "required|string",
        ]);

        if (!Auth::attempt($request->only('email','password'))) {
            return response()->json([
                'message' => 'Invalid login details',
                'status' => 401,
                'errors' => $validator->errors()
            ], 401);
        }

        $user = User::where('email', $validator->validated()['email'])->firstOrFail();

        $user->tokens()->delete();
        $token = $user->createToken('auth_token')->plainTextToken;
        //Token created, return with success response and   token
        return response()->json([
            'success' => true,
            'token' => $token,
            'userDetail' => auth()->user(),

        ]);
    }

}
