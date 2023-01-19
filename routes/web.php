<?php

use App\Events\ReservationsEvent;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/broadcast',function (){
    broadcast(new ReservationsEvent());
});
//Route::get('/', function () {
//    return response()->json([
//        'error' => "Unauthorized"
//    ]);
//});
