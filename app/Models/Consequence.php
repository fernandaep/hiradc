<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Consequence extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(Category::class); 
    }

    public function register()
    {
        return $this->hasMany(Register::class); 
    }
    public function mitigasi()
    {
        return $this->hasMany(Mitigasi::class); 
    }
}
