<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ConsequenceResource extends JsonResource
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
            /* 'nama' => $this->category->category, */
            'nilai' => $this->nilai,
            'konsekuensi' => $this->konsekuensi,
            'financial' => $this->financial,
            'objective' => $this->objective,
            'legal' => $this->legal,
            'biaya' => $this->biaya,
            'reputasi' => $this->reputasi,
            'cakupan' => $this->cakupan,
            'lama_pemulihan' => $this->lama_pemulihan,
            'lama_penyimpangan' => $this->lama_penyimpangan,
            'product_image' => $this->product_image,
            'dampak_sosial' => $this->dampak_sosial,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
