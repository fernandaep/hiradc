<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ThreatResource extends JsonResource
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
            'term_id' => $this->term_id,
            /* 'category' => $this->term->category, */
            'kode' => $this->term->kode,
            'istilah' => $this->term->istilah,
            'nama' => $this->nama,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
