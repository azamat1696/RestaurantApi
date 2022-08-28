<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MyTestMail extends Mailable
{
    use Queueable, SerializesModels;
    public $password;
    public $user;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($password,$user)
    {
            $this->user = $user;
            $this->password = $password;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $user = $this->user;
        $password = $this->password;
        return $this->markdown('emails.sample-mail',compact('password','user'));
    }
}
