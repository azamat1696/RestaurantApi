<?php

namespace App\Mail;

use App\Models\Events;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendEventToCustomers extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $eventId;
    public $customer;
    public function __construct($eventId,$customer)
    {
        $this->customer = $customer;
        $this->eventId = $eventId;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $event = Events::where('id','=',$this->eventId)->first();
        $customer = $this->customer;
        return $this->markdown('mail.send-event-to-customers',compact('event','customer'))->subject('Rezervasyon bilgilerii');
    }
}
