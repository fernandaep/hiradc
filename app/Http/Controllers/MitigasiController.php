<?php

namespace App\Http\Controllers;

use App\Http\Resources\MitigasiResource;
use App\Models\Mitigasi;
use Illuminate\Http\Request;

class MitigasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mitigasi = Mitigasi::latest()->get();
        return MitigasiResource::collection($mitigasi);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $mitigasi = Mitigasi::create([
            'register_id' => request('register_id'),
            'program_mitigasi'=> request('program_mitigasi'),
            'possibility_id' => request('possibility_id'),
            'consequence_id' => request('consequence_id'),
            'tingkat_resiko'=> request('tingkat_resiko'),
            'aspek_lingkungan'=> request('aspek_lingkungan'),
            'resiko_ditoleransi'=> request('resiko_ditoleransi'),
            /* 'keterangan' => request('keterangan'), */
        ]);
        
        if($mitigasi) {
            return response()->json([
                'success' => true,
                'message' => 'Mitigasi Created',
                'data'    => $mitigasi
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Mitigasi Failed to Save',
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
        return Mitigasi::findorFail($id);
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
            'program_mitigasi' => 'required',
            'tingkat_resiko' => 'required',
            'aspek_lingkungan' => 'required',
            'resiko_ditoleransi' => 'required',
        ]);
        $mitigasi = Mitigasi::findOrFail($id);
        $mitigasi->update($request->all());

        if($mitigasi) {
            return response()->json([
                'success' => true,
                'message' => 'Mitigasi Updated',
                'data'    => $mitigasi
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Mitigasi Failed to Update',
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
        $mitigasi = Mitigasi::findorfail($id);
        $mitigasi->delete();
        return response()->json([
            'message' => 'Mitigasi deleted successfully'
        ]);
    }
}
