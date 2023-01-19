<?php

namespace App\Http\Controllers\SuperAdminApi;

use App\Events\SendEvents;
use App\Helpers\FileUploader;
use App\Http\Controllers\Controller;
use App\Http\Requests\EventsRequest;
use App\Mail\SendEventToCustomers;
use App\Mail\TestMail;
use App\Models\Customers;
use App\Models\Events;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use PHPUnit\Exception;


class EventsController extends Controller
{
    protected $filePath ;
    public function __construct()
    {
        $this->filePath = public_path('uploads/eventBanners');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $events = DB::table('event_rest_users')->get();
        return response()->json($events);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(EventsRequest $request)
    {
         $fileName = "no-image.jpg";
         if ($request->hasFile('Banner'))
         {
             $file = new FileUploader($this->filePath,$request->validated()['Banner'],$request->validated()['EventName']);
              $fileName = $file->upload();
         }
         $data = Events::create(['Banner' => $fileName] + $request->validated());
        try {
            SendEvents::dispatch($data);

        } catch (\Exception $exception)
        {
            echo $exception;
        }
         return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Events  $events
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(EventsRequest $request,$id)
    {

        $data = Events::find($id);
        $fileName= $data->Banner;
        if ($request->hasFile('Banner'))
        {
            if ($data->Banner !== 'no-image.jpg')
            {
                try {
                    unlink($this->filePath."/".$data->Banner);
                } catch (\Exception $exception)
                {
                    echo $exception;
                }
            }
            $file = new FileUploader($this->filePath,$request->validated()['Banner'],$request->validated()['EventName']);
            $fileName = $file->upload();

        }
        $data->update(['Banner'=>$fileName] + $request->validated());
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Events  $events
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Events::find($id);
        try {
            unlink($this->filePath."/".$data->Banner);
        } catch (\Exception $e)
        {
            echo $e;
        }
        Events::destroy($id);
    }
    public function eventCustomerRegister(Request $request){
        $validator = Validator::make($request->all(),[
            "event_id" => "required",
            "customer_id" => "required",
        ]);

        $customers = [];
        if ($request->has('customer_id' )){
            DB::table('event_customer_register')->where('event_id','=',$validator->validated()['event_id'])->delete();
            foreach (json_decode($validator->validated()['customer_id']) as $key => $value){
                $customers[] = [
                  'customer_id' => $value,
                  'event_id' => $validator->validated()['event_id']
                ];
            }
        }
           DB::table('event_customer_register')->insert($customers);
        return response()->json(DB::table('eventcustomers')->get());
    }
    public function eventCustomers(){
        return response()->json(DB::table('eventcustomers')->get());
    }
    public function eventAndCustomerRegister(Request $request){
        $validator = Validator::make($request->all(),[
            "name" => "required",
            "surname" => "required",
            "email" => "required|email",
            "phone" => "required",
            "event_id" => "required",
            "guestCustomer" => "required",
        ]);
     $cutomerCheck = Customers::where('email','=',$validator->validated()['email'])->count();
     if($cutomerCheck == 0){
         $newCustomer = Customers::create($validator->validated());
         DB::table('event_customer_register')->insert([
             'customer_id' => $newCustomer->id,
             'event_id' => $validator->validated()['event_id'],
             'guestCustomer' => $validator->validated()['guestCustomer']
             ]);
         try
         {
             Mail::to($newCustomer->email)->send( new SendEventToCustomers($validator->validated()['event_id'],$newCustomer));
             return response()->json(true,200);
         } catch (\Exception $exception)
         {
              echo $exception->getMessage();
         }
         return response()->json(DB::table('eventcustomers')->where('customer_id','=',   $newCustomer->id)->get());
      }
         $cutomerCheck = Customers::where('email','=',$validator->validated()['email'])->first();
         DB::table('event_customer_register')
             ->where('event_id','=',$validator->validated()['event_id'])
             ->where('customer_id',$cutomerCheck->id)->delete();
        $customers = [
            'customer_id' => $cutomerCheck->id,
            'event_id' => $validator->validated()['event_id'],
            'guestCustomer' => $validator->validated()['guestCustomer']
        ];
         DB::table('event_customer_register')->insert($customers);
        try
        {
            Mail::to($cutomerCheck->email)->send( new SendEventToCustomers($validator->validated()['event_id'],$cutomerCheck));
            return response()->json(true,200);
        } catch (\Exception $exception)
        {
            echo $exception->getMessage();
        }
        return response()->json(DB::table('eventcustomers')->where('customer_id','=',   $cutomerCheck->id)->get());
    }
    public function getAllEventCustomers(){
        return response()->json(DB::table('eventcustomers')->get());
    }
}
