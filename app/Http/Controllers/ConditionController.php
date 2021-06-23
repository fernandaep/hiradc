<?php

namespace App\Http\Controllers;

use App\Http\Resources\ConditionResource;
use App\Models\Condition;
use Illuminate\Http\Request;

class conditionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $condition = Condition::latest()->get();
        return ConditionResource::collection($condition);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $condition = Condition::create([
            'category_id' => request('category_id'),
            'nama'      => request('nama'),
        ]);

        if ($condition) {
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

    public function showkat($id)
    {
        return Condition::where('category_id',$id)->get();
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

        if ($condition) {
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
