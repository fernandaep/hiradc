<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use Illuminate\Http\Request;

class UnitController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Unit::latest()->get();
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
        ]);
        $unit = Unit::create([
            'unit_kerja'=> request('unit_kerja'),
        ]);
        
        if($unit) {
            return response()->json([
                'success' => true,
                'message' => 'Unit Kerja Created',
                'data'    => $unit
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Unit Kerja Failed to Save',
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
        return Unit::findorFail($id);
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
        $unit = Unit::findOrFail($id);
        $unit->update($request->all());

        if($unit) {
            return response()->json([
                'success' => true,
                'message' => 'Unit Kerja Updated',
                'data'    => $unit
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Unit Kerja Failed to Update',
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
        $unit = Unit::findorfail($id);
        $unit->delete();
        return response()->json([
            'message' => 'Unit Kerja deleted successfully'
        ]);
    }
}
