<?php

namespace App\Http\Controllers;

use App\Http\Resources\ThreatResource;
use App\Models\Threat;
use Illuminate\Http\Request;


class ThreatController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $threat = Threat::latest()->get();
        return ThreatResource::collection($threat);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $threat = Threat::create([
            'term_id' => request('term_id'),
            'nama'=> request('nama'),
        ]);
        
        if($threat) {
            return response()->json([
                'success' => true,
                'message' => 'Threat Created',
                'data'    => $threat
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Threat Failed to Save',
        ], 409);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Threat::findorFail($id);
    }

    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'nama' => 'required',
        ]);
        $threat = Threat::findOrFail($id);
        $threat->update($request->all());

        if($threat) {
            return response()->json([
                'success' => true,
                'message' => 'Threat Updated',
                'data'    => $threat
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Threat Failed to Update',
        ], 409);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $threat = Threat::findorfail($id);
        $threat->delete();
        return response()->json([
            'message' => 'Threat deleted successfully'
        ]);
    
    }
}
