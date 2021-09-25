<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Models\MenuModel;
use App\Models\BukomModel;
use Session;
use Validator,Response,File;

class BukomController extends Controller
{
    public function index(Request $request){
    	
    	if ($request->session()->has('id')) {
            $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
    		return view('_Bukom.Bukom',$data);
		}else{
			return \App::call('App\Http\Controllers\Awal@index');
		}
    }

    public function show_bukom(Request $request)
    {
        
        $div = view('_Bukom.List_bukom');
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

    public function Save_bukom(Request $request)
    {
        $penerima = $request->mdl_add_bukom_penerima;

        if (count($penerima) >= 1){
            date_default_timezone_set('Asia/Jakarta');
            $subyek = $request->mdl_add_bukom_subyek;
            $isi = $request->mdl_add_bukom_isi;
            $status = $request->mdl_add_status;
            
            if($subyek=='' or $subyek==null){
                $respon='GAGAL';
                $msg='Subject is null!';
            }else{
                if ($status == 'on'){
                    $status = 'Send';
                    $date_send = date('Y-m-d H:i:s');
                }else{
                    $status = 'Draft';
                    $date_send = null;
                }

                if ($request->file('mdl_add_bukom_lampiran1') == null) {
                    $lampiran1 = null;
                    $nm_file1 = null;
                    $size1 = null;
                }else{
                    $size1 = $request->file('mdl_add_bukom_lampiran1')->getSize();
                    if ($size1 <= 10240000){
                        $size1 = round($size1/1024);
                        $size1 = $size1.' KB';
                        $input = $request->all();
                        $nm_file1 = $request->mdl_add_bukom_lampiran1->getClientOriginalName();
                        $lampiran1 = time().'.'.$request->mdl_add_bukom_lampiran1->getClientOriginalExtension();

                        $path = public_path('upload/'.Session::get('kd_smt_active').'/bukom/');
                        if(!File::isDirectory($path)){
                            File::makeDirectory($path, 0777, true, true);
                        }

                        $request->mdl_add_bukom_lampiran1->move(public_path('upload/'.Session::get('kd_smt_active').'/bukom/'),$lampiran1);
                    }else{
                        $respon='GAGAL';
                        $msg='attachment 1 more than 10 MB';
                    }
                     
                }

                if ($request->file('mdl_add_bukom_lampiran2') == null) {
                    $lampiran2 = null;
                    $nm_file2 = null;
                    $size2 = null;
                }else{
                    $size2 = $request->file('mdl_add_bukom_lampiran2')->getSize();
                    if ($size2 <= 10240000){
                        $size2 = round($size2/1024);
                        $size2 = $size2.' KB';
                        $input = $request->all();
                        $nm_file2 = $request->mdl_add_bukom_lampiran2->getClientOriginalName();
                        $lampiran2 = time().'.'.$request->mdl_add_bukom_lampiran2->getClientOriginalExtension();

                        $path = public_path('upload/'.Session::get('kd_smt_active').'/bukom/');
                        if(!File::isDirectory($path)){
                            File::makeDirectory($path, 0777, true, true);
                        }

                        $request->mdl_add_bukom_lampiran2->move(public_path('upload/'.Session::get('kd_smt_active').'/bukom/'),$lampiran2); 
                    }else{
                        $respon='GAGAL';
                        $msg='attachment 2 more than 10 MB';
                    }
                }

                if ($request->file('mdl_add_bukom_lampiran3') == null) {
                    $lampiran3 = null;
                    $nm_file3 = null;
                    $size3 = null;
                }else{
                    $size3 = $request->file('mdl_add_bukom_lampiran3')->getSize();
                    if ($size3 <= 10240000){
                        $size3 = round($size3/1024);
                        $size3 = $size3.' KB';
                        $input = $request->all();
                        $nm_file3 = $request->mdl_add_bukom_lampiran3->getClientOriginalName();
                        $lampiran3 = time().'.'.$request->mdl_add_bukom_lampiran3->getClientOriginalExtension();

                        $path = public_path('upload/'.Session::get('kd_smt_active').'/bukom/');
                        if(!File::isDirectory($path)){
                            File::makeDirectory($path, 0777, true, true);
                        }

                        $request->mdl_add_bukom_lampiran3->move(public_path('upload/'.Session::get('kd_smt_active').'/bukom/'),$lampiran3); 
                    }else{
                        $respon='GAGAL';
                        $msg='attachment 3 more than 10 MB';
                    }
                }

                $insert = BukomModel::add_bukom($request->session()->get('username'),$subyek,$isi,$lampiran1,$size1,$nm_file1,$lampiran2,$size2,$nm_file2,$lampiran3,$size3,$nm_file3,$status,$date_send);

                if($insert){
                    foreach ($penerima as $key) {
                        BukomModel::add_penerima($insert,$key);
                    }
                    $respon='SUKSES';
                    $msg='';
                }else{
                    $respon='GAGAL';
                    $msg='Something is wrong!';
                }
            }
        }else{
            $respon='GAGAL';
            $msg='Recipients is null!';
        }
        

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Show_detail_bukom(Request $request)
    {
        $data['id_bukom'] = $id_bukom = $request->id_bukom;
        $data['bukom'] = BukomModel::Get_bukom($id_bukom);
        $data['penerima'] = BukomModel::Get_bukom_penerima($id_bukom);
        $data['reply'] = BukomModel::Get_bukom_reply($id_bukom);
        $div = view('_Bukom.Detail_bukom',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Send_bukom(Request $request)
    {
        $id_bukom = $request->id_bukom;
        $status = $request->status;

        $update = BukomModel::Update_send_bukom($id_bukom,$status);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Reply_bukom(Request $request)
    {
        $id_bukom = $request->mdl_reply_bukom_id_bukom;
        $isi_reply = $request->mdl_reply_bukom_reply;

        $insert = BukomModel::reply_bukom($request->session()->get('username'),$id_bukom,$isi_reply);

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

}
