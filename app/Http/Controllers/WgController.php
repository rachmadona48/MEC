<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\MenuModel;

class WgController extends Controller
{
    public function index(Request $request){
    	
    	if ($request->session()->has('id')) {
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
    		return view('_WG.WG',$data);
		}else{
			// return view('frontend.login');
			return \App::call('App\Http\Controllers\Awal@index');
		}
    }
}
