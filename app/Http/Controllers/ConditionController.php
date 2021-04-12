<?php

namespace App\Http\Controllers;

use App\Models\Condition;
use Illuminate\Http\Request;

class ConditionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Condition::latest()->get();
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
        $condition = Condition::create([
            'nama'=> request('nama'),
        ]);
        
        if($condition) {
            return response()->json([
                'success' => true,
                'message' => 'Condition Created',
                'data'    => $condition
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
        return Condition::findorFail($id);
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
        $condition = Condition::findOrFail($id);
        $condition->update($request->all());

        if($condition) {
            return response()->json([
                'success' => true,
                'message' => 'Condition Updated',
                'data'    => $condition
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Condition Failed to Update',
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
        $condition = Condition::findorfail($id);
        $condition->delete();
        return response()->json([
            'message' => 'Condition deleted successfully'
        ]);
    }
}
