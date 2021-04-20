<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TermResource extends JsonResource
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
            'kode' => $this->kode,
            'istilah' => $this->istilah,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
        //return parent::toArray($request);
    }
}
