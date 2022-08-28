<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Districts extends Model
{
    use HasFactory;
    protected $fillable = [
        'city_id',
        'DistrictName',
        'Positions',
        'Status'
    ];
}
