<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TestMail extends Mailable
{
    use Queueable, SerializesModels;
    public $newPassword;
    public $user;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($newPassword,$user)
    {
        $this->newPassword = $newPassword;
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $password = $this->newPassword;
        $user = $this->user;
        return $this->markdown('emails.sample-mail',compact('password','user'))->subject("Etkinlikler Uygulaması Geçici Şifre");

    }
}
