<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class K3TeamResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'nik' => $this->karyawan_nik,
            'unit'=> $this->unit_id,
            'unit_kerja' => $this->unit->unit_kerja,
            'koordinator' => $this->karyawan->nik,
            'ketua' => $this->karyawan->nik,
            'pic' => $this->karyawan->nik,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    } 
}
