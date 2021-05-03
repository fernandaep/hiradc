<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Possibility extends Model
{
    use HasFactory;
    
    protected $guarded = [];

    public function register()
    {
        return $this->hasMany(Register::class); 
    }
}
