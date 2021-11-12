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
use Validator,Response,File;
use PDF;
use QrCode;
class InteractiveController extends Controller
{
    

    public function Interactive(Request $request)
    {
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $data['data'] = InteractiveModel::get_data_interactive($request->session()->get('tipe'),$id_pelajaran,$id_week);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['username'] = $request->session()->get('username');

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Interactive.Interactive',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Add_interactive(Request $request)
    {
        $kode_grade = $request->mdl_add_int_kode_grade;
        $id_pelajaran = $request->mdl_add_int_id_pelajaran;
        $id_week = $request->mdl_add_int_id_week;

        $name = $request->mdl_add_int_name;
        $type = $request->mdl_add_int_type;
        $category = $request->mdl_add_int_category;
        $date_from = $request->mdl_add_int_date_from;
        $date_to = $request->mdl_add_int_date_to;

        if ($type=='Canvas') {
            $link_canvas = $request->mdl_add_int_canvas;
        }else{
            $link_canvas = '';
        }

        if ($request->file('mdl_add_int_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_add_int_file->getClientOriginalExtension();

            $path = public_path('upload/'.Session::get('kd_smt_active').'/interactive/');
            if(!File::isDirectory($path)){
                File::makeDirectory($path, 0777, true, true);
            }

            $request->mdl_add_int_file->move(public_path('upload/'.Session::get('kd_smt_active').'/interactive/'),$file_name); 
        }

        $insert = InteractiveModel::add_interactive($request->session()->get('username'),$id_pelajaran,$id_week,$name,$type,$category,$date_from,$date_to,$file_name,$link_canvas);
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

    public function Edit_interactive(Request $request)
    {
        $id = $request->mdl_edit_int_id;

        $name = $request->mdl_edit_int_name;
        $type = $request->mdl_edit_int_type;
        $category = $request->mdl_edit_int_category;
        $date_from = $request->mdl_edit_int_date_from;
        $date_to = $request->mdl_edit_int_date_to;

        if ($type=='Canvas') {
            $link_canvas = $request->mdl_edit_int_canvas;
        }else{
            $link_canvas = null;
        }

        if ($request->file('mdl_edit_int_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_edit_int_file->getClientOriginalExtension();
            $request->mdl_edit_int_file->move(public_path('upload/'.Session::get('kd_smt_active').'/interactive/'),$file_name); 
        }

        $insert = InteractiveModel::edit_interactive($request->session()->get('username'),$id,$name,$type,$category,$date_from,$date_to,$file_name,$link_canvas);
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

    public function Interactive_ubah_state(Request $request)
    {
        $id = $request->id_interactive;
        $state = $request->state;

        $update = InteractiveModel::Update_state($id,$state,$request->session()->get('username'));
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Del_interactive(Request $request)
    {
        $id = $request->id_interactive;

        $update = InteractiveModel::delete_interactive($id);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Show_file_interactive(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $id_interactive = $request->id_interactive;
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['id_interactive'] = $id_interactive;
        $data['name_interactive'] = $request->name_interactive;
        $data['file_upload'] = $request->file_upload;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Interactive.Interactive_file',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_canvas_interactive(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $id_interactive = $request->id_interactive;
        $get = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['id_interactive'] = $id_interactive;
        $data['name_interactive'] = $request->name_interactive;
        $data['link_canvas'] = $get->link_canvas;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Interactive.Interactive_canvas',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_question_interactive(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $id_interactive = $request->id_interactive;
        $data['data'] = InteractiveModel::get_question_interactive($id_pelajaran,$id_week,$id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['id_interactive'] = $id_interactive;
        $data['name_interactive'] = $request->name_interactive;
        $data['state_interactive'] = $request->state_interactive;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Interactive.Interactive_question',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Add_question(Request $request)
    {
        $kode_grade = $request->mdl_add_qt_int_kode_grade;
        $id_pelajaran = $request->mdl_add_qt_int_id_pelajaran;
        $id_week = $request->mdl_add_qt_int_id_week;

        $id_interactive = $request->mdl_add_qt_int_id_interactive;
        $name_question = $request->mdl_add_qt_int_name_question;
        $type = $request->mdl_add_qt_int_type;
        $required = $request->mdl_add_qt_int_required;
        $state = 'Show';
        $sort = InteractiveModel::last_sort_question($id_pelajaran,$id_week,$id_interactive);

        if ($request->file('mdl_add_qt_int_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_add_qt_int_file->getClientOriginalExtension();

            $path = public_path('upload/'.Session::get('kd_smt_active').'/question/');
            if(!File::isDirectory($path)){
                File::makeDirectory($path, 0777, true, true);
            }

            $request->mdl_add_qt_int_file->move(public_path('upload/'.Session::get('kd_smt_active').'/question/'),$file_name); 
        }

        $insert = InteractiveModel::add_question_interactive($id_pelajaran,$id_week,$id_interactive,$name_question,$type,$required,$state,$sort,$file_name);
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

    public function Update_question(Request $request)
    {

        $id_question = $request->mdl_edit_qt_int_id;
        $name_question = $request->mdl_edit_qt_int_name_question;
        $type = $request->mdl_edit_qt_int_type;
        $required = $request->mdl_edit_qt_int_required;

        if ($request->file('mdl_edit_qt_int_file') == null) {
            $file_name = null;
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->mdl_edit_qt_int_file->getClientOriginalExtension();

            $path = public_path('upload/'.Session::get('kd_smt_active').'/question/');
            if(!File::isDirectory($path)){
                File::makeDirectory($path, 0777, true, true);
            }

            $request->mdl_edit_qt_int_file->move(public_path('upload/'.Session::get('kd_smt_active').'/question/'),$file_name); 
        }

        $insert = InteractiveModel::Update_question($id_question,$name_question,$type,$required,$file_name);
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

    public function Update_sort_question(Request $request)
    {

        $id_question = $request->id_question;
        $new_sort = $request->new_sort;

        $insert = InteractiveModel::Update_sort($id_question,$new_sort);
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

    public function Update_state_question(Request $request)
    {

        $id_question = $request->id_question;
        $state = $request->state;

        $insert = InteractiveModel::Update_state_qt($id_question,$state);
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

    public function Delete_question(Request $request)
    {
        $id = $request->id_question;

        $update = InteractiveModel::delete_question($id);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Show_appraisal(Request $request)
    {
        
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['type'] = $type = $request->type;
        $data['data'] = InteractiveModel::get_appraisal($id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['name_interactive'] = $request->name_interactive;
        $data['state_interactive'] = $request->state_interactive;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('Interactive.Interactive_appraisal',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_response_appraisal_general(Request $request)
    {
        
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['id_appraisal'] = $idResponse = $request->id_appraisal;
        $data['idResponse'] = $idResponse = $request->idResponse;
        $data['username'] = $username = $request->username;
        $data['type'] = $type = $request->type;
        $data['data'] = InteractiveModel::get_appraisal($id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['name_interactive'] = $request->name_interactive;
        $data['state_interactive'] = $request->state_interactive;

        $get = InteractiveModel::show_responses_file_student($username,$id_interactive);
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['idResponse'] = $get->idResponse;
        $data['note'] = $get->note;
        $data['question'] = InteractiveModel::show_get_question_interactive($id_pelajaran,$id_week,$id_interactive);
        
        $div = view('Interactive.show_Interactive_response_from_sdm',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function show_response_appraisal_upload(Request $request)
    {
        
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['id_appraisal'] = $idResponse = $request->id_appraisal;
        $data['idResponse'] = $idResponse = $request->idResponse;
        $data['username'] = $username = $request->username;
        $data['type'] = $type = $request->type;
        $data['data'] = InteractiveModel::get_appraisal($id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['name_interactive'] = $request->name_interactive;
        $data['state_interactive'] = $request->state_interactive;

        $get = InteractiveModel::show_responses_file_student($username,$id_interactive);
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $data['file'] = $get->file;
        
        $div = view('Interactive.show_Interactive_response_upload_from_sdm',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_response_appraisal_canvas(Request $request)
    {
        
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->minggu;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['id_appraisal'] = $idResponse = $request->id_appraisal;
        $data['idResponse'] = $idResponse = $request->idResponse;
        $data['username'] = $username = $request->username;
        $data['type'] = $type = $request->type;
        $data['data'] = InteractiveModel::get_appraisal($id_interactive);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['name_interactive'] = $request->name_interactive;
        $data['state_interactive'] = $request->state_interactive;

        $get = InteractiveModel::show_responses_file_student($username,$id_interactive);
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;

        $get_link_canvas = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['link_canvas'] = $get_link_canvas->link_canvas;
        // $data['file'] = $get->file;
        
        $div = view('Interactive.show_Interactive_response_canvas_from_sdm',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Add_answer(Request $request)
    {
        $id_pelajaran = $request->mdl_add_ans_id_pelajaran;
        $id_week = $request->mdl_add_ans_id_week;
        $id_interactive = $request->mdl_add_ans_id_interactive;
        $id_question = $request->mdl_add_ans_id_question;

        $name_answer = $request->mdl_add_ans_name_answer;
        $true = $request->mdl_add_ans_true;
        $skor = $request->mdl_add_ans_skor;

        $insert = InteractiveModel::add_answer($id_pelajaran,$id_week,$id_interactive,$id_question,$name_answer,$true,$skor);
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

    public function Update_appraisal(Request $request)
    {
        $id_appraisal = $request->id_appraisal;

        $skor_final = $request->skor_final;
        $note = $request->note;

        $upd = InteractiveModel::Edit_appraisal($request->session()->get('username'),$id_appraisal,$skor_final,$note);
        if($upd){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Edit_answer(Request $request)
    {
        $id = $request->mdl_edit_ans_id_answer;

        $name_answer = $request->mdl_edit_ans_name_answer;
        $true = $request->mdl_edit_ans_true;
        $skor = $request->mdl_edit_ans_skor;

        $upd = InteractiveModel::Edit_answer_question($id,$name_answer,$true,$skor);
        if($upd){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Delete_answer(Request $request)
    {
        $id = $request->id_answer;

        $del = InteractiveModel::delete_answer($id);
        if($del){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Add_answer_text(Request $request)
    {
        $id_pelajaran = $request->mdl_add_text_ans_id_pelajaran;
        $id_week = $request->mdl_add_text_ans_id_week;
        $id_interactive = $request->mdl_add_text_ans_id_interactive;
        $id_question = $request->mdl_add_text_ans_id_question;

        $name_answer = $request->mdl_add_text_ans_name_answer;
        $true = 'True';
        $skor = $request->mdl_add_text_ans_skor;

        $insert = InteractiveModel::Add_answer($id_pelajaran,$id_week,$id_interactive,$id_question,$name_answer,$true,$skor);
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

    public function Edit_answer_text(Request $request)
    {
        $id = $request->mdl_edit_ans_text_id_answer;

        $name_answer = $request->mdl_edit_ans_text_name_answer;
        $true = 'True';
        $skor = $request->mdl_edit_ans_text_skor;

        $upd = InteractiveModel::Edit_answer_question($id,$name_answer,$true,$skor);
        if($upd){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Add_answer_matching(Request $request)
    {
        $id_pelajaran = $request->mdl_add_matching_ans_id_pelajaran;
        $id_week = $request->mdl_add_matching_ans_id_week;
        $id_interactive = $request->mdl_add_matching_ans_id_interactive;
        $id_question = $request->mdl_add_matching_ans_id_question;

        $name_answer = $request->mdl_add_matching_ans_name_answer;
        $question_matching = $request->mdl_add_matching_ans_question_matching;
        $true = 'True';
        $skor = $request->mdl_add_matching_ans_skor;

        $insert = InteractiveModel::add_answer_matching($id_pelajaran,$id_week,$id_interactive,$id_question,$question_matching,$name_answer,$true,$skor);
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

    public function Edit_answer_matching(Request $request)
    {
        $id = $request->mdl_edit_matching_ans_id_answer;

        $question_matching = $request->mdl_edit_matching_ans_question_matching;
        $name_answer = $request->mdl_edit_matching_ans_name_answer;
        $true = 'True';
        $skor = $request->mdl_edit_matching_ans_skor;

        $upd = InteractiveModel::Edit_answer_matching($id,$question_matching,$name_answer,$true,$skor);
        if($upd){
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Response_interactive_upload(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
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
                $div = view('Interactive.Interactive_response_upload',$data);
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

    public function Response_interactive_canvas(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $get = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['link_canvas'] = $get->link_canvas;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');

        $cek = InteractiveModel::cek_responses($request->session()->get('username'),$id_interactive);  
        if($cek<=0){
            if($date_now >= $date_from && $date_now <= $date_to){
                $div = view('Interactive.Interactive_response_canvas',$data);
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

    public function Response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');


        if ($request->session()->get('tipe') == 'sdm'){
            /*sdm*/
            $data['question'] = InteractiveModel::get_question_interactive_from_student($request->session()->get('tipe'),$id_pelajaran,$id_week,$id_interactive);
            $div = view('Interactive.Interactive_response',$data);
            $div=$div->render();
            $respon='SUKSES';
            $msg='';  
        }else{
            /*student*/
            $cek = InteractiveModel::cek_responses($request->session()->get('username'),$id_interactive);  
            if($cek<=0){
                if($date_now >= $date_from && $date_now <= $date_to){
                    $data['question'] = InteractiveModel::get_question_interactive_from_student($request->session()->get('tipe'),$id_pelajaran,$id_week,$id_interactive);
                    $div = view('Interactive.Interactive_response',$data);
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
        }

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Save_response_upload(Request $request)
    {
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $id_interactive = $request->id_interactive;
        $new_idResponse = InteractiveModel::new_idResponse();
        // echo $new_idResponse;exit();

        if ($request->file('file_upload_response') == null) {
            $respon='GAGAL';
            $msg='File empty!';
        }else{
            $input = $request->all();
            $file_name = time().'.'.$request->file_upload_response->getClientOriginalExtension();

            $path = public_path('upload/'.Session::get('kd_smt_active').'/interactive_response_upload/');
            if(!File::isDirectory($path)){
                File::makeDirectory($path, 0777, true, true);
            }

            $request->file_upload_response->move(public_path('upload/'.Session::get('kd_smt_active').'/interactive_response_upload/'),$file_name); 

            $insert = InteractiveModel::add_upload_appraisal($request->session()->get('username'),$new_idResponse,$id_interactive,$file_name);
            if($insert){
                $respon='SUKSES';
                $msg='';
            }else{
                $respon='GAGAL';
                $msg='Something is wrong!';
            }
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Save_response_canvas(Request $request)
    {
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $id_interactive = $request->id_interactive;
        $new_idResponse = InteractiveModel::new_idResponse();
        // echo $new_idResponse;exit();

        $insert = InteractiveModel::add_canvas_appraisal($request->session()->get('username'),$new_idResponse,$id_interactive);
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

    public function Show_canvas_response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);  
        // $data['file'] = $get->file;
        $get_link_canvas = InteractiveModel::get_data_interactive_row($id_interactive);
        $data['link_canvas'] = $get_link_canvas->link_canvas;
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $div = view('Interactive.show_Interactive_response_canvas',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';  

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_file_response_interactive_upload(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);  
        $data['file'] = $get->file;
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $div = view('Interactive.show_file_Interactive_response_upload',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';  

        

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Show_response_interactive(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['id_week'] = $id_week = $request->id_week;
        $data['minggu'] = $minggu = $request->week;
        $data['id_interactive'] = $id_interactive = $request->id_interactive;
        $data['name_interactive'] = $name_interactive = $request->name_interactive;
        $data['state_interactive'] = $state_interactive = $request->state_interactive;
        $date_from = $request->date_from;
        $date_from = date('Y-m-d',strtotime($date_from));
        $date_to = $request->date_to;
        $date_to = date('Y-m-d',strtotime($date_to));
        $data['date_now'] = $date_now = date('Y-m-d');

        $get = InteractiveModel::show_responses_file_student($request->session()->get('username'),$id_interactive);
        $data['skor_temp'] = $get->skor_temp;
        $data['skor_final'] = $get->skor_final;
        $data['note'] = $get->note;
        $data['idResponse'] = $get->idResponse;
        $data['question'] = InteractiveModel::show_get_question_interactive($id_pelajaran,$id_week,$id_interactive);
        
        $div = view('Interactive.show_Interactive_response',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Save_response(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $date_now = date('Y-m-d');
        $new_idResponse = InteractiveModel::new_idResponse();

        $arr    = json_decode($request->data);
        $arr2 = explode("&", $arr);
        foreach ($arr2 as $key) {
            $data = explode("=", $key);
            // print_r($data);
            $param=$data[0];
            $param2 = explode("_", $param);
            $type = $param2[2];
            if($type=='Option'){
                $id_interactive = $param2[3];
                $id_question = $param2[4];
                $val_awal=$data[1];
                $val_awal = explode("_", $val_awal);
                $id_answer = $val_awal[1];
                $skor = $val_awal[2];
                $val = $val_awal[4];
                $val = preg_replace("/[+]/", " ", $val);
                $true = $val_awal[3];
            }else if($type=='Text'){
                $id_interactive = $param2[3];
                $id_question = $param2[4];
                $id_answer = $param2[5];
                $skor_master = $param2[6];
                $val=$data[1];
                $val = preg_replace("/[+]/", " ", $val);
                $get_answer = InteractiveModel::get_answer($id_answer); 
                similar_text($get_answer->name_answer,$val,$percent);
                $skor = ($percent/100)*$skor_master;
                $true = 'True';
            }else if($type=='Matching'){
                $id_interactive = $param2[3];
                $id_question = $param2[4];
                $id_answer = $param2[5];
                $val=$data[1];
                $get_answer = InteractiveModel::get_answer($id_answer); 
                if($get_answer->name_answer == $val){
                    $skor = $get_answer->skor;
                    $true = 'True';
                }else{
                    $skor = 0;
                    $true = 'False';
                }
                // echo $id_interactive.':'.$id_question.':'.$id_answer.':'.$val.' | ';
            }
            $val=rawurldecode($val);
            $insert_response = InteractiveModel::insert_response($request->session()->get('username'),$id_interactive,$id_question,$id_answer,$val,$skor,$new_idResponse,$true); 
        }

        $get_response = InteractiveModel::get_response($new_idResponse);
        $insert_appraisal = InteractiveModel::insert_appraisal($request->session()->get('username'),$get_response->id_interactive,$new_idResponse,$get_response->total_skor); 

        // exit();
        $respon='SUKSES';
        $msg='';  

        

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    
}
