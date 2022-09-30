<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Session;

class DashboardModel extends Model
{
	public static function grade_sdm($username,$tipe){
		if($username == 'admin'){
				$where = '';
			}else{	
	
				// $where = '
				// 		WHERE p.grade in (
				// 			SELECT
				// 				p.grade 
				// 			FROM
				// 				'.Session::get('kd_smt_active').'.priv_grade g,
				// 				'.Session::get('kd_smt_active').'.pelajaran p 
				// 			WHERE
				// 				( g.pelajaran = p.kode ) 
				// 				AND ( g.guru = "'.$username.'" )
				// 		)';	
	
				$where = 'WHERE g.finger="'.$username.'"';	
			}
	
			// $sql = 'SELECT
			// 			p.grade as kode
			// 		FROM
			// 			'.Session::get('kd_smt_active').'.pelajaran p 
			// 		'.$where.'
			// 		GROUP BY p.grade
			// 		ORDER BY p.grade';	
	
			$sql = 'SELECT
						g.kode_grade as kode
					FROM
						'.db_active().'.priv_guru_kelas as g
					'.$where.'
					group by g.kode_grade 
					order by kode';	
	
			// echo $sql;exit();
			$query=DB::select($sql);
		return $query;
	}

    public static function getprofile_sdm($username){
    	$sql = 'SELECT sdm.gelar_depan,sdm.gelar_belakang,sdm.nama,sdm.jenis_kelamin,ag.agama,darah.gol_darah,
				sdm.tempat_lahir,sdm.tgl_lahir,nkh.status_pernikahan,sdm.alamat,sdm.no_induk_pegawai,sdm.kode_pos,
				sdm.tgl_gabung,sdm.no_telp,sdm.email,sdm.profesi
				from tbl_sdm sdm
				LEFT JOIN ref_agama ag on sdm.agama = ag.id
				LEFT JOIN ref_gol_darah darah on sdm.id_gol_darah = darah.id
				LEFT JOIN ref_status_pernikahan nkh on sdm.status_pernikahan = nkh.id
				WHERE sdm.finger = "'.$username.'"
			';
		// echo $sql;
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    public static function getprofile_siswa($username){
    	$sql = 'SELECT sdm.nama,sdm.jenis_kelamin,ag.agama,darah.gol_darah,
				sdm.tempat_lahir,sdm.tgl_lahir,sdm.alamat,sdm.nisn,sdm.kode_pos,
				sdm.tgl_gabung,sdm.no_telp,sdm.email,"Siswa" as profesi,ks.kelas,
				jr.jurusan
				from tbl_siswa sdm
				LEFT JOIN ref_agama ag on sdm.agama = ag.id
				LEFT JOIN ref_gol_darah darah on sdm.id_gol_darah = darah.id
				LEFT JOIN '.Session::get('kd_smt_active').'.kelas_siswa ks on sdm.nim = ks.nim
				LEFT JOIN '.Session::get('kd_smt_active').'.jurusan jr on ks.jurusan = jr.kode
				WHERE sdm.nim = "'.$username.'"
			';
		// echo $sql; exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    public static function getwali_kelas($username){
    	$sql = 'SELECT count(*) as walas FROM '.db_active().'.ref_kelas_wali
				WHERE finger = "'.$username.'"
				AND ketua = "1"
			';
			// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query->walas;
    }

    public static function getgrade_kelas($username){
		// echo db_active(); exit();
    	$sql = 'SELECT wl.id_kelas,kl.kode_grade,kl.kode as kode_kelas 
				FROM '.db_active().'.ref_kelas_wali wl 
				LEFT JOIN '.db_active().'.ref_kelas kl on wl.id_kelas = kl.id
				WHERE finger = "'.$username.'"
				AND ketua = "1"
				AND kl.kode is not NULL
			';
			// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    public static function add_info($user_id,$id_kelas='',$grade='',$title='',$description='',$file_name=''){
    	date_default_timezone_set('Asia/Jakarta');
    	$sql = "INSERT into mec_info(id_user,id_kelas,kode_grade,title,description,file,datetime,smt_active)
				value(".$user_id.",".$id_kelas.",'".$grade."','".$title."','".$description."','".$file_name."','".date('Y-m-d H:i:s')."','".smt_active()['kd_smt_active']."')
			";
		// echo $sql;exit(); 
	    $query=collect(\DB::insert($sql));
	    return $query;
    }

    public static function count_my_info($id_user,$username,$tipe){
    	$where = "";
    	if($tipe == 'sdm'){
    		if($username != 'admin'){
    			$where = "WHERE ifo.id_kelas in (
							SELECT wl.id_kelas
							FROM ".db_active().".ref_kelas_wali wl 
							LEFT JOIN ".db_active().".ref_kelas kl on wl.id_kelas = kl.id
							WHERE wl.finger in (".$username.")
							AND kl.kode is not NULL
							and smt_active = '".Session::get('kd_smt_active')."'
						)";
    		}
    	}else{
    		$where = "WHERE ifo.id_kelas in (
						SELECT id_kelas
						from ".db_active().".mapping_kelas_siswa
						WHERE nim = '".$username."'
						and smt_active = '".Session::get('kd_smt_active')."'
					)";
    	}

    	$sql = "SELECT count(*) as jml_d
				FROM db_madania_bogor.mec_info ifo
				LEFT JOIN ".db_active().".ref_kelas kl on ifo.id_kelas = kl.id
				".$where."
				ORDER BY ifo.id DESC
				LIMIT 4
			";
    	// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query->jml_d;
    }

    public static function get_my_info($id_user,$username,$tipe){
    	$where = "";
    	if($tipe == 'sdm'){
    		if($username != 'admin'){
    			$where = "WHERE ifo.id_kelas in (
							SELECT wl.id_kelas
							FROM ".db_active().".ref_kelas_wali wl 
							LEFT JOIN ".db_active().".ref_kelas kl on wl.id_kelas = kl.id
							WHERE wl.finger in (".$username.")
							AND kl.kode is not NULL
							and smt_active = '".Session::get('kd_smt_active')."'
						)";
    		}
    	}else{
    		$where = "WHERE ifo.id_kelas in (
						SELECT id_kelas
						from ".db_active().".mapping_kelas_siswa
						WHERE nim = '".$username."'
						and smt_active = '".Session::get('kd_smt_active')."'
					)";
    	}

    	$sql = "SELECT ifo.id,ifo.id_user,ifo.kode_grade,kl.kode as kode_kelas,ifo.title,
				ifo.description,ifo.file,ifo.datetime,DATE_FORMAT(ifo.datetime,'%H:%i:%s %d-%m-%Y') as date_info
				FROM db_madania_bogor.mec_info ifo
				LEFT JOIN ".db_active().".ref_kelas kl on ifo.id_kelas = kl.id
				".$where."
				ORDER BY ifo.id DESC
				LIMIT 4
			";
    	// echo $sql;exit();
	    $query=collect(\DB::select($sql));
	    return $query;
    }

    public static function get_detail_info($id){
    	
    	$sql = "SELECT ifo.id,ifo.id_user,ifo.kode_grade,kl.kode as kode_kelas,ifo.title,
				ifo.description,ifo.file,ifo.datetime,DATE_FORMAT(ifo.datetime,'%H:%i:%s %d-%m-%Y') as date_info
				FROM db_madania_bogor.mec_info ifo
				LEFT JOIN ".db_active().".ref_kelas kl on ifo.id_kelas = kl.id
				WHERE ifo.id = ".$id."
				ORDER BY ifo.id DESC
			";
    	// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    public static function del_info($id){
    	date_default_timezone_set('Asia/Jakarta');
    	$sql = "DELETE FROM db_madania_bogor.mec_info where id = ".$id."
			";
		// echo $sql;exit(); 
	    $query=collect(\DB::delete($sql));
	    return $query;
    }

    public static function update_info($id_user,$id,$title,$description,$file_name){
    	// date_default_timezone_set('Asia/Jakarta');
    	if(empty($file_name)){
    		$sql = "UPDATE db_madania_bogor.mec_info 
    				SET title = '".$title."',
    				description = '".$description."'
    				where id = ".$id."
			";
    	}else{
    		$sql = "UPDATE db_madania_bogor.mec_info 
    				SET title = '".$title."',
    				description = '".$description."',
    				file = '".$file_name."'
    				where id = ".$id."
			";
    	}
    	
		// echo $sql;exit(); 
	    $query=collect(\DB::update($sql));
	    return $query;
    }

    public static function get_smt(){
    	$sql = "SELECT kode,semester FROM mec_smt_active
				ORDER BY id DESC
			";

	    $query=collect(\DB::select($sql));
	    // echo $sql ; exit();
	    return $query;
    }
}
