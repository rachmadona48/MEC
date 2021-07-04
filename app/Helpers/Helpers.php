<?php
use Illuminate\Support\Facades\DB;
// use Session;
if (! function_exists('db_active')) {
    function db_active()
    {
        $sql = 'SELECT default_semester_aktif FROM db_madania.server
				WHERE db_semester = "db_mdn_bogor"
				and aktif = "1"
			';
	    $query=collect(\DB::select($sql))->first();
	    return $query->default_semester_aktif;
    }

    function smt_active()
    {
    	$kd_smt = 'mdn'.substr(db_active(), -9);
    	$sql = "SELECT kode,semester FROM mec_smt_active
				WHERE kode = '".$kd_smt."'
			";
	    $query=collect(\DB::select($sql))->first();

    	$arr = array(
    		'kd_smt_active' => $kd_smt,
    		'smt_active' => $query->semester,
    	);
	    return $arr;
    }

    function cek_db(){
        $sql = 'SELECT count(*) as jml_db
                    FROM INFORMATION_SCHEMA.SCHEMATA
                    WHERE SCHEMA_NAME = "'.Session::get('db_active').'"'
                ;   

        $key_mp=collect(\DB::select($sql))->first();
        return $key_mp->jml_db;
    }

    function cek_db_old(){
        $sql = 'SELECT count(*) as jml_db
                    FROM INFORMATION_SCHEMA.SCHEMATA
                    WHERE SCHEMA_NAME = "'.Session::get('kd_smt_active').'"'
                ;   
        // echo $sql;exit();
        $key_mp=collect(\DB::select($sql))->first();
        return $key_mp->jml_db;
    }
}