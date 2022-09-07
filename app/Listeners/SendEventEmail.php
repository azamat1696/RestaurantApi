<?php

namespace App\Listeners;

use App\Mail\SendEvents;
use App\Models\Customers;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class  SendEventEmail
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $event = $event->event;
        $customers = Customers::all();
        foreach ($customers as $customer)
        {
            Mail::to($customer->email)->send(new SendEvents($event,$customer));
        }

    }
}
