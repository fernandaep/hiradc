<?php

namespace App\Http\Controllers;

use App\Models\Possibility;
use Illuminate\Http\Request;


class PossibilityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Possibility::latest()->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
  
    public function store(Request $request)
    {
        request()->validate([
            'nama' => 'required',
            'nilai' => 'required',
            'keterangan' => 'required',
        ]);
        $possibility = Possibility::create([
            'nama'=> request('nama'),
            'nilai'=> request('nilai'),
            'keterangan'=> request('keterangan'),
        ]);
        
        if($possibility) {
            return response()->json([
                'success' => true,
                'message' => 'Possibility Created',
                'data'    => $possibility
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Possibility Failed to Save',
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
        return Possibility::findorFail($id);
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
            'nilai' => 'required',
            'keterangan' => 'required',
        ]);
        $possibility = Possibility::findOrFail($id);
        $possibility->update($request->all());

        if($possibility) {
            return response()->json([
                'success' => true,
                'message' => 'Possibility Updated',
                'data'    => $possibility
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Possibility Failed to Update',
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
        $possibility = Possibility::findorfail($id);
        $possibility->delete();
        return response()->json([
            'message' => 'Possibility deleted successfully'
        ]);
    }
}
