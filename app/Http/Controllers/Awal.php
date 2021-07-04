<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Socialite;

use App\Http\Requests;
// use Illuminate\Support\Facades\DB;
use Session;


use App\Models\AwalModel;


class Awal extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $mahasiswa = DB::table('server')->get();
        // print_r($mahasiswa);
        return view('frontend.login');
    }

    public function login_sdm()
    {
        // $mahasiswa = DB::table('server')->get();
        // print_r($mahasiswa);
        return view('frontend.login_sdm');
    }

    public function login_student()
    {
        // $mahasiswa = DB::table('server')->get();
        // print_r($mahasiswa);
        return view('frontend.login_student');
    }

    public function login_parent()
    {
        // $mahasiswa = DB::table('server')->get();
        // print_r($mahasiswa);
        return view('frontend.login_parent');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cek_login(Request $request)
    {
        $username = $request->username;
        $user = AwalModel::getuserData($username);
        $password = $request->password;
        if(empty($user)){
            $respon='GAGAL';
            $msg='User not Found!';
        }else{
            if ($user->tipe=='siswa'){
                $cek_siswa_intranet = AwalModel::get_siswa_intranet($username);
                if($password==$cek_siswa_intranet->sandi){
                    Session::put('id', $user->id);
                    Session::put('username', $user->username);
                    Session::put('nama_lengkap', $user->nama_lengkap);
                    Session::put('level', $user->level);
                    Session::put('tipe', $user->tipe);
                    Session::put('nm_level', $user->nm_level);
                    Session::put('smt_active', smt_active()['smt_active']);
                    Session::put('kd_smt_active', smt_active()['kd_smt_active']);
                    Session::put('db_active', db_active());
                    $respon='SUKSES';
                    $msg='';
                }else{
                    $respon='GAGAL';
                    $msg='Wrong password!';
                }
            }else{
                Session::put('id', $user->id);
                Session::put('username', $user->username);
                Session::put('nama_lengkap', $user->nama_lengkap);
                Session::put('level', $user->level);
                Session::put('tipe', $user->tipe);
                Session::put('nm_level', $user->nm_level);
                Session::put('smt_active', smt_active()['smt_active']);
                Session::put('kd_smt_active', smt_active()['kd_smt_active']);
                Session::put('db_active', db_active());
                $respon='SUKSES';
                $msg='';
            }
            
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function cek_login_parent(Request $request)
    {
        $username = $request->username;
        $user = AwalModel::getuserData($username);
        $password = $request->password;
        if(empty($user)){
            $respon='GAGAL';
            $msg='User not Found!';
        }else{
            if ($user->tipe=='siswa'){
                $cek_siswa_intranet = AwalModel::get_siswa_intranet($username);
                if($password==$cek_siswa_intranet->sandi_ortu){
                    Session::put('id', $user->id);
                    Session::put('username', $user->username);
                    Session::put('nama_lengkap', $user->nama_lengkap);
                    Session::put('level', $user->level);
                    Session::put('tipe', 'ortu');
                    Session::put('nm_level', 'Orang Tua');
                    Session::put('smt_active', smt_active()['smt_active']);
                    Session::put('kd_smt_active', smt_active()['kd_smt_active']);
                    Session::put('db_active', db_active());
                    $respon='SUKSES';
                    $msg='';
                }else{
                    $respon='GAGAL';
                    $msg='Wrong password!';
                }
            }else{
                $respon='GAGAL';
                $msg='Not Parent!';
            }
            
        }

        $return = array('respon' => $respon,'msg' => $msg);
        echo json_encode($return);
    }

    public function redirect_google()
    {
        return Socialite::driver('google')->redirect();
    }

    public function callback()
    {
 
        $oauthUser = Socialite::driver('google')->user();
        // print_r($oauthUser);
        // echo $oauthUser->id;
        // echo $oauthUser->email;
        // $user = User::where('google_id', $oauthUser->id)->first();

        $user = AwalModel::getuserData_by_email($oauthUser->email);
        if(empty($user)){
            $respon='GAGAL';
            $msg='User not Found!';
            return $this->index();
        }else{
            Session::put('id', $user->id);
            Session::put('username', $user->username);
            Session::put('nama_lengkap', $user->nama_lengkap);
            Session::put('level', $user->level);
            Session::put('tipe', $user->tipe);
            Session::put('nm_level', $user->nm_level);
            Session::put('smt_active', smt_active()['smt_active']);
            Session::put('kd_smt_active', smt_active()['kd_smt_active']);
            Session::put('db_active', db_active());
            $respon='SUKSES';
            $msg='';
            return redirect()->action('DashboardController@index');
        }
        
    }

    public function logout()
    {
        
        Session::forget('id');
        Session::forget('username');
        Session::forget('nama_lengkap');
        Session::forget('level');
        Session::forget('tipe');
        Session::forget('nm_level');
        // return view('frontend.login');
        return \App::call('App\Http\Controllers\Awal@index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
