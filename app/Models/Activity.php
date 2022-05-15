<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function register()
    {
        return $this->hasMany(Register::class); 
    }
    public function k3team()
    {
        return $this->hasMany(K3team::class); 
    }
}
