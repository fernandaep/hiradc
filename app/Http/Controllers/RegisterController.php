<?php

namespace App\Http\Controllers;

use App\Http\Resources\RegisterResource;
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
        $register = Register::latest()->get();
        return RegisterResource::collection($register);
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
            'activity' => 'required',
            'lokasi' => 'required',
            'condition_id' => '',
            'threat_id' => 'required',
            'pengendalian' => 'required',
            'possibility_id' => 'required',
            'consequence_id' => 'required',
            'tingkat_resiko' => 'required',
            'status_regulasi' => '',
            'aspek_lingkungan' => '',
            'peluang' => 'required',
            'resiko' => 'required',
            'resiko_ditoleransi' => 'required',
            'cakupan_resiko' => 'required',
            'status_program' => 'required',
            'program' => 'required',
           
        ]);
        $register = Register::create([
            'activity' => request('activity'),
            'lokasi'=> request('lokasi'),
            'condition_id' => request('condition_id'),
            'threat_id' => request('threat_id'),
            'pengendalian'=> request('pengendalian'),
            'possibility_id'=> request('possibility_id'),
            'consequence_id'=> request('consequence_id'),
            'tingkat_resiko'=> request('tingkat_resiko'),
            'status_regulasi'=> request('peluang'),
            'aspek_lingkungan'=> request('aspek_lingkungan'),
            'peluang'=> request('peluang'),
            'resiko'=> request('resiko'),
            'resiko_ditoleransi'=> request('resiko_ditoleransi'),
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
        $register = Register::findOrFail($id);
        return $register;
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
