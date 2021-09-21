<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\MenuModel;
use App\Models\BukomModel;

class BukomController extends Controller
{
    public function index(Request $request){
    	
    	if ($request->session()->has('id')) {
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
    		return view('_Bukom.Bukom',$data);
		}else{
			// return view('frontend.login');
			return \App::call('App\Http\Controllers\Awal@index');
		}
    }

    public function show_bukom(Request $request)
    {
        // date_default_timezone_set('Asia/Jakarta');
        // $data['id'] = $id = $request->id;
        // $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        // $data['user_id'] = $request->session()->get('username');

        // $data['discuss'] = MataPelajaranModel::Get_discuss($id);
        // $data['komen'] = MataPelajaranModel::Get_comment($id);
        
        $div = view('_Bukom.List_bukom');
        // $div = view('MataPelajaran.Comment_discuss_parent',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function List_bukom(Request $request)
    {
        $user = $request->session()->get('username');
        $req = $request->input('search.value');
        BukomModel::Get_list($req,$user);
    }

}
