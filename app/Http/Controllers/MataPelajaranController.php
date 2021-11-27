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
use App\Models\MataPelajaranModel_scan;
use Validator,Response,File;
use PDF;
use QrCode;
class MataPelajaranController extends Controller
{

    public function Matpel(Request $request,$kode_grade,$id_pelajaran)
    {
        if ($request->session()->has('id')) {
        	// echo 'matapelajaran';
            // $data['menu'] = MenuModel::akses_menu($request->session()->get('level'));
            $data['menu_matpel'] = MenuModel::akses_menu_matpel($request->session()->get('username'),$request->session()->get('tipe'),$kode_grade,$id_pelajaran);
            $data['id_menu'] = '#menu_'.$kode_grade.'_'.$id_pelajaran;
            $mp = MenuModel::matpel($id_pelajaran);
            $data['judul'] = $mp->english;
            $data['kode_grade'] = $kode_grade;
            $data['id_pelajaran'] = $id_pelajaran;
            $data['week'] = MataPelajaranModel::pelajaran_week($id_pelajaran);
            $data['count_week'] = MataPelajaranModel::pelajaran_count_week($id_pelajaran);
            return view('MataPelajaran.Matpel',$data);
        }else{
            return \App::call('App\Http\Controllers\Awal@index');
        }
    }

    public function Show_week(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $data['data'] = MataPelajaranModel::list_week($kode_grade,$id_pelajaran);
        // $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        // $data['id_week'] = $id_week;
        // $data['minggu'] = $minggu;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('MataPelajaran.List_week',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Insert_week(Request $request){
        date_default_timezone_set('Asia/Jakarta');
        $pelajaran = $request->pelajaran;
        $minggu = $request->minggu;
        $tgl_awal = $request->tgl_awal;
        $tgl_akhir = $request->tgl_akhir;
        $tgl_awal = date('Y-m-d',strtotime($tgl_awal));
        $tgl_akhir = date('Y-m-d',strtotime($tgl_akhir));

        // echo $pelajaran.' - '.$minggu.' - '.$tgl_awal.' - '.$tgl_akhir.' - '.$request->session()->get('username'); exit();
        $cek = MataPelajaranModel::cek_week($pelajaran,$minggu,$request->session()->get('username'));

        if($cek->jml_d <= 0){
            $insert = MataPelajaranModel::add_week($request->session()->get('username'),$pelajaran,$minggu,$tgl_awal,$tgl_akhir);
            if($insert){
                $respon='SUKSES';
                $msg='';
            }else{
                $respon='GAGAL';
                $msg='Something is wrong!';
            }
        }else{
            $respon='GAGAL';
            $msg='Week '.$minggu.' sudah ada di database.<br><b>Perhatikan menu di kiri.';
        }

        

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Save_edit_week(Request $request)
    {
        $id_week = $request->id_week;
        $tgl_awal = $request->tgl_awal;
        $tgl_akhir = $request->tgl_akhir;
        $tgl_awal = date('Y-m-d',strtotime($tgl_awal));
        $tgl_akhir = date('Y-m-d',strtotime($tgl_akhir));

        $update = MataPelajaranModel::Save_edit_week($id_week,$tgl_awal,$tgl_akhir);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Change_state_week(Request $request)
    {
        $id_week = $request->id_week;
        $state = $request->state;

        $update = MataPelajaranModel::Change_state_week($id_week,$state);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Matpel_week(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $get_data = MataPelajaranModel::get_data_weekly($id_week);
        $data['data'] = $get_data;
        $privilege = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['privilege'] = $privilege;
        // $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['id_menu_week'] = 'menu_topic_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['nama'] = $get_data->nama;
        $data['supervisor'] = $get_data->supervisor;
        $data['namaSupervisor'] = $get_data->nm_spv;
        $data['memo'] = $get_data->memo;
        $data['tgl'] = $get_data->tgl;
        $data['tglsuper'] = $get_data->tgl2;
        $data['approve'] = $get_data->tgl3;
        $data['topic'] = $get_data->topic;
        $data['alokasi_waktu'] = $get_data->alokasi_waktu;
        $data['kompetensi_inti'] = $get_data->kompetensi_inti;
        $data['kompetensi_indikator'] = $get_data->kompetensi_indikator;
        $data['teknik_pembelajaran'] = $get_data->teknik_pembelajaran;
        $data['refleksi'] = $get_data->refleksi;
        $data['sumber_alat'] = $get_data->sumber_alat;
        $data['aims'] = $get_data->aims;
        $data['mode_delivery'] = $get_data->mode_delivery;
        $data['md_deskripsi'] = $get_data->md_deskripsi;
        $data['learning_type'] = $get_data->learning_type;
        $data['lt_deskripsi'] = $get_data->lt_deskripsi;
        // $data['outcomes'] = $get_data->outcomes;
        // $data['oc_deskripsi'] = $get_data->oc_deskripsi;
        $data['kd_indikator'] = MataPelajaranModel::get_kd_indikator($id_week,$id_pelajaran);
        $data['mapel'] = MataPelajaranModel::get_materi_pembelajaran($id_week,$id_pelajaran);
        $data['langkah_pembelajaran'] = MataPelajaranModel::get_langkah_pembelajaran($id_week,$id_pelajaran);
        $data['hasil_pembelajaran'] = MataPelajaranModel::get_hasil_pembelajaran($id_week,$id_pelajaran);
        $data['rubrik_diskusi'] = MataPelajaranModel::get_rubrik_diskusi($id_week,$id_pelajaran);
        $data['rubrik_tugas'] = MataPelajaranModel::get_rubrik_tugas($id_week,$id_pelajaran);
        $data['rubrik'] = MataPelajaranModel::get_week_rubrik($kode_grade,$id_pelajaran,$id_week,$minggu,$privilege);
        $data['outcomes'] = MataPelajaranModel::get_week_outcomes($kode_grade,$id_pelajaran,$id_week,$minggu,$privilege);

        

        $data['cek_approve'] = "";
        $data['pada'] = "";
        if($get_data->tgl3){
            $data['cek_approve'] = "checked";
            $data['pada'] = "pada ". $get_data->tgl2;
        }

        // echo 
        // $div = view('MataPelajaran.Week',$data);
        $div = view('MataPelajaran.Week',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Update_topic(Request $request)
    {
        $id_week = $request->id_week;
        $kolom = $request->kolom;
        $data_topic = str_replace('\'', '`', $request->data_topic);

        $update = MataPelajaranModel::Update_topic($id_week,$kolom,$data_topic,$request->session()->get('username'));
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Update_topic_date(Request $request)
    {
        $id_week = $request->id_week;
        $tgl_awal = date('Y-m-d',strtotime($request->date_from));
        $tgl_akhir = date('Y-m-d',strtotime($request->date_to));

        $update = MataPelajaranModel::Update_topic_date($id_week,$tgl_awal,$tgl_akhir);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Update_topic_approve(Request $request)
    {
        $id_week = $request->id_week;
        $kolom = $request->kolom;
        $data_topic = str_replace('\'', '`', $request->data_topic);
        $approve = $request->approve;

        // echo $approve;exit();

        $update = MataPelajaranModel::Update_topic_approve($id_week,$kolom,$data_topic,$approve,$request->session()->get('username'));
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Graph_subjek(Request $request)
    {
        $id_pelajaran = $request->id_pelajaran;

        
        $id_rwl = 1;
        $get_rwl = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_rwl);
        $val_rwl = $get_rwl->jml_d;

        $id_clb = 2;
        $get_clb = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_clb);
        $val_clb = $get_clb->jml_d;

        $id_dcs = 3;
        $get_dcs = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_dcs);
        $val_dcs = $get_dcs->jml_d;

        $id_ivt = 4;
        $get_ivt = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_ivt);
        $val_ivt = $get_ivt->jml_d;

        $id_pct = 5;
        $get_pct = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_pct);
        $val_pct = $get_pct->jml_d;

        $id_pdc = 6;
        $get_pdc = MataPelajaranModel::get_alokasi_waktu_lt($id_pelajaran,$id_pdc);
        $val_pdc = $get_pdc->jml_d;

        $respon ='SUKSES';
        $return = array('respon' => $respon,'val_rwl' => $val_rwl,'val_clb' => $val_clb,'val_dcs' => $val_dcs,'val_ivt' => $val_ivt,'val_pct' => $val_pct,'val_pdc' => $val_pdc);

        echo json_encode($return);
    }

    public function Get_kd_indikator(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_kd_indikator_by_id($id);
        // echo $act;exit();
        if($get){
            $return = array('respon' => 'SUKSES','kompetensi_dasar' => $get->kompetensi_dasar, 'indikator' => $get->indikator);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Save_topic_kd_indikator(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;
        $kompetensi_dasar = str_replace('\'', '`', $request->kompetensi_dasar);
        $indikator = str_replace('\'', '`', $request->indikator);

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_topic_kd_indikator($id_week,$id_pelajaran,$kompetensi_dasar,$indikator,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_topic_kd_indikator($id_week,$id,$kompetensi_dasar,$indikator,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Delete_kd_indikator(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_kd_indi($id);
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

    public function Get_materi_pelajaran(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_materi_pembelajaran_by_id($id);
        // echo $act;exit();
        if($get){
            $return = array('respon' => 'SUKSES','materi' => $get->materi);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Simpan_materi_pelajaran(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;
        $materi = $request->materi;

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_materi_pelajaran($id_week,$id_pelajaran,$materi,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_materi_pelajaran($id_week,$id,$materi,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Delete_materi_pelajaran(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_mapel($id);
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

    public function Get_langkah_pembelajaran(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_langkah_pembelajaran_by_id($id);
        // echo $id;exit();
        if($get){
            $return = array('respon' => 'SUKSES','kegiatan' => $get->kegiatan,'durasi' => $get->durasi,'muatan' => $get->muatan);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Delete_langkah_pembelajaran(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_langkahPembelajaran($id);
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

    public function Simpan_langkah_pembelajaran(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;
        $kegiatan = str_replace('\'', '`', $request->kegiatan);
        $durasi = str_replace('\'', '`', $request->durasi);
        $muatan = str_replace('\'', '`', $request->muatan);

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_langkah_pembelajaran($id_week,$id_pelajaran,$kegiatan,$durasi,$muatan,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_langkah_pembelajaran($id_week,$id,$kegiatan,$durasi,$muatan,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_hasil_pembelajaran(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_hasil_pembelajaran_by_id($id);
        // echo $id;exit();
        if($get){
            $return = array('respon' => 'SUKSES','indikator' => $get->indikator,'tehnik' => $get->tehnik,'bentuk_instrumen' => $get->bentuk_instrumen, 'sampel_instrumen' => $get->sampel_instrumen);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Delete_hasil_pembelajaran(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_hasilPembelajaran($id);
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

    public function Simpan_hasil_pembelajaran(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;
        $indikator = str_replace('\'', '`', $request->indikator);
        $tehnik = str_replace('\'', '`', $request->tehnik);
        $bentuk_instrumen = str_replace('\'', '`', $request->bentuk_instrumen);
        $sampel_instrumen = str_replace('\'', '`', $request->sampel_instrumen);

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_hasil_pembelajaran($id_week,$id_pelajaran,$indikator,$tehnik,$bentuk_instrumen,$sampel_instrumen,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_hasil_pembelajaran($id_week,$id,$indikator,$tehnik,$bentuk_instrumen,$sampel_instrumen,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_rubrik_diskusi(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_rubrik_diskusi_by_id($id);
        // echo $id;exit();
        if($get){
            $return = array('respon' => 'SUKSES','nm_siswa' => $get->nm_siswa,'keaktifan' => $get->keaktifan,'kerjasama' => $get->kerjasama, 'presentasi' => $get->presentasi, 'bertanya' => $get->bertanya, 'menjawab' => $get->menjawab, 'jml_skor' => $get->jml_skor);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Delete_rubrik_diskusi(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_rubrikDiskusi($id);
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

    public function Simpan_rubrik_diskusi(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;

        $nm_siswa = $request->nm_siswa;
        $keaktifan = $request->keaktifan;
        $kerjasama = $request->kerjasama;
        $presentasi = $request->presentasi;
        $bertanya = $request->bertanya;
        $menjawab = $request->menjawab;
        $jml_skor = $request->jml_skor;
        

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_rubrik_diskusi($id_week,$id_pelajaran,$nm_siswa,$keaktifan,$kerjasama,$presentasi,$bertanya,$menjawab,$jml_skor,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_rubrik_diskusi($id_week,$id,$nm_siswa,$keaktifan,$kerjasama,$presentasi,$bertanya,$menjawab,$jml_skor,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_rubrik_tugas(Request $request)
    {
        $id = $request->id;
        $get = MataPelajaranModel::get_rubrik_tugas_by_id($id);
        // echo $id;exit();
        if($get){
            $return = array('respon' => 'SUKSES','nm_siswa' => $get->nm_siswa,'ketepatan' => $get->ketepatan,'skala' => $get->skala, 'kerapihan' => $get->kerapihan, 'simbol' => $get->simbol, 'jml_skor' => $get->jml_skor);
        }else{
            $return = array('respon' => 'GAGAL');
        }

        echo json_encode($return);
    }

    public function Delete_rubrik_tugas(Request $request)
    {
        $id = $request->id;
        $del = MataPelajaranModel::Delete_rubrikTugas($id);
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

    public function Simpan_rubrik_tugas(Request $request)
    {
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $act = $request->act;
        $id = $request->id;

        $nm_siswa = $request->nm_siswa;
        $ketepatan = $request->ketepatan;
        $skala = $request->skala;
        $kerapihan = $request->kerapihan;
        $simbol = $request->simbol;
        $jml_skor = $request->jml_skor;
        

        // echo $id;exit();
        if($act=='tambah'){
            $save = MataPelajaranModel::sv_rubrik_tugas($id_week,$id_pelajaran,$nm_siswa,$ketepatan,$skala,$kerapihan,$simbol,$jml_skor,$request->session()->get('username'));
            if($save){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }else{
            $get = MataPelajaranModel::upd_rubrik_tugas($id_week,$id,$nm_siswa,$ketepatan,$skala,$kerapihan,$simbol,$jml_skor,$request->session()->get('username'));
            if($get){
                $respon='SUKSES';
            }else{
                $respon='GAGAL';
            }
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_mst_rubrik(Request $request){
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;

        $option = "";
        $option .= '<option value="0"></option>';
        $get = MataPelajaranModel::get_mstRubrik($id_week,$id_pelajaran);
        if($get){
            foreach ($get as $key) {
                $option .= '<option value="'.$key->id.'">'.$key->nama.'</option>';
                
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

    public function Get_mst_outcomes(Request $request){
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;

        $option = "";
        $option .= '<option value="0"></option>';
        $get = MataPelajaranModel::Get_mst_outcomes($id_week,$id_pelajaran);
        if($get){
            foreach ($get as $key) {
                $option .= '<option value="'.$key->id.'">'.$key->deskripsi.'</option>';
                
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

    public function Get_mst_child_outcomes(Request $request){
        $id_parent = $request->id_parent_outcomes;

        $option = "";
        // $option .= '<option value="0"></option>';
        $get = MataPelajaranModel::get_mstChild_outcomes($id_parent);
        if($get){
            foreach ($get as $key) {
                $option .= '<option value="'.$key->id.'">'.$key->deskripsi.'</option>';
                
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

    public function Get_mst_child_rubrik(Request $request){
        $id_mst_rubrik = $request->id_mst_rubrik;

        $input = "";
        $get = MataPelajaranModel::get_mstChild_rubrik($id_mst_rubrik);
        if($get){
            foreach ($get as $key) {
                $input .= '
                    <div class="form-group ">
                        <label class="col-sm-4 control-label">'.$key->nama.'</label>
                        <div class="col-sm-8">
                            <input type="number" id="child_rb['.$key->id.']" name="child_rb['.$key->id.']" class="form-control">
                        </div>
                    </div>';
                
            }
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg,'input' => $input);
        echo json_encode($return);
    }

    public function Simpan_outcomes(Request $request)
    {
        $id_week = $request->mdl_ot_id_week;
        $id_pelajaran = $request->mdl_ot_id_pelajaran;
        $child_outcomes = $request->child_outcomes;

        $insert = MataPelajaranModel::sv_outcomes($id_week,$id_pelajaran,$child_outcomes,$request->session()->get('username'));
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

    public function Simpan_rubrik(Request $request)
    {
        $id_week = $request->mdl_tpc_id_week_rb;
        $id_pelajaran = $request->mdl_tpc_id_pelajaran_rb;
        $id_mst_rubrik = $request->id_mst_rubrik;

        $insert = MataPelajaranModel::sv_rubrik($id_week,$id_pelajaran,$id_mst_rubrik,'',$request->session()->get('username'));
        if($insert){
            $child_rb_keys = array_keys($request->child_rb);
            $child_rb_values = array_values($request->child_rb);
        
            for ($x=0;$x<count($child_rb_keys);$x++)
            {    
                $rubrik = $child_rb_keys[$x];
                $maks_skor = $child_rb_values[$x];
                MataPelajaranModel::sv_rubrik($id_week,$id_pelajaran,$rubrik,$maks_skor,$request->session()->get('username'));
            }

            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }
        
        
        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Delete_outcomes(Request $request)
    {
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $week_outcomes = $request->week_outcomes;
        $del = MataPelajaranModel::del_outcomes($id_pelajaran,$id_week,$week_outcomes);
        // $del = MataPelajaranModel::Delete_rubrikTugas($id);
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

    public function Delete_rubrik(Request $request)
    {
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $week_rubrik = $request->week_rubrik;
        $del = MataPelajaranModel::del_rubrik($id_pelajaran,$id_week,$week_rubrik);
        // $del = MataPelajaranModel::Delete_rubrikTugas($id);
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

    public function Get_upd_rubrik(Request $request){
        $id_week = $request->id_week;
        $id_pelajaran = $request->id_pelajaran;
        $id_mst_rubrik = $request->id;
        $id_mec_rubrik = $request->id_mwb;

        $input = "";
        $get = MataPelajaranModel::get_mec_Child_rubrik($id_week,$id_pelajaran,$id_mst_rubrik,$id_mec_rubrik);
        if($get){
            foreach ($get as $key) {
                $input .= '
                    <div class="form-group ">
                        <label class="col-sm-4 control-label">'.$key->nama.'</label>
                        <div class="col-sm-8">
                            <input type="number" id="child_upd_rb['.$key->rubrik.']" name="child_upd_rb['.$key->rubrik.']" value="'.$key->maks_skor.'" class="form-control">
                        </div>
                    </div>';
                
            }
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg,'input' => $input);
        echo json_encode($return);
    }

    public function Simpan_upd_rubrik(Request $request)
    {
        $id_week = $request->mdl_tpc_upd_id_week_rb;
        $id_pelajaran = $request->mdl_tpc_upd_id_pelajaran_rb;

        
            $child_rb_keys = array_keys($request->child_upd_rb);
            $child_rb_values = array_values($request->child_upd_rb);
        
            for ($x=0;$x<count($child_rb_keys);$x++)
            {    
                $rubrik = $child_rb_keys[$x];
                $maks_skor = $child_rb_values[$x];
                // echo $rubrik.':'.$maks_skor.' | ';
                MataPelajaranModel::upd_rubrik($id_week,$id_pelajaran,$rubrik,$maks_skor,$request->session()->get('username'));
            }

            $respon='SUKSES';
            $msg='';
        
        
        
        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }


















    public function Week_topic_selection(Request $request)
    {
        $kolom = $request->kolom;
        $id_selection = $request->id_selection;
        // echo $id_selection;exit();
        if($kolom == 'mode_delivery'){
            
            $option = "";
            $get = MataPelajaranModel::get_mode_delivery();
            if($get){
                foreach ($get as $key) {
                    if($key->id == $id_selection){
                        $option .= '<option value="'.$key->id.'" selected>'.$key->deskripsi.'</option>';
                    }else{
                        $option .= '<option value="'.$key->id.'">'.$key->deskripsi.'</option>';
                    }
                    
                }
                $respon='SUKSES';
                $msg='';
            }else{
                $respon='GAGAL';
                $msg='Something is wrong!';
            }
        }elseif ($kolom == 'outcomes') {
            $option = "";
            $get = MataPelajaranModel::get_outcomes();
            if($get){
                foreach ($get as $key) {
                    if($key->id == $id_selection){
                        $option .= '<option value="'.$key->id.'" selected>'.$key->deskripsi.'</option>';
                    }else{
                        $option .= '<option value="'.$key->id.'">'.$key->deskripsi.'</option>';
                    }
                    
                }
                $respon='SUKSES';
                $msg='';
            }else{
                $respon='GAGAL';
                $msg='Something is wrong!';
            }
        }elseif ($kolom == 'learning_type') {
            $option = "";
            $get = MataPelajaranModel::get_learning_type();
            if($get){
                foreach ($get as $key) {
                    if($key->id == $id_selection){
                        $option .= '<option value="'.$key->id.'" selected>'.$key->deskripsi.'</option>';
                    }else{
                        $option .= '<option value="'.$key->id.'">'.$key->deskripsi.'</option>';
                    }
                    
                }
                $respon='SUKSES';
                $msg='';
            }else{
                $respon='GAGAL';
                $msg='Something is wrong!';
            }
        }

        $return = array('respon' => $respon,'msg' => $msg,'option' => $option);
        echo json_encode($return);
    }

    public function Matpel_tlm(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $data['data'] = MataPelajaranModel::get_data_tlm_weekly($id_pelajaran,$id_week);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;

        // $div = view('MataPelajaran.Week',$data);
        $div = view('MataPelajaran.Teaching_learning_material',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Insert_tlm(Request $request){
        date_default_timezone_set('Asia/Jakarta');
        $pelajaran = $request->id_pelajaran;
        $minggu = $request->id_week;
        $judul = $request->judul;
        $isi = str_replace('\'', '`', $request->isi);;

        
        $insert = MataPelajaranModel::add_tlm($request->session()->get('username'),$pelajaran,$minggu,$judul,$isi);
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

    public function Matpel_tlm_detail(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $id_materi = $request->id_detail;
        $get_data = MataPelajaranModel::get_data_tlm_weekly_by_id($id_materi);
        $data['tlm'] = $get_data;
        $data['slide'] = MataPelajaranModel::get_data_tlm_slide($id_materi);
        $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
        // $data['id_menu_tlm'] = 'menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
        // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
        $data['namaSupervisor'] = $get_data->nm_spv;
        $data['tglsuper'] = $get_data->tgl2;
        $data['approve'] = $get_data->tgl3;

        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;

        $data['cek_approve'] = "";
        if($get_data->tgl3){
            $data['cek_approve'] = "checked";
        }

        // $div = view('MataPelajaran.Week',$data);
        $div = view('MataPelajaran.Teaching_learning_material_detail',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Update_tlm_isi(Request $request)
    {
        $id_tlm = $request->id_tlm;
        $isi = str_replace('\'', '`', $request->isi);

        $update = MataPelajaranModel::update_tlm_isi($id_tlm,$isi,$request->session()->get('username'));
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Update_tlm_approve(Request $request)
    {
        $id_tlm = $request->id_tlm;
        $memo = str_replace('\'', '`', $request->memo);
        $approve = $request->approve;

        // echo $approve;exit();

        $update = MataPelajaranModel::Update_tlm_approve($id_tlm,$memo,$approve,$request->session()->get('username'));
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Add_tlm_lmp(Request $request)
    {
        $kode_grade = $request->mdl_tlm_add_lmp_kode_grade;
        $id_pelajaran = $request->mdl_tlm_add_lmp_id_pelajaran;
        $id_week = $request->mdl_tlm_add_lmp_id_week;
        $week = $request->mdl_tlm_add_lmp_week;
        $id_tlm = $request->mdl_tlm_add_lmp_id_tlm;
        
        // echo $id_tlm;exit();
        

        if ($request->file('mdl_add_file_tlm_slide') == null) {
            $file_name = null;
            $respon='GAGAL';
            $msg='Something is wrong!';
        }else{
            $input = $request->all();
            $namaAtc = $request->mdl_add_file_tlm_slide->getClientOriginalName();
            $eksAtc = ".". $request->mdl_add_file_tlm_slide->getClientOriginalExtension();
            $ukuran = $request->mdl_add_file_tlm_slide->getClientSize();

            $insert = MataPelajaranModel::Add_tlm_lmp($id_tlm,$eksAtc,$namaAtc,$ukuran);
            if($insert){
                $last_id = $insert;
                $file_name = $last_id.'.'.$request->mdl_add_file_tlm_slide->getClientOriginalExtension();
                $request->mdl_add_file_tlm_slide->move(public_path('upload/'.Session::get('kd_smt_active').'/slide/lmp/'),$file_name);

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

    public function Show_tlm_slide_lmp(Request $request)
    {
        
        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $id_tlm = $request->id_detail;
        $id_lmp = $request->id_lmp;

        $data['lmp'] = MataPelajaranModel::get_data_tlm_slide_by_id($id_lmp);

        $data['kode_grade'] = $kode_grade;
        $data['id_pelajaran'] = $id_pelajaran;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['id_tlm'] = $id_tlm;


        // $div = view('MataPelajaran.Week',$data);
        $div = view('MataPelajaran.Teaching_learning_material_lampiran',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Delete_tlm_slide(Request $request)
    {
        $id = $request->id_lmp;
        $tipe = $request->tipe;
        $del = MataPelajaranModel::Delete_tlm_slide($id);
        if($del){
            $destinationFile = 'upload/'.Session::get('kd_smt_active').'/slide/lmp/'.$id.$tipe;
            File::delete($destinationFile);
            $respon='SUKSES';
            $msg='';
        }else{
            $respon='GAGAL';
            $msg='Something is wrong!';
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function Update_icon_subject(Request $request)
    {
        $id_icon_subject_id = $request->id_icon_subject_id;

        if ($request->file('id_icon_subject') == null) {
            $file_name = null;
            $respon='GAGAL';
            $msg='Something is wrong!';
        }else{
            $input = $request->all();
            $file_name = $id_icon_subject_id.'.'.$request->id_icon_subject->getClientOriginalExtension();
            $request->id_icon_subject->move(public_path('upload/'.Session::get('kd_smt_active').'/icon_subject/'),$file_name);

            $respon='SUKSES';
            $msg='';
            
             
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    // public function LD_pdf(Request $request,$kode_grade,$id_pelajaran,$id_week,$minggu)
    public function LD_pdf(Request $request)
    {
        echo 'tes';exit();
        if ($request->session()->has('id')) {
            
            // $kode_grade = $request->kode_grade;
            // $id_pelajaran = $request->id_pelajaran;
            // $id_week = $request->id_week;
            // $minggu = $request->minggu;
            $get_data = MataPelajaranModel::get_data_weekly($id_week);
            $data['data'] = $get_data;
            $data['privilege'] = MataPelajaranModel::PrivilegeElearning($request->session()->get('username'),$kode_grade,$id_pelajaran);
            $data['id_menu_week'] = 'menu_topic_'.$kode_grade.'_'.$id_pelajaran.'_'.$id_week;
            // $data['id_menu_deactive'] = 'menu_'.$kode_grade.'_'.$id_pelajaran;
            $data['kode_grade'] = $kode_grade;
            $get_pelajaran = MataPelajaranModel::get_pelajaran($kode_grade,$id_pelajaran);
            $data['id_pelajaran'] = $id_pelajaran;
            $data['nama_pelajaran'] = $get_pelajaran->nama;
            $data['id_week'] = $id_week;
            $data['minggu'] = $minggu;
            $data['nama'] = $get_data->nama;
            $data['supervisor'] = $get_data->supervisor;
            $data['namaSupervisor'] = $get_data->nm_spv;
            $data['memo'] = $get_data->memo;
            $data['tgl'] = $get_data->tgl;
            $data['tgl_2'] = $get_data->tgl_2;
            $data['tglsuper'] = $get_data->tgl2;
            $data['approve'] = $get_data->tgl3;
            $data['tgl_approve'] = $get_data->tgl_approve;
            $data['topic'] = $get_data->topic;
            $data['alokasi_waktu'] = $get_data->alokasi_waktu;
            $data['kompetensi_inti'] = $get_data->kompetensi_inti;
            $data['kompetensi_indikator'] = $get_data->kompetensi_indikator;
            $data['teknik_pembelajaran'] = $get_data->teknik_pembelajaran;
            $data['refleksi'] = $get_data->refleksi;
            $data['sumber_alat'] = $get_data->sumber_alat;
            $data['aims'] = $get_data->aims;
            $data['mode_delivery'] = $get_data->mode_delivery;
            $data['md_deskripsi'] = $get_data->md_deskripsi;
            $data['learning_type'] = $get_data->learning_type;
            $data['lt_deskripsi'] = $get_data->lt_deskripsi;
            // $data['outcomes'] = $get_data->outcomes;
            // $data['oc_deskripsi'] = $get_data->oc_deskripsi;
            $data['kd_indikator'] = MataPelajaranModel::get_kd_indikator($id_week,$id_pelajaran);
            $data['mapel'] = MataPelajaranModel::get_materi_pembelajaran($id_week,$id_pelajaran);
            $data['langkah_pembelajaran'] = MataPelajaranModel::get_langkah_pembelajaran($id_week,$id_pelajaran);
            $data['hasil_pembelajaran'] = MataPelajaranModel::get_hasil_pembelajaran($id_week,$id_pelajaran);
            // $data['rubrik_diskusi'] = MataPelajaranModel::get_rubrik_diskusi($id_week,$id_pelajaran);
            // $data['rubrik_tugas'] = MataPelajaranModel::get_rubrik_tugas($id_week,$id_pelajaran);
            $data['rubrik'] = MataPelajaranModel::get_week_rubrik_pdf($kode_grade,$id_pelajaran,$id_week,$minggu);
            $data['outcomes'] = MataPelajaranModel::get_week_outcomes_pdf($kode_grade,$id_pelajaran,$id_week,$minggu);

            $data['cek_approve'] = "";
            $data['pada'] = "";
            if($get_data->tgl3){
                $data['cek_approve'] = "checked";
                $data['pada'] = "pada ". $get_data->tgl2;
            }

            $data['priv_pelajaran'] = MataPelajaranModel::get_priv_pelajaran($id_pelajaran);
            $data['spv'] = MataPelajaranModel::get_sdm($get_data->supervisor);

            $link = url('/Scan_Ld').'/'.Session::get('kd_smt_active').'/'.$kode_grade.'/'.$id_pelajaran.'/'.$id_week.'/'.$minggu;
            // $data['link'] = $link;
            $data['qrcode'] = base64_encode(QrCode::format('png')->size(150)->errorCorrection('H')->generate($link));
 
             // $pdf = PDF::loadview('pegawai_pdf',['pegawai'=>$pegawai]);
            $pdf = PDF::loadview('MataPelajaran.print_ld',$data);
            // return $pdf->download('Learning_Designer.pdf');
            return $pdf->stream('Learning_Designer.pdf');
            
            // return view('MataPelajaran.print_ld',$data);


        }else{
            return \App::call('App\Http\Controllers\Awal@index');
        }
    }

    public function Scan_Ld(Request $request,$kd_smt_active,$kode_grade,$id_pelajaran,$id_week,$minggu)
    {

        $kode_grade = $request->kode_grade;
        $id_pelajaran = $request->id_pelajaran;
        $id_week = $request->id_week;
        $minggu = $request->minggu;
        $get_data = MataPelajaranModel_scan::get_data_weekly($id_week,$kd_smt_active);
        // echo 'dddd';exit();
        $data['data'] = $get_data;
        $data['kode_grade'] = $kode_grade;
        $get_pelajaran = MataPelajaranModel_scan::get_pelajaran($kode_grade,$id_pelajaran,$kd_smt_active);
        $data['id_pelajaran'] = $id_pelajaran;
        $data['nama_pelajaran'] = $get_pelajaran->nama;
        $data['id_week'] = $id_week;
        $data['minggu'] = $minggu;
        $data['nama'] = $get_data->nama;
        $data['supervisor'] = $get_data->supervisor;
        $data['namaSupervisor'] = $get_data->nm_spv;
        $data['memo'] = $get_data->memo;
        $data['tgl'] = $get_data->tgl;
        $data['tglsuper'] = $get_data->tgl2;
        $data['approve'] = $get_data->tgl3;
        $data['topic'] = $get_data->topic;
        $data['alokasi_waktu'] = $get_data->alokasi_waktu;
        $data['kompetensi_inti'] = $get_data->kompetensi_inti;
        $data['kompetensi_indikator'] = $get_data->kompetensi_indikator;
        $data['teknik_pembelajaran'] = $get_data->teknik_pembelajaran;
        $data['refleksi'] = $get_data->refleksi;
        $data['sumber_alat'] = $get_data->sumber_alat;
        $data['aims'] = $get_data->aims;
        $data['mode_delivery'] = $get_data->mode_delivery;
        $data['md_deskripsi'] = $get_data->md_deskripsi;
        // $data['outcomes'] = $get_data->outcomes;
        // $data['oc_deskripsi'] = $get_data->oc_deskripsi;
        $data['learning_type'] = $get_data->learning_type;
        $data['lt_deskripsi'] = $get_data->lt_deskripsi;
        $data['kd_indikator'] = MataPelajaranModel_scan::get_kd_indikator($id_week,$id_pelajaran,$kd_smt_active);
        $data['mapel'] = MataPelajaranModel_scan::get_materi_pembelajaran($id_week,$id_pelajaran,$kd_smt_active);
        $data['langkah_pembelajaran'] = MataPelajaranModel_scan::get_langkah_pembelajaran($id_week,$id_pelajaran,$kd_smt_active);
        $data['hasil_pembelajaran'] = MataPelajaranModel_scan::get_hasil_pembelajaran($id_week,$id_pelajaran,$kd_smt_active);
        $data['rubrik'] = MataPelajaranModel_scan::get_week_rubrik($kode_grade,$id_pelajaran,$id_week,$minggu,$kd_smt_active);
        $data['outcomes'] = MataPelajaranModel_scan::get_week_outcomes($kode_grade,$id_pelajaran,$id_week,$minggu);
        

        $data['cek_approve'] = "";
        $data['pada'] = "";
        if($get_data->tgl3){
            $data['cek_approve'] = "checked";
            $data['pada'] = "pada ". $get_data->tgl2;
        }

        
        return view('MataPelajaran.Week_scan',$data);

    }

    public function Get_list_discuss(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['kode_grade'] = $kode_grade = $request->kode_grade;

        $data['list_discuss'] = MataPelajaranModel::List_discuss($id_pelajaran);
        
        $div = view('MataPelajaran.List_discuss',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Save_discuss(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $id_pelajaran = $request->id_pelajaran;
        $judul = $request->judul;
        $ditutup = $request->ditutup;
        $isi = $request->isi;

        $save = MataPelajaranModel::Sv_discuss($id_pelajaran,$judul,$ditutup,$isi,$request->session()->get('username'));
        if($save){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Save_edit_discuss(Request $request)
    {
        $id = $request->id;
        $judul = $request->judul;
        $ditutup = $request->ditutup;
        $isi = $request->isi;

        $update = MataPelajaranModel::Update_discuss($id,$judul,$ditutup,$isi);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Del_discuss(Request $request)
    {
        $id = $request->id;

        $update = MataPelajaranModel::delete_discuss($id);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_comment_discuss(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['id'] = $id = $request->id;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['kode_grade'] = $kode_grade = $request->kode_grade;
        $data['user_id'] = $request->session()->get('username');

        $data['discuss'] = MataPelajaranModel::Get_discuss($id);
        $data['komen'] = MataPelajaranModel::Get_comment($id);
        
        // $div = view('MataPelajaran.List_discuss',$data);
        $div = view('MataPelajaran.Comment_discuss',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Send_comment(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $id = $request->id;
        $comment_discuss = $request->c_discuss;
        $ip_client = $request->ip();

        // echo $request->session()->get('username'); exit();
        $save = MataPelajaranModel::Sv_comment($id,$comment_discuss,$request->session()->get('username'),$request->session()->get('tipe'),$request->session()->get('nama_lengkap'),$ip_client);
        
        if($save){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Reply_comment(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $id_discuss = $request->id_discuss;
        $parent_comment = $request->id_comment;
        $comment_discuss = $request->reply_comment_discuss;
        $ip_client = $request->ip();

        // echo $request->session()->get('username'); exit();
        $save = MataPelajaranModel::Sv_reply_comment($id_discuss,$parent_comment,$comment_discuss,$request->session()->get('username'),$request->session()->get('tipe'),$request->session()->get('nama_lengkap'),$ip_client);
        
        if($save){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }


        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Del_comment(Request $request)
    {
        $id = $request->id_comment;

        $update = MataPelajaranModel::delete_comment($id);
        if($update){
            $respon='SUKSES';
        }else{
            $respon='GAGAL';
        }

        $return = array('respon' => $respon);
        echo json_encode($return);
    }

    public function Get_list_discuss_parent(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;

        $data['list_discuss'] = MataPelajaranModel::List_discuss($id_pelajaran);
        
        $div = view('MataPelajaran.List_discuss_parent',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }

    public function Get_comment_discuss_parent(Request $request)
    {
        date_default_timezone_set('Asia/Jakarta');
        $data['id'] = $id = $request->id;
        $data['id_pelajaran'] = $id_pelajaran = $request->id_pelajaran;
        $data['user_id'] = $request->session()->get('username');

        $data['discuss'] = MataPelajaranModel::Get_discuss($id);
        $data['komen'] = MataPelajaranModel::Get_comment($id);
        
        // $div = view('MataPelajaran.List_discuss',$data);
        $div = view('MataPelajaran.Comment_discuss_parent',$data);
        $div=$div->render();
        $respon='SUKSES';
        $msg='';

        $return = array('respon' => $respon,'msg' => $msg,'div' => $div);
        echo json_encode($return);
    }
}
