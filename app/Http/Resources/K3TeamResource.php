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
            'karyawan_nik' => $this->karyawan_nik,
            'nip' => $this->karyawan->nik,
            'nama' => $this->karyawan->nama,
            'unitkerja' => $this->karyawan->unit,
            'unit_kerja' => $this->unit_kerja,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    } 
}
