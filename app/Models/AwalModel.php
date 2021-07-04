<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
// Use DB;
class AwalModel extends Model
{
    public static function getuserData($username){
    // $value=DB::table('tbl_users')->where('email', $username)->where('blokir','N')->first();
    $sql = 'SELECT id,username,nama_lengkap,tipe,level,nm_level,aktif,email
            FROM
            (
                SELECT us.id,us.username,us.nama_lengkap,us.tipe,us.level,lvl.level as nm_level,us.email,
                (
                    SELECT aktif
                    FROM tbl_sdm
                    WHERE finger = us.username
                    UNION ALL
                    SELECT aktif
                    FROM tbl_siswa
                    WHERE nim = us.username
                ) as aktif
                from tbl_users us
                LEFT JOIN tbl_user_level lvl on us.level=lvl.id_user_level
                WHERE us.username ="'.$username.'"
                AND us.blokir = "N" 
                AND (us.tipe = "sdm" or us.tipe = "siswa") 
                ORDER BY
                    us.id DESC 
                LIMIT 1
            ) dt
            WHERE dt.aktif = "Y"
			';
    // echo $sql;exit();
    $query=collect(\DB::select($sql))->first();
    return $query;
  }

  public static function get_siswa_intranet($username){
    // $value=DB::table('tbl_users')->where('email', $username)->where('blokir','N')->first();
    $sql = 'SELECT *
            FROM siswa_intranet
            WHERE nim = "'.$username.'"
            ';
    // echo $sql;exit();
    $query=collect(\DB::select($sql))->first();
    return $query;
  }

  public static function getuserData_by_email($email){
    // $value=DB::table('tbl_users')->where('email', $username)->where('blokir','N')->first();
    $sql = 'SELECT id,username,nama_lengkap,tipe,level,nm_level,aktif,email
            FROM
            (
                SELECT us.id,us.username,us.nama_lengkap,us.tipe,us.level,lvl.level as nm_level,us.email,
                (
                    SELECT aktif
                    FROM tbl_sdm
                    WHERE finger = us.username
                    UNION ALL
                    SELECT aktif
                    FROM tbl_siswa
                    WHERE nim = us.username
                ) as aktif
                from tbl_users us
                LEFT JOIN tbl_user_level lvl on us.level=lvl.id_user_level
                WHERE us.email ="'.$email.'"
                AND us.blokir = "N" 
                AND (us.tipe = "sdm" or us.tipe = "siswa") 
                ORDER BY
                    us.id DESC 
                LIMIT 1
            ) dt
            WHERE dt.aktif = "Y"
            ';
    // echo $sql;exit();
    $query=collect(\DB::select($sql))->first();
    return $query;
  }
}
