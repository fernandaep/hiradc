<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /* $category = Category::latest()->get();
        return CategoryResource::collection($category); */
        //$category = Category::paginate(2);
        //return $category;
        return Category::latest()->get();
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
        $category = Category::create([
            'nama'=> request('nama'),
        ]);
        
        if($category) {
            return response()->json([
                'success' => true,
                'message' => 'Category Created',
                'data'    => $category
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Category Failed to Save',
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
        return Category::findorFail($id);
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
        $category = Category::findOrFail($id);
        $category->update($request->all());

        if($category) {
            return response()->json([
                'success' => true,
                'message' => 'Category Updated',
                'data'    => $category
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Category Failed to Update',
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
        $category = Category::findorfail($id);
        $category->delete();
        return response()->json([
            'message' => 'Category deleted successfully'
        ]);
    }
}
