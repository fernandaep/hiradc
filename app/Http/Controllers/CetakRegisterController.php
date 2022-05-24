<?php

namespace App\Http\Controllers;


use App\Models\Register;
/* use App\Http\Resources\RegisterResource; */
use PDF;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class CetakRegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Register::all();
        view()->share('data',$data);
          $pdf = PDF::loadView('dataregister');
          return $pdf->download('document.pdf');

    }

    public function exportPDF($tglawal,$tglakhir) {
       $data =DB::table('registers')->whereBetween('created_at',[$tglawal,$tglakhir])->get(); 
       view()->share('data',$data);
       $pdf = PDF::loadView('dataregisterpertanggal');
       return $pdf->download('document.pdf');
      }

    public function show($id)
    {
        return Register::findorFail($id);
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
