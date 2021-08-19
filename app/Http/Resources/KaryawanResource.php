<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class KaryawanResource extends JsonResource
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
            'karyawan_nik'=> $this->karyawan_nik,
            'unit'=> $this->unit_id,
            'unit_kerja' => $this->unit->unit_kerja,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
