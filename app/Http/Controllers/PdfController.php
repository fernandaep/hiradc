<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PdfController extends Controller
{
    public function index()
    {
        $pdf = PDF::loadView('register.index', ['data' => $data]);
        return $pdf->output();
    }

    public function create()
    {
        $pdf = public_path('pdf/test.pdf');
        return response()->download($pdf);
    }
}
