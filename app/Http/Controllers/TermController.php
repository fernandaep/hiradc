<?php

namespace App\Http\Controllers;

use App\Http\Resources\TermResource;
use Illuminate\Http\Request;
use App\Models\Term;

class TermController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $term = Term::latest()->get();
        return TermResource::collection($term);
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
            'kode' => 'required',
            'istilah' => 'required',
        ]);
        $term = Term::create([
            'category_id' => request('category_id'),
            'kode'=> request('kode'),
            'istilah'=> request('istilah'),
        ]);
        
        if($term) {
            return response()->json([
                'success' => true,
                'message' => 'Term Created',
                'data'    => $term
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Term Failed to Save',
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
        return Term::findorFail($id);
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
            'kode' => 'required',
            'istilah' => 'required',
        ]);
        $term = Term::findOrFail($id);
        $term ->update($request->all());

        if($term) {
            return response()->json([
                'success' => true,
                'message' => 'Term Updated',
                'data'    => $term
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Term Failed to Update',
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
        $term = Term::findorfail($id);
        $term ->delete();
        return response()->json([
            'message' => 'Term deleted successfully'
        ]);
    }
}
