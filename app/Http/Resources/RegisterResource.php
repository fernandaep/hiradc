<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RegisterResource extends JsonResource
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
            /* 'unit_kerja' => $this->unit_kerja, */
            'category_id' => $this->category_id,
            /* 'category' => $this->category->nama, */
            'activity' => $this->activity,
            /* 'activity' => $this->activity->nama, */
            'lokasi' => $this->lokasi,
            'condition_id' => $this->condition_id,
            /* 'condition' => $this->condition->nama, */
            'threat_id' => $this->threat_id,
            'threat' => $this->threat->nama ,
            'pengendalian' => $this->pengendalian,
            'possibility_id' => $this->possibility_id,
            /* 'possibilitynama'  => $this->possibility->nama,
            'possibilitynilai'  => $this->possibility->nilai,
            'possibilityketerangan'  => $this->possibility->keterangan, */
            'consequence_id' => $this->consequence_id,
            /* 'consequence'  => $this->consequence->nilai, */
            'tingkat_resiko' => $this->tingkat_resiko,
            'status_regulasi' => $this->status_regulasi,
            'aspek_lingkungan' => $this->aspek_lingkungan,
            'peluang' => $this->peluang,
            'resiko' => $this->resiko,
            'resiko_ditoleransi' => $this->resiko_ditoleransi,
            'cakupan_resiko' => $this->cakupan_resiko,
            'status_program' => $this->status_program,
            'program' => $this->program,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
