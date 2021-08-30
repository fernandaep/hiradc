<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function K3team()
    {
        return $this->hasMany(K3team::class); 
    }
    public function register()
    {
        return $this->hasMany(Register::class); 
    }
}
