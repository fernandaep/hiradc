<?php

namespace App\Http\Controllers;

use App\Models\Consequence;
use Illuminate\Http\Request;

class ConsequencesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Consequence::latest()->get();
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
            'nilai' => 'required',
            'konsekuensi' => 'required',
            'financial' => 'required',
            'objective' => 'required',
            'legal' => 'required',
            'biaya' => 'required',
            'reputasi' => 'required',
            'cakupan'=>'cakupan',
            'lama_pemulihan'=> 'lama_pemulihan',
            'lama_penyimpangan'=> 'lama_penyimpangan',
            'product_image'=> 'product_image',
            'dampak_sosial'=> 'dampak_sosial',

        ]);
        $consequence = Consequence::create([
            'nilai'=> request('nilai'),
            'konsekuensi'=> request('konsekuensi'),
            'financial'=> request('financial'),
            'objective'=> request('objective'),
            'legal'=> request('legal'),
            'biaya'=> request('biaya'),
            'reputasi'=> request('reputasi'),
            'cakupan'=> request('cakupan'),
            'lama_pemulihan'=> request('lama_pemulihan'),
            'lama_penyimpangan'=> request('lama_penyimpangan'),
            'product_image'=> request('product_image'),
            'dampak_sosial'=> request('dampak_sosial'),

        ]);
        
        if($consequence) {
            return response()->json([
                'success' => true,
                'message' => 'Consequence Created',
                'data'    => $consequence
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Consequence Failed to Save',
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
        return Consequence::findorFail($id);
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
            'nilai' => 'required',
            'konsekuensi' => 'required',
            'financial' => 'required',
            'objective' => 'required',
            'legal' => 'required',
            'biaya' => 'required',
            'reputasi' => 'required',
            'cakupan'=>'cakupan',
            'lama_pemulihan'=> 'lama_pemulihan',
            'lama_penyimpangan'=> 'lama_penyimpangan',
            'product_image'=> 'product_image',
            'dampak_sosial'=> 'dampak_sosial',


        ]);
        $consequence = Consequence::findOrFail($id);
        $consequence->update($request->all());

        if($consequence) {
            return response()->json([
                'success' => true,
                'message' => 'Consequence Updated',
                'data'    => $consequence
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Consequence Failed to Update',
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
        $consequence = Consequence::findorfail($id);
        $consequence->delete();
        return response()->json([
            'message' => 'Consequence deleted successfully'
        ]);
    }
}
