<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use Illuminate\Http\Request;

class ActivityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$activity = Activity::paginate(5)->toArray();
        return Activity::latest()->get();
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
        $activity = Activity::create([
            'nama'=> request('nama'),
        ]);
        
        if($activity) {
            return response()->json([
                'success' => true,
                'message' => 'Activity Created',
                'data'    => $activity
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Activity Failed to Save',
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
        return Activity::findorFail($id);
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
        $activity = Activity::findOrFail($id);
        $activity->update($request->all());

        if($activity) {
            return response()->json([
                'success' => true,
                'message' => 'Activity Updated',
                'data'    => $activity
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Activity Failed to Update',
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
        $activity = Activity::findorfail($id);
        $activity->delete();
        return response()->json([
            'message' => 'Activity deleted successfully'
        ]);
    }
}
