<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscribedPlacesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscribed_places', function (Blueprint $table) {
            $table->id();
            $table->string('PlaceName')->unique();
            $table->unsignedBigInteger('city_id')->nullable();
            $table->unsignedBigInteger('district_id')->nullable();
            $table->unsignedBigInteger('rest_type_id');
            $table->boolean('Status');
            $table->text('PlaceAdress')->nullable();
            $table->string('Positions')->nullable();
            $table->string('Banner')->nullable();
            $table->string('PlaceLogo')->nullable();
            $table->longText('Descriptions')->nullable();
            $table->string('email');
            $table->string('phone');
            $table->enum('MembershipPackage',[3,6,12])->default(3)->comment('3 , 6, 12 Aylık üyelik');
            $table->boolean('IsArchived')->default(0)->comment('0 ---> not archived , 1 ----> archived');
            $table->foreign('rest_type_id')->references('id')->on('restaurant_types')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('city_id')->references('id')->on('cities')->onDelete('set null')->onUpdate('cascade');
            $table->foreign('district_id')->references('id')->on('districts')->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('subscribed_places');
    }
}
