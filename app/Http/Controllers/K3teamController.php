<?php

namespace App\Http\Controllers;

use App\Http\Resources\K3TeamResource;
use App\Models\K3team;
use App\Models\Karyawan;
use Illuminate\Http\Request;

class K3teamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $k3team = K3team::latest()->get();
        return K3TeamResource::collection($k3team);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'karyawan_nik' => request('karyawan_nik'),
            'unit_kerja' => 'required',
        ]);
        $k3team= K3team::create([
            'unit_kerja'=> request('unit_kerja'),
        ]);
        
        if($k3team) {
            return response()->json([
                'success' => true,
                'message' => 'K3Team Created',
                'data'    => $k3team
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'K3Team Failed to Save',
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
        return K3team::findorFail($id);
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
            'unit_kerja' => 'required',
        ]);
        $k3team = K3team::findOrFail($id);
        $k3team->update($request->all());

        if($k3team) {
            return response()->json([
                'success' => true,
                'message' => 'K3Team Updated',
                'data'    => $k3team
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'K3team Failed to Update',
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
        $k3team = K3team::findorfail($id);
        $k3team->delete();
        return response()->json([
            'message' => 'K3Team deleted successfully'
        ]);
    }
    public function KaDept($nik)
    {
        return K3team::where('karyawan_nik','I',$nik)->get();
    }
    public function kaUnit($nik)
    {
        return K3team::where('karyawan_nik', 'II',$nik)->get(); 
    }
    public function sekretaris($nik)
    {
        return K3team::where('karyawan_nik', 'III',$nik)->get();
    }
}
