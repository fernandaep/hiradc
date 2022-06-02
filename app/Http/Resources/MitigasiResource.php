<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MitigasiResource extends JsonResource
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
            'register_id' => $this->register_id,
            /* 'register' => $this->register->activity, */
            'program_mitigasi' => $this->program_mitigasi,
            'possibility_id' => $this->possibility_id,
            /* 'possibilitynama'  => $this->possibility->nama, */
            /* 'possibilitynilai'  => $this->possibility->nilai,
            'possibilityketerangan'  => $this->possibility->keterangan, */
            'consequence_id' => $this->consequence_id,
            /* 'consequencenilai'  => $this->consequence->nilai, */
            'tingkat_resiko' => $this->tingkat_resiko,
            'aspek_lingkungan' => $this->aspek_lingkungan,
            'resiko_ditoleransi' => $this->resiko_ditoleransi,
            'keterangan' => $this->keterangan,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
