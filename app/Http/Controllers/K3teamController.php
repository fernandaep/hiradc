<?php

namespace App\Http\Controllers;

use App\Http\Resources\K3TeamResource;
use App\Models\K3team;
use Illuminate\Http\Request;
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
        $k3team = K3team::latest()->get();
        return K3TeamResource::collection($k3team);

        /* // validate request
        $this->validate($request, [
            'email' => 'bail|required|email',
            'password' => 'bail|required|min:6',
        ]);
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $k3team = Auth::k3team();
            if ($k3team->role->isAdmin == 0) {
                Auth::logout();
                return response()->json([
                    'msg' => 'Incorrect login details',
                ], 401);
            }
            return response()->json([
                'msg' => 'You are logged in',
                'user' => $k3team,
            ]);
        } else {
            return response()->json([
                'msg' => 'Incorrect login details',
            ], 401);
        }

          // first check if you are loggedin and admin user ...
        //return Auth::check();

        if (!Auth::check() && $request->path() != 'login') {
            return redirect('/login');
        }

        if (!Auth::check() && $request->path() == 'login') {

            return view('welcome');
        }
        // you are already logged in... so check for if you are an admin user..
        $k3team = Auth::user();
        if ($user->userType == 'Admin') {
            return redirect('/login');
        }
        if ($request->path() == 'login') {
            return redirect('/');
        }

        return $this->checkForPermission($user, $request); */
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
        $k3team= K3team::create([
            'activity_id' => request('activity_id'),
            'nama'=> request('nama'),
            'email'=> request('email'),
            'password'=> request('password'),
           /*  'usertype'=> request('usertype'), */
        ]);
        
        if($k3team) {
            return response()->json([
                'success' => true,
                'message' => 'K3Team Created',
                'data'    => $k3team
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'K3Team Failed to Save',
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
        return K3team::findorFail($id);
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
       
        $k3team = K3team::findOrFail($id);
        $k3team->update($request->all());

        if($k3team) {
            return response()->json([
                'success' => true,
                'message' => 'K3Team Updated',
                'data'    => $k3team
            ], 200);
        }
        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'K3team Failed to Update',
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
        $k3team = K3team::findorfail($id);
        $k3team->delete();
        return response()->json([
            'message' => 'K3Team deleted successfully'
        ]);
    }

    public function adminlogin(Request $request)
    {
        // validate request
        if (K3team::create([ 'email'=> request('email'),
        'password'=> request('password')])) {
            $k3team = Auth::k3team();
            if ($k3team->role->isAdmin == 0) {
                Auth::logout();
                return response()->json([
                    'success' => false,
                    'message' => 'Incorrect login details',
                ], 409);
            }
            return response()->json([
                'success' => true,
                'message' => 'You are logged in',
                'data'    => $k3team
            ], 200);
        } else {
            return response()->json([
                'message' => 'Incorrect login details',
            ], 401);
        }
    }

  
}
