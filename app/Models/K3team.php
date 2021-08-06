<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class K3team extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class); 
    }
    public function unit()
    {
        return $this->belongsTo(Unit::class); 
    }
}
