<?php

use App\Http\Controllers\FrontApi\Auth\AuthFrontController;
use App\Http\Controllers\AdminApi\Auth\AuthAdminController;
use App\Http\Controllers\SuperAdminApi\Auth\AuthController;
use App\Http\Controllers\SuperAdminApi\Auth\NewPasswordController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//
//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});


/****************Super Admin Api ************************/
Route::group(['middleware' =>'verify-api'],  function () {
    Route::post('user/register', [AuthController::class, 'register']);
    Route::get('user/register', [AuthController::class, 'getAllUsers']);
    Route::post('user/login', [AuthController::class, 'login'])->name('login');
    Route::post('forgot-password', [NewPasswordController::class, 'forgotPassword']);
    Route::post('reset-password', [NewPasswordController::class, 'reset']);
});
Route::group(['middleware' => ['verify-api','auth:sanctum']],  function (){
    Route::post('user/logout',[AuthController::class,'logout']);
    Route::resource('cities',\App\Http\Controllers\SuperAdminApi\Settings\CitiesController::class);
    Route::resource('districts',\App\Http\Controllers\SuperAdminApi\Settings\DistrictsController::class);
    Route::resource('restaurant-types',\App\Http\Controllers\SuperAdminApi\Settings\RestaurantTypesController::class);
    Route::resource('restaurants',\App\Http\Controllers\SuperAdminApi\SubscribedPlacesController::class);
    Route::resource('events',\App\Http\Controllers\SuperAdminApi\EventsController::class);
    Route::resource('restaurant-users',\App\Http\Controllers\SuperAdminApi\RestCustomersController::class);
    Route::resource('customers',\App\Http\Controllers\SuperAdminApi\CustomersController::class);
    Route::resource('super-users',\App\Http\Controllers\SuperAdminApi\SuperAdminUserController::class);
    Route::post('events/customer-registration',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'eventCustomerRegister']);
    Route::get('customer-registrations',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'eventCustomers']);
    Route::resource('sliders',\App\Http\Controllers\SuperAdminApi\Settings\SlidersController::class);

});







/****************Admin Api ************************/
Route::group(['prefix' => 'adapi', 'middleware' => ['verify-api']],function (){
  Route::post('admin/login',[AuthAdminController::class,'login']);
  Route::post('admin/register',[AuthAdminController::class,'register']);
  Route::post('forgot-password',[AuthAdminController::class,'forgotPassword']);
});
Route::group(['prefix' => 'adapi', 'middleware' => ['verify-api','auth:sanctum']],function (){
   Route::post('admin/logout',[AuthAdminController::class,'logout']);
   Route::resource('customers',\App\Http\Controllers\SuperAdminApi\CustomersController::class);
   Route::resource('events',\App\Http\Controllers\SuperAdminApi\EventsController::class);
    Route::post('events/customer-registration',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'eventCustomerRegister']);
    Route::get('customer-registrations',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'eventCustomers']);
    Route::resource('restaurants',\App\Http\Controllers\SuperAdminApi\SubscribedPlacesController::class);
    Route::resource('restaurant-users',\App\Http\Controllers\SuperAdminApi\RestCustomersController::class);


});



/****************Front Api ************************/

Route::group(['prefix' => 'fapi'],function (){
    Route::post('customer/login',[AuthFrontController::class,'login']);
    Route::post('customer/register',[AuthFrontController::class,'register']);
    Route::put('customers/update/{id}',[AuthFrontController::class,'updateUser']);
    Route::post('forgot-password',[AuthFrontController::class,'forgotPassword']);
    Route::post('customer-event-registration',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'eventAndCustomerRegister']);
    Route::get('events',[\App\Http\Controllers\SuperAdminApi\EventsController::class,'index']);
    Route::get('restaurants',[\App\Http\Controllers\SuperAdminApi\SubscribedPlacesController::class,'index']);
    Route::get('restaurant-types',[\App\Http\Controllers\SuperAdminApi\Settings\RestaurantTypesController::class,'index']);
    Route::get('sliders',[\App\Http\Controllers\SuperAdminApi\Settings\SlidersController::class,'index']);
});
Route::group(['prefix' => 'fapi','middleware' => ['auth:sanctum']],function (){
    Route::post('customer/logout',[AuthFrontController::class,'logout']);
});
