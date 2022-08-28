<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubscribedPlaces extends Model
{
    use HasFactory;
    protected $fillable = [
        'PlaceName',
        'city_id',
        'district_id',
        'rest_type_id',
        'Status',
        'PlaceAddress',
        'Positions',
        'Banner',
        'PlaceLogo',
        'Descriptions',
        'email',
        'phone',
        'MembershipPackage',
        'IsArchived'
    ];
}
