<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use App\Http\Awal;
use Session;
use App\Models\DashboardModel;
use App\Models\MenuModel;
use App\Models\MataPelajaranModel;
use App\Models\InteractiveModel;
use App\Models\ParentModel;
use Validator,Response,File;
use PDF;
use QrCode;

class ParentController extends Controller
{
    public function Parent_tlm_int(Request $request)
    {
        
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;
        // echo 
        // $div = view('MataPelajaran.Week',$data);
        $div = view('Parent.Tlm',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_tlm(Request $request)
    {
        
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;

        $data['data'] = ParentModel::parent_data_tlm($minggu,$request->session()->get('username'));

        $div = view('Parent.Teaching_learning_material',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_tlm_detail(Request $request)
    {
        $id_materi = $id = $request->id;
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;
        $get_data = MataPelajaranModel::get_data_tlm_weekly_by_id($id_materi);
        $data['tlm'] = $get_data;
        $data['slide'] = MataPelajaranModel::get_data_tlm_slide($id_materi);

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Parent.Teaching_learning_material_detail',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_show_tlm_slide_lmp(Request $request)
    {
        
        $id_tlm = $request->id_detail;
        $id_lmp = $request->id_lmp;
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;

        $data['lmp'] = MataPelajaranModel::get_data_tlm_slide_by_id($id_lmp);

        $data['id_tlm'] = $id_tlm;


        // $div = view('MataPelajaran.Week',$data);
        $div = view('Parent.Teaching_learning_material_lampiran',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_int(Request $request)
    {
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;
        $data['data'] = ParentModel::get_data_interactive($minggu,$request->session()->get('username'));
        $data['username'] = $request->session()->get('username');

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Parent.Interactive',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_show_file_interactive(Request $request)
    {
        
        
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;
        $id_interactive = $request->id;
        $data['id_interactive'] = $id_interactive;
        $data['name_interactive'] = $request->name;
        $data['file_upload'] = $request->file_upload;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Parent.Interactive_file',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_Show_file_response_interactive_upload(Request $request)
    {
        $minggu = $request->minggu;
        $data['minggu'] = $minggu;
        $id_interactive = $request->id;
        $data['state_interactive'] = $state_interactive = $request->state;
        $data['name_interactive'] = $name_interactive = $request->name;

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);  
        $data['file'] = $get->file;
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $div = view('Parent.show_file_Interactive_response_upload',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';  

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_Response_interactive_canvas(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $get = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['link_canvas'] = $get->link_canvas;
 
        $div = view('Parent.Interactive_response_canvas',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';   

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_Show_canvas_response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);  
        // $data['file'] = $get->file;
        $get_link_canvas = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['link_canvas'] = $get_link_canvas->link_canvas;
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $div = view('Parent.show_Interactive_response_canvas',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';  

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_Response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');

        $cek = InteractiveModel::cek_responses($request->session()->get('username'),$id_interactive);  
        if($cek<=0){
            if($date_now >= $date_from && $date_now <= $date_to){
                $data['question'] = ParentModel::get_question_interactive_from_parent($id_interactive);
                $div = view('Parent.Interactive_response',$data);
                $div=$div->render();
                $respon='SUKSES';
                $msg='';
            }else{
                $div='';
                $respon='GAGAL';
                $msg='Off schedulle !!!';
            }
        }else{
            $div='';
            $respon='GAGAL';
            $msg='You have finished !!!';
        } 

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Parent_Show_response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $data['question'] = ParentModel::show_get_question_interactive($id_interactive);
        
        $div = view('Parent.show_Interactive_response',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    
}
