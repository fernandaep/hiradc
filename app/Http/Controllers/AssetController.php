<?php

namespace App\Http\Controllers;

use App\Models\Asset;
use Illuminate\Http\Request;

class AssetController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Asset::latest()->get();
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
            'nama' => 'required',
        ]);
        $asset = Asset::create([
            'nama'=> request('nama'),
        ]);
        
        if($asset) {
            return response()->json([
                'success' => true,
                'message' => 'Asset Created',
                'data'    => $asset
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Asset Failed to Save',
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
        return Asset::findorFail($id);
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
        ]);
        $asset = Asset::findOrFail($id);
        $asset->update($request->all());

        if($asset) {
            return response()->json([
                'success' => true,
                'message' => 'Asset Updated',
                'data'    => $asset
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Asset Failed to Update',
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
        $asset = Asset::findorfail($id);
        $asset->delete();
        return response()->json([
            'message' => 'Asset deleted successfully'
        ]);
    }
}
