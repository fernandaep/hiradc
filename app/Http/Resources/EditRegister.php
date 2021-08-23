<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EditRegister extends JsonResource
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
            'category_id' => $this->category_id,
            'category' => $this->category->nama,
            'condition_id' => $this->condition_id,
            'condition' => $this->condition->nama,
            'threat_id' => $this->threat_id,
            'threat' => $this->threat->nama ,
            'vulnerability_id' => $this->vulnerability_id ,
            'vulnerability' => $this->vulnerability->nama ,
            'possibility_id' => $this->possibility_id,
           'possibilitynilai'  => $this->possibility->nilai, 
            'consequence_id' => $this->consequence_id,
            'consequencenilai' => $this->consequence->nilai,
        ];
    }
}
