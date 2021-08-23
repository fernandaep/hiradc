<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function vulnerability()
    {
        return $this->hasMany(Vulnerability::class); 
    }

    public function condition()
    {
        return $this->hasMany(Condition::class); 
    }

    public function term()
    {
        return $this->hasMany(Term::class); 
    }
    public function threat()
    {
        return $this->hasMany(Threat::class); 
    }

    public function consequence()
    {
        return $this->hasMany(Consequence::class); 
    }
    public function register()
    {
        return $this->hasMany(Register::class); 
    }
}
