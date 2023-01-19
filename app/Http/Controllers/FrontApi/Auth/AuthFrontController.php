<?php

namespace App\Http\Controllers\FrontApi\Auth;

use App\Http\Controllers\Controller;
use App\Mail\TestMail;
use App\Models\Customers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;


class AuthFrontController extends Controller
{
    public function register(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            "name" => "required|string|max:191",
            "surname" => "required|string|max:191",
            "email" => "required|email|unique:customers",
            "phone" => "sometimes",
            "password" => "required|string",
        ]);
        if(!$validator->fails()){
            $user = Customers::create([
                "name" => $request->name,
                "surname" => $request->surname,
                "email" => $request->email,
                "phone" => $request->phone,
                "password" => Hash::make($request->password),
            ]);

            $user_token = $user->createToken('RegisterText')->plainTextToken;

            $response = [
                'userDetail' => $user,
                'token' => $user_token,
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
            "email" => "required|email|exists:customers,email",
            "password" => "required|string",
        ]);

        $user = Customers::where('email', $validator->validated()['email'])->firstOrFail();
        if(Hash::check($validator->validated()['password'],$user->password))
        {
            $user->tokens()->delete();
            $token = $user->createToken('auth_token')->plainTextToken;
            //Token created, return with success response and   token
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
            "email" => "required|email|exists:customers,email",
        ]);
        $newPassword = random_int(999,9999);
        $checkEmail = Customers::where('email',$validator->validated()['email'])->first();
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
    public function updateUser(Request $request,$id){

        $validator = Validator::make($request->all(),[
            "name" => "required|string|max:191",
            "surname" => "required|string|max:191",
            "email" => "required|email",
            "phone" => "sometimes",
            "password" => "sometimes",
        ]);
        $customer = Customers::find($id);
        $customer->update(
            [
                'name' => $validator->validated()['name'],
                'surname' => $validator->validated()['surname'],
                'phone' => $validator->validated()['phone'],
                'email' => $validator->validated()['email'],
                'password' => Hash::make($validator->validated()['password']),
            ]
        );
        return response()->json($customer);

    }

}
