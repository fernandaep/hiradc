<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Register extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function activity()
    {
        return $this->belongsTo(Activity::class); 
    }
    public function condition()
    {
        return $this->belongsTo(Condition::class); 
    }
    public function threat()
    {
        return $this->belongsTo(Threat::class); 
    }
    public function possibility()
    {
        return $this->belongsTo(Possibility::class); 
    }
    public function consequence()
    {
        return $this->belongsTo(Consequence::class); 
    }
    public function category()
    {
        return $this->belongsTo(Category::class); 
    }
}
