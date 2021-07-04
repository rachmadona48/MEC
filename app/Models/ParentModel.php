<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;


class ParentModel extends Model
{
    

    public static function parent_data_tlm($minggu,$username){
        $sql = 'SELECT it.*,date_format( it.tanggal, "%e %b %Y %H:%i" ) AS tgl ,s.nama,
                date_format(it.tglsuper,"%W, %M %e, %Y   %H:%i") as tgl2,date_format(it.approve,"%W, %M %e, %Y   %H:%i") as tgl3,
                p.english
                FROM '.Session::get('kd_smt_active').'.slides_item it
                left join tbl_sdm s on it.finger=s.finger
                LEFT JOIN '.Session::get('kd_smt_active').'.pelajaran p on it.pelajaran=p.kode
                WHERE it.id_week in (
                    SELECT id
                    FROM '.Session::get('kd_smt_active').'.weeklyguide
                    WHERE pelajaran in (
                        SELECT
                            p.kode 
                        FROM
                            '.Session::get('kd_smt_active').'.pelajaran p,
                            '.Session::get('kd_smt_active').'.nilai_diknas n 
                        WHERE
                            ( p.kode = n.pelajaran ) 
                            AND ( n.nim = "'.$username.'" ) 
                            AND ( p.english IS NOT NULL ) 
                            AND ( p.is_elearning IS NOT NULL ) 
                        GROUP BY p.kode
                    )
                    AND minggu = "'.$minggu.'" 
                )
                AND approve is not NULL'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_data_interactive($minggu,$username){
        $sql = 'SELECT it.*,DATE_FORMAT(date_from, "%d %M %Y") as dateFrom,DATE_FORMAT(date_to, "%d %M %Y") as dateTo,
                    DATE_FORMAT(date_from, "%m/%d/%Y") as dateFrom2,DATE_FORMAT(date_to, "%m/%d/%Y") as dateTo2
                    FROM '.Session::get('kd_smt_active').'.mec_interactive it
                    WHERE it.id_week in (
                        SELECT id
                        FROM '.Session::get('kd_smt_active').'.weeklyguide
                        WHERE pelajaran in (
                            SELECT
                                p.kode 
                            FROM
                                '.Session::get('kd_smt_active').'.pelajaran p,
                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                            WHERE
                                ( p.kode = n.pelajaran ) 
                                AND ( n.nim = "'.$username.'" ) 
                                AND ( p.english IS NOT NULL ) 
                                AND ( p.is_elearning IS NOT NULL ) 
                            GROUP BY p.kode
                        )
                        AND minggu = "'.$minggu.'" 
                    ) 
                    AND it.state = "Publish"
                    GROUP BY it.id
                    '
                    ;
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_question_interactive_from_parent($id_interactive){
        
        $sql = 'SELECT q.*
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                WHERE q.id_interactive = "'.$id_interactive.'" 
                AND q.state = "Show"
                order by sort ASC'
                ;  
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function show_get_question_interactive($id_interactive){
        $sql = 'SELECT q.id,q.id_week,q.pelajaran,q.id_interactive,q.name_question,q.type,q.sort,q.required,q.state
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                WHERE q.id_interactive = "'.$id_interactive.'" 
                AND q.state = "Show"
                GROUP BY q.id,q.id_week,q.pelajaran,q.id_interactive,q.name_question,q.type,q.sort,q.required,q.state
                order by sort ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    

}
