<?php

namespace App\Http\Controllers\SuperAdminApi;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class ReservationsController extends Controller
{
       public function index() {

           return response()->json(
               DB::table('reservations')
               ->where('restaurant_id',auth()->user()->restaurant_id)
               ->whereDate('EventEndDateTime','>=',Carbon::now())
               ->get()
           );
       }
       public function getReservations(){
           return response()->json(
               DB::table('reservations')
                   ->whereDate('EventEndDateTime','>=',Carbon::now())
                   ->get()
           );
       }
}
