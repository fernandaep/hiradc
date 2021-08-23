<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Threat extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function term()
    {
        return $this->belongsTo(Term::class); 
    }
    public function category()
    {
        return $this->belongsTo(Category::class); 
    }

    public function register()
    {
        return $this->hasMany(Register::class); 
    }

    
}
