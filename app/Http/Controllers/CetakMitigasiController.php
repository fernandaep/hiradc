<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CetakMitigasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    public function exportmitigasi($tglawal,$tglakhir,$unit)
    {
        $tglawal1   = $tglawal." 00:00:00";
        $tglakhir1  = $tglakhir." 23:59:59";
        $units = $tglakhir.'unit_id';
        //$data =DB::table('registers')->whereBetween('created_at',[$tglawal1,$tglakhir1])->get(); 
        $dataRegister =Register::whereBetween('created_at',[$tglawal1,$tglakhir1])->get();
        $units=Register::where('unit_id',[$units])->get();
        $data = [
            'dataRegister'=>$dataRegister,
            'tglawal' =>$tglawal,
            'tglakhir' =>$tglakhir,
            'unit' =>$units,
        ];
        view()->share('data',$data);
        $pdf = PDF::loadView('datamitigasi');
    
        return $pdf->download('Dokumen.pdf');
        //return $data;
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
