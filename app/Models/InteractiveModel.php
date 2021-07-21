<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;


class InteractiveModel extends Model
{
    

    public static function get_data_interactive($tipe,$pelajaran,$id_week){
        if($tipe == 'sdm'){
            $sql = 'SELECT it.*,DATE_FORMAT(date_from, "%d %M %Y") as dateFrom,DATE_FORMAT(date_to, "%d %M %Y") as dateTo,
                    DATE_FORMAT(date_from, "%m/%d/%Y") as dateFrom2,DATE_FORMAT(date_to, "%m/%d/%Y") as dateTo2
                    FROM '.Session::get('kd_smt_active').'.mec_interactive it
                    WHERE it.pelajaran = "'.$pelajaran.'"
                    AND it.id_week = "'.$id_week.'" '
                    ; 
        }else{  
            $sql = 'SELECT it.*,DATE_FORMAT(date_from, "%d %M %Y") as dateFrom,DATE_FORMAT(date_to, "%d %M %Y") as dateTo,
                    DATE_FORMAT(date_from, "%m/%d/%Y") as dateFrom2,DATE_FORMAT(date_to, "%m/%d/%Y") as dateTo2
                    FROM '.Session::get('kd_smt_active').'.mec_interactive it
                    WHERE it.pelajaran = "'.$pelajaran.'"
                    AND it.id_week = "'.$id_week.'" 
                    AND it.state = "Publish"
                    '
                    ; 
        }
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_data_interactive_row($id_interactive){
        $sql = 'SELECT it.*,DATE_FORMAT(date_from, "%d %M %Y") as dateFrom,DATE_FORMAT(date_to, "%d %M %Y") as dateTo,
                DATE_FORMAT(date_from, "%m/%d/%Y") as dateFrom2,DATE_FORMAT(date_to, "%m/%d/%Y") as dateTo2
                FROM '.Session::get('kd_smt_active').'.mec_interactive it
                WHERE it.id = '.$id_interactive.' '
                ; 
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function add_interactive($username,$id_pelajaran,$id_week,$name,$type,$category,$date_from,$date_to,$file_name,$link_canvas){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive")->insertGetId(
            [
                'id_week' => $id_week, 
                'pelajaran' => $id_pelajaran,
                'name' => $name,
                'type' => $type,
                'category' => $category,
                'date_from' => date('Y-m-d',strtotime($date_from)),
                'date_to' => date('Y-m-d',strtotime($date_to)),
                'file_upload' => $file_name,
                'link_canvas' => $link_canvas,
                'state' => 'Draft',
                'user_create' => $username,
                'create_date' => date('Y-m-d H:i:s'),
            ]
        );
        return $insert;
    }

    public static function Update_state($id,$state,$username){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive
                SET state = '".$state."',
                update_date = '".date('Y-m-d H:i:s')."',
                user_update=".$username."
                
        ";


        if($state=='Publish'){
            $sql .= ",confirm='".date('Y-m-d H:i:s')."' ";
        }else{
            $sql .= ",confirm=null";
        }
        $sql .= " where id = ".$id." ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function edit_interactive($username,$id,$name,$type,$category,$date_from,$date_to,$file_name,$link_canvas){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive
                SET name = '".$name."',
                type = '".$type."',
                category = '".$category."',
                date_from = '".date('Y-m-d',strtotime($date_from))."',
                date_to = '".date('Y-m-d',strtotime($date_to))."',
                update_date = '".date('Y-m-d H:i:s')."',
                user_update=".$username."
                
        ";

        if($file_name!=null){
            $sql .= ",file_upload ='".$file_name."' ";
        }

        if($link_canvas!=null){
            $sql .= ",link_canvas ='".$link_canvas."' ";
        }
        
        $sql .= " where id = ".$id." ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function delete_interactive($id){
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".mec_interactive where id = ".$id;
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));
        return $query_del;
    }


    #question
    public static function get_question_interactive($pelajaran,$id_week,$id_interactive){
        $sql = 'SELECT q.*
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                WHERE q.pelajaran = "'.$pelajaran.'"
                AND q.id_week = "'.$id_week.'" 
                AND q.id_interactive = "'.$id_interactive.'" 
                order by sort ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_question_interactive_from_student($tipe_user,$pelajaran,$id_week,$id_interactive){
        if($tipe_user == 'sdm'){
            $sql = 'SELECT q.*
                    FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                    WHERE q.pelajaran = "'.$pelajaran.'"
                    AND q.id_week = "'.$id_week.'" 
                    AND q.id_interactive = "'.$id_interactive.'" 
                    order by sort ASC'
                    ;   
        }else{
            $sql = 'SELECT q.*
                    FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                    WHERE q.pelajaran = "'.$pelajaran.'"
                    AND q.id_week = "'.$id_week.'" 
                    AND q.id_interactive = "'.$id_interactive.'" 
                    AND q.state = "Show"
                    order by sort ASC'
                    ;  
        }
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function show_get_question_interactive($pelajaran,$id_week,$id_interactive){
        $sql = 'SELECT q.id,q.id_week,q.pelajaran,q.id_interactive,q.name_question,q.type,q.sort,q.required,q.state
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question q
                WHERE q.pelajaran = "'.$pelajaran.'"
                AND q.id_week = "'.$id_week.'" 
                AND q.id_interactive = "'.$id_interactive.'" 
                AND q.state = "Show"
                GROUP BY q.id,q.id_week,q.pelajaran,q.id_interactive,q.name_question,q.type,q.sort,q.required,q.state
                order by sort ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function last_sort_question($pelajaran,$id_week,$id_interactive){
        $sql = 'SELECT count(*) as jml_d
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question
                WHERE pelajaran='.$pelajaran.' and id_week="'.$id_week.'"  
                and id_interactive = "'.$id_interactive.'" '
            ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        if($key->jml_d <= 0){
            $return = 1;
        }else{
            $sql2 = 'SELECT sort+1 as new_sort
                FROM '.Session::get('kd_smt_active').'.mec_interactive_question
                WHERE pelajaran='.$pelajaran.' and id_week='.$id_week.'  
                and id_interactive = '.$id_interactive.' 
                order by sort desc limit 1'
            ;   
            // echo $sql2;exit();
            $key2=collect(\DB::select($sql2))->first();
            $return=$key2->new_sort;
        }
        return $return;
    }

    public static function add_question_interactive($id_pelajaran,$id_week,$id_interactive,$name_question,$type,$required,$state,$sort,$file_name){

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_question")->insertGetId(
            [
                'id_week' => $id_week, 
                'pelajaran' => $id_pelajaran,
                'id_interactive' => $id_interactive,
                'name_question' => $name_question,
                'type' => $type,
                'required' => $required,
                'state' => $state,
                'sort' => $sort,
                'file' => $file_name,
            ]
        );
        return $insert;
    }

    public static function Update_question($id_question,$name_question,$type,$required,$file_name){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_question
                SET name_question = '".$name_question."',
                file = '".$file_name."',
                type = '".$type."',
                required = '".$required."'
                where id = ".$id_question."
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function Update_sort($id_question,$new_sort){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_question
                SET sort = ".$new_sort."
                where id = ".$id_question."
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function Update_state_qt($id_question,$state){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_question
                SET state = '".$state."'
                where id = ".$id_question."
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function delete_question($id){
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".mec_interactive_question where id = ".$id;
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));
        return $query_del;
    }

    public static function add_answer($id_pelajaran,$id_week,$id_interactive,$id_question,$name_answer,$true,$skor){

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_answers")->insertGetId(
            [
                'id_week' => $id_week, 
                'pelajaran' => $id_pelajaran,
                'id_interactive' => $id_interactive,
                'id_question' => $id_question,
                'name_answer' => $name_answer,
                'true' => $true,
                'skor' => $skor,
            ]
        );
        return $insert;
    }

    public static function Edit_answer_question($id,$name_answer,$true,$skor){

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_answers
                SET name_answer = '".$name_answer."',
                `true` = '".$true."',
                skor = ".$skor."
                where id = ".$id."
                
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function add_answer_matching($id_pelajaran,$id_week,$id_interactive,$id_question,$question_matching,$name_answer,$true,$skor){

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_answers")->insertGetId(
            [
                'id_week' => $id_week, 
                'pelajaran' => $id_pelajaran,
                'id_interactive' => $id_interactive,
                'id_question' => $id_question,
                'question_matching' => $question_matching,
                'name_answer' => $name_answer,
                'true' => $true,
                'skor' => $skor,
            ]
        );
        return $insert;
    }

    public static function Edit_answer_matching($id,$question_matching,$name_answer,$true,$skor){

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_answers
                SET question_matching = '".$question_matching."',
                name_answer = '".$name_answer."',
                `true` = '".$true."',
                skor = ".$skor."
                where id = ".$id."
                
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function delete_answer($id){
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".mec_interactive_answers where id = ".$id;
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));
        return $query_del;
    }


    public static function cek_responses($username,$id_interactive){
        $sql = 'SELECT count(*) as jml_d
                FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                WHERE username="'.$username.'"  
                and id_interactive = "'.$id_interactive.'" '
            ;   
        // echo $sql;exit();
        $query=collect(\DB::select($sql))->first();
        
        return $query->jml_d;
    }

    public static function new_idResponse(){
        // echo $id_interactive;exit();
        $sql_count = 'SELECT count(*) as jml_d
                FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                '
            ;   
        // echo $sql_count;exit();
        $query_count=collect(\DB::select($sql_count))->first();
        if($query_count->jml_d <= 0){
            $return = 1;
        }else{
            $sql = 'SELECT idResponse
                FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                order by idResponse desc limit 1
                '
            ;   
            // echo $sql;exit();
            $query=collect(\DB::select($sql))->first();
            $return = $query->idResponse+1;
        }

        return $return;
    }

    public static function add_upload_appraisal($username,$idResponse,$id_interactive,$file_name){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_appraisal")->insertGetId(
            [
                'id_interactive' => $id_interactive, 
                'idResponse' => $idResponse,
                'username' => $username,
                'file' => $file_name,
                'date_create' => date('Y-m-d H:i:s')
            ]
        );
        return $insert;
    }

    public static function add_canvas_appraisal($username,$idResponse,$id_interactive){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_appraisal")->insertGetId(
            [
                'id_interactive' => $id_interactive, 
                'idResponse' => $idResponse,
                'username' => $username,
                'date_create' => date('Y-m-d H:i:s')
            ]
        );
        return $insert;
    }

    public static function show_responses_file_student($username,$id_interactive){
        $sql = 'SELECT *
                FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                WHERE username="'.$username.'"  
                and id_interactive = "'.$id_interactive.'" 
                order by idResponse desc limit 1'
            ;   
        // echo $sql;exit();
        $query=collect(\DB::select($sql))->first();
        
        return $query;
    }

    public static function get_answer($id_answer){
        $sql_ans = 'SELECT ans.*
                FROM '.Session::get('kd_smt_active').'.mec_interactive_answers ans
                WHERE ans.id = "'.$id_answer.'"
                order by ans.id DESC limit 1
                '
        ;   
        // echo $sql_ans;exit();
        $query_ans=collect(\DB::select($sql_ans))->first();

        return $query_ans;
    }

    public static function insert_response($username,$id_interactive,$id_question,$id_answer,$val,$skor,$new_idResponse,$true){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_responses")->insertGetId(
            [
                'id_interactive' => $id_interactive, 
                'id_question' => $id_question,
                'id_answer' => $id_answer,
                'response' => $val,
                'skor' => $skor,
                'true' => $true,
                'idResponse' => $new_idResponse,
                'datetime' => date('Y-m-d H:i:s'),
                'user' => $username,
            ]
        );
        return $insert;
    }

    public static function get_response($new_idResponse){
        $sql_ans = 'SELECT id_interactive,SUM(skor) as total_skor
                FROM '.Session::get('kd_smt_active').'.mec_interactive_responses
                WHERE idResponse = '.$new_idResponse.'
                AND `true` = "True"
                GROUP BY id_interactive
                '
        ;   
        // echo $sql_ans;exit();
        $query_ans=collect(\DB::select($sql_ans))->first();

        return $query_ans;
    }

    public static function insert_appraisal($username,$id_interactive,$new_idResponse,$total_skor){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_interactive_appraisal")->insertGetId(
            [
                'id_interactive' => $id_interactive, 
                'idResponse' => $new_idResponse,
                'username' => $username,
                'skor_temp' => $total_skor,
                'skor_final' => $total_skor,
                'date_create' => date('Y-m-d H:i:s'),
                
            ]
        );
        return $insert;
    }

    public static function get_appraisal($id_interactive){
        $sql = '
                SELECT
                    ap.*,us.nama_lengkap 
                FROM
                    mdn120202021.mec_interactive_appraisal ap
                LEFT JOIN tbl_users us on ap.username=us.username
                WHERE
                    id_interactive = '.$id_interactive.'
                ORDER BY ap.id ASC
                '
        ;   
        // echo $sql;exit();
        $query=collect(\DB::select($sql));

        return $query;
    }

    public static function Edit_appraisal($username,$id_appraisal,$skor_final,$note){

        $sql = "UPDATE ".Session::get('kd_smt_active').".mec_interactive_appraisal
                SET note = '".$note."',
                skor_final = ".$skor_final.",
                user_edit = ".$username.",
                date_edit = '".date('Y-m-d H:i:s')."'
                where id = ".$id_appraisal."
                
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }


    

}
