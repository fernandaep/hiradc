<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mitigasi extends Model
{
    use HasFactory;
    protected $guarded = [];
    
    public function Register()
    {
        return $this->belongsTo(Register::class); 
    }
    public function possibility()
    {
        return $this->belongsTo(Possibility::class); 
    }
    public function consequence()
    {
        return $this->belongsTo(Consequence::class); 
    }
}
