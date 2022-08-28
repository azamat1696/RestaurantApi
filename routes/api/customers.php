<?php
use App\Http\Controllers\FrontApi\Auth\AuthFrontController;
use App\Http\Controllers\SuperAdminApi\Auth\NewPasswordController;
use Illuminate\Support\Facades\Route;

/****************Front Api ************************/
//Route::post('user/login',[AuthController::class,'login']);
Route::group(['prefix' => 'fapi'],function (){
    Route::post('customer/login',[AuthFrontController::class,'login']);
    Route::post('customer/register',[AuthFrontController::class,'register']);
    Route::put('customers/update/{id}',[AuthFrontController::class,'updateUser']);
    Route::post('forgot-password',[AuthFrontController::class,'forgotPassword']);
});
Route::group(['prefix' => 'fapi','middleware' => ['auth:customers','scopes:customers']],function (){
    Route::post('customer/logout',[AuthFrontController::class,'logout']);
});
