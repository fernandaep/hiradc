<?php

namespace App\Http\Controllers;

use App\Models\Register;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Register::latest()->get();
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
            'unit_kerja' => 'required',
            'Lokasi' => 'required',
            'pengendalian' => 'required',
            'kemungkinan_id' => 'required',
            'konsekuensi_id' => 'required',
            'tingkat_resiko' => 'required',
            'status_regulasi' => '',
            'aspek_lingkungan' => '',
            'peluang' => 'required',
            'resiko' => 'required',
            'resiko_diteloransi' => 'required',
            'cakupan_resiko'=> 'required',
            'status_program' => 'required',
            'program'=> 'required',

        ]);
        $register = Register::create([
            'unit_kerja'=> request('unit_kerja'),
            'Lokasi'=> request('Lokasi'),
            'pengendalian'=> request('pengendalian'),
            'kemungkinan_id'=> request('kemungkinan_id'),
            'konsekuensi_id'=> request('konsekuensi_id'),
            'status_regulasi'=> request('peluang'),
            'aspek_lingkungan'=> request('aspek_lingkungan'),
            'peluang'=> request('peluang'),
            'resiko'=> request('resiko'),
            'resiko_diteloransi'=> request('resiko_diteloransi'),
            'cakupan_resiko'=> request('cakupan_resiko'),
            'status_program'=> request('status_program'),
            'program'=> request('program'),
        ]);
        
        if($register) {
            return response()->json([
                'success' => true,
                'message' => 'Register Created',
                'data'    => $register
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Condition Failed to Save',
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
        return Register::findorFail($id);
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
            'Lokasi' => 'required',
            'pengendalian' => 'required',
            'kemungkinan_id' => 'required',
            'konsekuensi_id' => 'required',
            'tingkat_resiko' => 'required',
            'status_regulasi' => '',
            'aspek_lingkungan' => '',
            'peluang' => 'required',
            'resiko' => 'required',
            'resiko_diteloransi' => 'required',
            'cakupan_resiko'=> 'required',
            'status_program' => 'required',
            'program'=> 'required',

        ]);
        $register = Register::findOrFail($id);
        $register->update($request->all());

        if($register) {
            return response()->json([
                'success' => true,
                'message' => 'Register Updated',
                'data'    => $register
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Register Failed to Update',
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
        $register = Register::findorfail($id);
        $register->delete();
        return response()->json([
            'message' => 'Register deleted successfully'
        ]);
    }
}
