<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->string('EventName');
            $table->bigInteger('restaurant_id');
            $table->longText('EventDescription');
            $table->boolean('Status');
            $table->string('Banner');
            $table->dateTime('StartDateTime');
            $table->dateTime('EndDateTime');
            $table->foreign('restaurant_id')->references('id')->on('subscribed_places')->onDelete('set null')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
