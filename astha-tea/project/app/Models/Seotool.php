<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Seotool extends Model
{
    protected $fillable = ['google_analytics','meta_keys','facebook_pixels','meta_title','meta_description'];
    public $timestamps = false;
}
