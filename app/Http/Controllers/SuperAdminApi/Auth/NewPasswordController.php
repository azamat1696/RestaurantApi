<?php

namespace App\Http\Controllers\SuperAdminApi\Auth;

use App\Http\Controllers\Controller;

use App\Mail\TestMail;
use App\Models\User;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules\Password as RulesPassword;

class NewPasswordController extends Controller
{
    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(),[
            "email" => "required|email|exists:users,email",
        ]);
        $newPassword = random_int(999,9999);
       $checkEmail = User::where('email',$validator->validated()['email'])->first();
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
    public function reset(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => ['required', 'confirmed', RulesPassword::defaults()],
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user) use ($request) {
                $user->forceFill([
                    'password' => Hash::make($request->password),
                    'remember_token' => Str::random(60),
                ])->save();

                $user->tokens()->delete();

                event(new PasswordReset($user));
            }
        );

        if ($status == Password::PASSWORD_RESET) {
            return response([
                'message'=> 'Password reset successfully'
            ]);
        }

        return response([
            'message'=> __($status)
        ], 500);

    }

}
