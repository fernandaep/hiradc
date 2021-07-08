<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use Illuminate\Http\Request;

class KaryawanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Karyawan::latest()->get();
    }

    public function show($id)
    {
        return Karyawan::findorFail($id);
    }

    public function getunit($nik)
    {
        return Karyawan::where('unit','  ',$nik)->get();
    }

    public function getkoor($nik)
    {
        return Karyawan::where('band','II' ,$nik)->get();
    }
    public function getketua($nik)
    {
        return Karyawan::where('band','III',$nik)->get();
    }
    public function getpic($nik)
    {
        return Karyawan::where('band','IV',$nik)->get();
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
