<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class K3teamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = User::latest()->get();
        return ($user);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      /*   request()->validate([
            'nama' => 'required',
            'email' => 'bail|required|email',
            'password' => 'bail|required|min:6',
         
            
        ]); */
        /* $password = bcrypt($request->password); */
        $user= User::create([
            'name'          => request('name'),
            'email'         => request('email'),
            'password'      => Hash::make($request->password),
            'level'         => request('level'),
        ]);
        
        if($user) {
            return response()->json([
                'success' => true,
                'message' => 'User Created',
                'data'    => $user
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'User Failed to Save',
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
        return User::findorFail($id);
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
       
        $user = User::findOrFail($id);
        $user->update($request->all());

        if($user) {
            return response()->json([
                'success' => true,
                'message' => 'User Updated',
                'data'    => $user
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'User Failed to Update',
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
        $user = User::findorfail($id);
        $user->delete();
        return response()->json([
            'message' => 'user deleted successfully'
        ]);
    }


  
}
