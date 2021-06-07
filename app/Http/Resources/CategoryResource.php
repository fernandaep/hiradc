<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
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
            'nama' => $this->nama,
            'vulnerability' => VulnerabilityResource::collection($this->vulnerability),
            'condition' => ConditionResource::collection($this->condition),
            'term' => TermResource::collection($this->term),
            'consequence' => ConsequenceResource::collection($this->consequence),
        ];
        //return parent::toArray($request);

    }
}
