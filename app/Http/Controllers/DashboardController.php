<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use App\Http\Awal;
use Session;
use App\Models\DashboardModel;
use App\Models\MataPelajaranModel;
use App\Models\MenuModel;
use Validator,Response,File;
class DashboardController extends Controller
{	

    public function index(Request $request){
    	
    	if ($request->session()->has('id')) {
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
            $data['menu2'] = MenuModel::akses_menu2($request->session()->get('username'),$request->session()->get('level'),$request->session()->get('tipe'));
            // echo db_active();exit();
            $data['walas'] = DashboardModel::getwali_kelas($request->session()->get('username'));
            $data['grade_kelas'] = DashboardModel::getgrade_kelas($request->session()->get('username'));
            
            if($request->session()->get('tipe') == 'siswa'){
                $data['matpel'] = MataPelajaranModel::get_student_matpel($request->session()->get('username'));
                $profile = DashboardModel::getprofile_siswa($request->session()->get('username'));
                $data['kelas_siswa'] = $profile->kelas;
                return view('Dashboard.Dashboard',$data);
            }else if($request->session()->get('tipe') == 'ortu'){
                $data['weekly'] = MataPelajaranModel::get_student_weekly($request->session()->get('username'));
                $profile = DashboardModel::getprofile_siswa($request->session()->get('username'));
                $data['kelas_siswa'] = $profile->kelas;
                return view('Dashboard.Dashboard_parent',$data);
            }else if($request->session()->get('tipe') == 'sdm'){
                $data['grade_sdm'] = DashboardModel::grade_sdm($request->session()->get('username'),$request->session()->get('tipe'));
                return view('Dashboard.Dashboard',$data);
            }
            
    		
		}else{
			// return view('frontend.login');
			return \App::call('App\Http\Controllers\Awal@index');
		}
    }

    public function Profile(Request $request){
    	
    	if ($request->session()->has('id')) {
    		$data=[];
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
            $data['menu2'] = MenuModel::akses_menu2($request->session()->get('username'),$request->session()->get('level'),$request->session()->get('tipe'));
    		if ($request->session()->get('tipe')=='sdm'){
    			$profile = DashboardModel::getprofile_sdm($request->session()->get('username'));
    			$nama ='';
    			if($profile->gelar_depan){
    				$nama = $profile->gelar_depan.' '.$profile->nama.' '.$profile->gelar_belakang;
    			}else{
    				$nama = $profile->nama.' '.$profile->gelar_belakang;
    			}
    			$data['nama'] = $nama;
    			$data['agama'] = $profile->agama;
    			$data['alamat'] = $profile->alamat;
    			$data['tempat_lahir'] = $profile->tempat_lahir;
    			$data['tgl_lahir'] = date('d-m-Y', strtotime($profile->tgl_lahir));
    			$data['gol_darah'] = $profile->gol_darah;
    			$data['kode_pos'] = $profile->kode_pos;
    			$data['no_telp'] = $profile->no_telp;
                $data['email'] = $profile->email;
                $data['tgl_gabung'] = date('d-m-Y', strtotime($profile->tgl_gabung));
                $data['no_induk_pegawai'] = $profile->no_induk_pegawai;
                $data['profesi'] = $profile->profesi;
                return view('Dashboard.Profile_sdm',$data);
    		}else{
                $profile = DashboardModel::getprofile_siswa($request->session()->get('username'));
                $data['nama'] = $profile->nama;
                $data['agama'] = $profile->agama;
                $data['alamat'] = $profile->alamat;
                $data['tempat_lahir'] = $profile->tempat_lahir;
                $data['tgl_lahir'] = date('d-m-Y', strtotime($profile->tgl_lahir));
                $data['gol_darah'] = $profile->gol_darah;
                $data['kode_pos'] = $profile->kode_pos;
                $data['no_telp'] = $profile->no_telp;
                $data['email'] = $profile->email;
                $data['tgl_gabung'] = date('d-m-Y', strtotime($profile->tgl_gabung));
                $data['nisn'] = $profile->nisn;
                $data['profesi'] = $profile->profesi;
                $data['kelas'] = $profile->kelas;
                $data['jurusan'] = $profile->jurusan;
                return view('Dashboard.Profile_siswa',$data);
    		}
    		
		}else{
			// return view('frontend.login');
			return \App::call('App\Http\Controllers\Awal@index');
		}
    }

    public function Add_info(Request $request)
    {
        $id_kelas = $request->mdl_add_kelas;
        $grade = $request->mdl_add_grade;
        $title = str_replace("'","\"",$request->mdl_add_title);
        $description = str_replace("'","\"",$request->mdl_add_description);

        if ($request->file('mdl_add_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_add_file->getClientOriginalExtension();
            $request->mdl_add_file->move(public_path('upload/info'),$file_name); 
        }

        $insert = DashboardModel::add_info($request->session()->get('id'),$id_kelas,$grade,$title,$description,$file_name);
        if($insert){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Div_information(Request $request)
    {
        $data['count_info'] = DashboardModel::count_my_info($request->session()->get('id'),$request->session()->get('username'),$request->session()->get('tipe'));
        $data['info'] = DashboardModel::get_my_info($request->session()->get('id'),$request->session()->get('username'),$request->session()->get('tipe'));
        
        $div = view('Dashboard.Info',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Detail_info(Request $request,$id)
    {
        if ($request->session()->has('id')) {
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
            $data['menu2'] = MenuModel::akses_menu2($request->session()->get('username'),$request->session()->get('level'),$request->session()->get('tipe'));
            $data['detail_info'] = DashboardModel::get_detail_info($id);
            return view('Dashboard.Detail_info',$data);
        }else{
            return \App::call('App\Http\Controllers\Awal@index');
        }
    }

    public function Delete_info(Request $request)
    {
        $id = $request->id;
        $del = DashboardModel::del_info($id);
        if($del){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function edit_info(Request $request)
    {
        $id = $request->id;
        $data= DashboardModel::get_detail_info($id);
        $kode_grade = $data->kode_grade;
        $kode_kelas = $data->kode_kelas;
        $title = $data->title;
        $description = $data->description;

        $info_edit = 'Grade '.$kode_grade.', Class '.$kode_kelas;
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'info_edit' => $info_edit,'title' => $title,'description' => $description);
        echo json_encode($return);
    }

    public function Update_info(Request $request)
    {
        $id = $request->mdl_edit_id;
        $title = str_replace("'","\"",$request->mdl_edit_title);
        $description = str_replace("'","\"",$request->mdl_edit_description);

        if ($request->file('mdl_edit_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_edit_file->getClientOriginalExtension();
            $request->mdl_edit_file->move(public_path('upload/info'),$file_name); 
        }


        $update = DashboardModel::update_info($request->session()->get('id'),$id,$title,$description,$file_name);
        if($update){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Ganti_smt(Request $request)
    {
        $option = "";
        $get = DashboardModel::get_smt();
        if($get){
            foreach ($get as $key) {
                if($key->kode == Session::get('kd_smt_active')){
                    $option .= '<option value="'.$key->kode.'" selected>'.$key->semester.'</option>';
                }else{
                    $option .= '<option value="'.$key->kode.'">'.$key->semester.'</option>';
                }
                
            }
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg,'option' => $option);
        echo json_encode($return);
    }

    public function Ganti_smt2(Request $request)
    {
        $db_active = 'db_mdn_bogor'.substr($request->kd_smt_active, -9);
        // echo $db_active;exit();
        Session::put('smt_active', $request->smt_active);
        Session::put('kd_smt_active', $request->kd_smt_active);
        Session::put('db_active', $db_active);
        $respon='SUKSES';
            
        $return = array('respon' => $respon);
        echo json_encode($return);
    }


}
