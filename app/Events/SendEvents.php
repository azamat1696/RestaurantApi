<?php

namespace App\Events;

use App\Models\Events;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SendEvents
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    public $event;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Events $event)
    {
        $this->event = $event;
    }


}
