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
            'nama' => $this->nama,
            'email' => $this->email,
            'password' => $this->password,
            'activity_id' => $this->activity_id,
            /* 'activity' => $this->activity->nama, */
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    } 
}
