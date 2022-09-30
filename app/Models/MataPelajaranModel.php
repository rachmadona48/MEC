<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;


class MataPelajaranModel extends Model
{
    public static function pelajaran_week($id_pelajaran){
        $sql = "SELECT * from ".db_active().".weeklyguide 
                where pelajaran='".$id_pelajaran."' and state = 'Publish'
                order by minggu asc
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function pelajaran_count_week($id_pelajaran){
        $sql = "SELECT count(*) as jml_d from ".db_active().".weeklyguide 
                where pelajaran='".$id_pelajaran."'
                order by minggu asc
            ";

        $query=collect(\DB::select($sql))->first();
        // echo $sql ; exit();
        return $query->jml_d;
    }
    
    public static function cek_week($pelajaran,$minggu,$user_id){
    	$sql = 'SELECT count(*) as jml_d
					FROM '.db_active().'.weeklyguide
					WHERE pelajaran='.$pelajaran.' and minggu="'.$minggu.'"  
					and finger = "'.$user_id.'" '
				;	
		// echo $sql;exit();
    	$key=collect(\DB::select($sql))->first();
    	return $key;
    }

    public static function list_week($kode_grade,$id_pelajaran){
        $sql = '
                SELECT id,minggu,pelajaran,tgl_awal,tgl_akhir,state,
                    DATE_FORMAT(tgl_awal, "%d %M %Y") as tglawal,DATE_FORMAT(tgl_akhir, "%d %M %Y") as tglakhir,
                    DATE_FORMAT(tgl_awal, "%d-%m-%Y") as tglawal2,DATE_FORMAT(tgl_akhir, "%d-%m-%Y") as tglakhir2
                from '.db_active().'.weeklyguide
                WHERE pelajaran = "'.$id_pelajaran.'"
                ORDER BY minggu DESC
                '
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function add_week($user_id,$pelajaran,$minggu,$tgl_awal,$tgl_akhir){
    	date_default_timezone_set('Asia/Jakarta');
    	/*$sql = "INSERT into mec_info(id_user,id_kelas,kode_grade,title,description,file,datetime,smt_active)
				value(".$user_id.",".$id_kelas.",'".$grade."','".$title."','".$description."','".$file_name."','".date('Y-m-d H:i:s')."','".smt_active()['kd_smt_active']."')
			";*/
		$sql = "insert into ".db_active().".weeklyguide (minggu,pelajaran,tanggal,finger,tgl_awal,tgl_akhir) 
			values ('".$minggu."','".$pelajaran."','".date('Y-m-d H:i:s')."','".$user_id."','".$tgl_awal."','".$tgl_akhir."')";
		// echo $sql;exit(); 
	    $query=collect(\DB::insert($sql));
	    return $query;
    }

    public static function Change_state_week($id_week,$state){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".db_active().".weeklyguide
                SET state='".$state."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));
        return $query;
    }

    public static function Save_edit_week($id_week,$tgl_awal,$tgl_akhir){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".db_active().".weeklyguide
                SET tgl_awal='".$tgl_awal."',
                tgl_akhir='".$tgl_akhir."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));
        return $query;
    }

    public static function get_student_matpel($username){
    	$sql_mp = 'SELECT p.kode as id_pelajaran, p.nama, p.english, p.grade as kode_grade
					FROM
						'.Session::get('kd_smt_active').'.pelajaran p,
						'.Session::get('kd_smt_active').'.nilai_diknas n 
					WHERE
						( p.kode = n.pelajaran ) 
						AND ( n.nim = '.$username.' ) 
						AND ( p.english IS NOT NULL ) 
						AND ( p.is_elearning IS NOT NULL ) 
					ORDER BY
						p.english'
					;	
        // echo $sql_mp;exit();
	    $query_mp=DB::select($sql_mp);
    	return $query_mp;
    }

    public static function get_student_weekly($username){
        $sql_mp = 'SELECT minggu 
                    FROM '.Session::get('kd_smt_active').'.weeklyguide
                    WHERE pelajaran in (
                        SELECT
                            p.kode 
                        FROM
                            '.Session::get('kd_smt_active').'.pelajaran p,
                            '.Session::get('kd_smt_active').'.nilai_diknas n 
                        WHERE
                            ( p.kode = n.pelajaran ) 
                            AND ( n.nim = '.$username.' ) 
                            AND ( p.english IS NOT NULL ) 
                            AND ( p.is_elearning IS NOT NULL ) 
                        GROUP BY p.kode
                    )
                    GROUP BY minggu
                    ORDER BY minggu DESC'
                    ;   

        $query_mp=DB::select($sql_mp);
        return $query_mp;
    }

    public static function get_data_weekly($id_week){
    	$sql = 'SELECT w.*,s.nama,spv.nama as nm_spv,date_format(w.tanggal,"%W, %M %e, %Y   %H:%i") as tgl,date_format(w.tanggal,"%d %M %Y") as tgl_2,w.supervisor,w.memo,
                date_format(w.tglsuper,"%W, %M %e, %Y   %H:%i") as tgl2,date_format(w.approve,"%W, %M %e, %Y   %H:%i") as tgl3,date_format( w.approve, "%d %M %Y" ) AS tgl_approve,w.topic,
                w.alokasi_waktu,w.kompetensi_inti,w.kompetensi_indikator,w.teknik_pembelajaran,w.Refleksi,w.sumber_alat,w.aims,
                w.mode_delivery,md.deskripsi as md_deskripsi,
                lt.deskripsi as lt_deskripsi
				FROM '.Session::get('kd_smt_active').'.weeklyguide w
                left join tbl_sdm s on w.finger=s.finger
                left join tbl_sdm spv on w.supervisor=spv.finger
                left join '.Session::get('kd_smt_active').'.mec_mode_delivery md on w.mode_delivery = md.id
                left join '.Session::get('kd_smt_active').'.mec_learning_type lt on w.learning_type = lt.id
				WHERE w.id='.$id_week
				;	
		// echo $sql;exit();
    	$key=collect(\DB::select($sql))->first();
    	return $key;
    }

    public static function get_mode_delivery(){
        $sql = 'SELECT id,deskripsi
                FROM '.Session::get('kd_smt_active').'.mec_mode_delivery
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_outcomes(){
        $sql = 'SELECT id,deskripsi
                FROM '.Session::get('kd_smt_active').'.mec_outcomes
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_learning_type(){
        $sql = 'SELECT id,deskripsi
                FROM '.Session::get('kd_smt_active').'.mec_learning_type
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_kd_indikator($id_week,$id_pelajaran){
        $sql = 'SELECT id,kompetensi_dasar,indikator
                FROM '.Session::get('kd_smt_active').'.mec_week_kd_indikator
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_kd_indikator_by_id($id){
        $sql = 'SELECT id,kompetensi_dasar,indikator
                FROM '.Session::get('kd_smt_active').'.mec_week_kd_indikator
                WHERE id = '.$id.' '
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function get_materi_pembelajaran($id_week,$id_pelajaran){
        // $sql = 'SELECT id,materi
        //         FROM '.Session::get('kd_smt_active').'.mec_week_mapel
        //         WHERE id_week = '.$id_week.'
        //         ORDER BY id ASC'
        //         ; 
        $sql = 'SELECT id,judul as materi
                FROM '.Session::get('kd_smt_active').'.slides_item
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_materi_pembelajaran_by_id($id){
        // $sql = 'SELECT id,materi
        //         FROM '.Session::get('kd_smt_active').'.mec_week_mapel
        //         WHERE id = '.$id.'
        //         ORDER BY id ASC'
        //         ; 
        $sql = 'SELECT id,judul as materi
                FROM '.Session::get('kd_smt_active').'.slides_item
                WHERE id = '.$id.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function get_langkah_pembelajaran($id_week,$id_pelajaran){
        $sql = 'SELECT id,kegiatan,durasi,muatan
                FROM '.Session::get('kd_smt_active').'.mec_week_langkah_pembelajaran
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_langkah_pembelajaran_by_id($id){
        $sql = 'SELECT id,kegiatan,durasi,muatan
                FROM '.Session::get('kd_smt_active').'.mec_week_langkah_pembelajaran
                WHERE id = '.$id
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function get_hasil_pembelajaran($id_week,$id_pelajaran){
        $sql = 'SELECT id,indikator,tehnik,bentuk_instrumen,sampel_instrumen
                FROM '.Session::get('kd_smt_active').'.mec_week_hasil_pembelajaran
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_hasil_pembelajaran_by_id($id){
        $sql = 'SELECT id,indikator,tehnik,bentuk_instrumen,sampel_instrumen
                FROM '.Session::get('kd_smt_active').'.mec_week_hasil_pembelajaran
                WHERE id = '.$id
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function Get_mst_outcomes($id_week,$id_pelajaran){
        $sql = "SELECT mst.*
                from ".Session::get('kd_smt_active').".mec_outcomes mst
                where (mst.id_parent = 0 or mst.id_parent is null)
                order by mst.id asc
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function get_mstRubrik($id_week,$id_pelajaran){
        $sql = "SELECT mst.*,mwb.id as id_mwb 
                from ".Session::get('kd_smt_active').".mec_master_rubrik mst
                LEFT JOIN ".Session::get('kd_smt_active').".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where (mst.id_parent = 0 or mst.id_parent is null)
                and mwb.id is null
                order by mst.id asc
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function get_mstChild_outcomes($id_parent){
        $sql = "SELECT * from ".Session::get('kd_smt_active').".mec_outcomes
                where id_parent = ".$id_parent."
                order by id asc
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function get_mstChild_rubrik($id_mst_rubrik){
        $sql = "SELECT * from ".Session::get('kd_smt_active').".mec_master_rubrik
                where id_parent = ".$id_mst_rubrik."
                order by id asc
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function get_week_outcomes($kode_grade,$id_pelajaran,$id_week,$week,$privilege){
        $html = "";

        $sql = "SELECT mwo.id as id_mwo,mst.id,mst.id_parent,mst.deskripsi as deskripsi_child,prt.deskripsi as dekripsi_parent
                from ".Session::get('kd_smt_active').".mec_week_outcomes mwo
                LEFT JOIN ".Session::get('kd_smt_active').".mec_outcomes mst on mwo.outcomes = mst.id
                LEFT JOIN ".Session::get('kd_smt_active').".mec_outcomes prt on mst.id_parent = prt.id
                WHERE mwo.id_week = ".$id_week." and mwo.pelajaran = ".$id_pelajaran."
                order by mst.id asc "
                ;  
        // echo $sql;exit();
                
        $query=collect(\DB::select($sql));


            foreach ($query as $key) {
                
                $html.='
                    <tr>
                        <td><center>'.$key->dekripsi_parent.'<center/></td>
                        <td><center>'.$key->deskripsi_child.'</center></td>
                        <td>
                            <center>';
                if ($privilege > 0){
                $html.='
                                <button class="btn btn-danger btn-outline" onclick="delete_outcomes(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$id_week.'\',\''.$week.'\',\''.$key->id_mwo.'\')">
                                    <i class="fa fa-trash"></i>
                                </button>';
                }

                $html.='
                            </center>
                        </td>
                    </tr>
                ';

                

                
            }
        
        return $html;
    }

    public static function get_week_rubrik($kode_grade,$id_pelajaran,$id_week,$week,$privilege){
        $html = "";
        $sql = "SELECT mst.*,mwb.id as id_mwb 
                from ".Session::get('kd_smt_active').".mec_master_rubrik mst
                LEFT JOIN ".Session::get('kd_smt_active').".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where (mst.id_parent = 0 or mst.id_parent is null)
                and mwb.id is not null
                order by mst.id asc"
                ;   
        // echo $sql;exit();
                
        $query=collect(\DB::select($sql));



        if($query){
            foreach ($query as $key) {
                

                $sql_child = "SELECT mst.*,mwb.id as id_mwb,mwb.maks_skor
                from ".Session::get('kd_smt_active').".mec_master_rubrik mst
                LEFT JOIN ".Session::get('kd_smt_active').".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where mst.id_parent = ".$key->id."
                and mwb.id is not null
                order by mst.id asc"
                ;   
                
                        
                $query_child=collect(\DB::select($sql_child));
                $rowspan = count($query_child)+1;
                $html.='
                    <tr>
                        <td rowspan="1" colspan="3"><b>'.$key->nama.'</b></td>
                        <td rowspan="'.$rowspan.'" style="vertical-align: middle;">
                            <center>';
                if ($privilege > 0){  
                $html.='
                                <button class="btn btn-primary btn-outline" onclick="upd_rubrik(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$id_week.'\',\''.$week.'\',\''.$key->id.'\',\''.$key->id_mwb.'\',\''.$key->nama.'\')">
                                    <i class="fa fa-pencil"></i>
                                </button>
                                <button class="btn btn-danger btn-outline" onclick="delete_rubrik(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$id_week.'\',\''.$week.'\',\''.$key->id_mwb.'\')">
                                    <i class="fa fa-trash"></i>
                                </button>';
                }
                
                $html.='
                            </center>
                        </td>
                    </tr>
                ';

                if($query_child){
                    foreach ($query_child as $key_child) {
                        $html.='
                            <tr>
                                <td><center></center></td>
                                <td><center>'.$key_child->nama.'</center></td>
                                <td><center>'.$key_child->maks_skor.'</center></td>
                            </tr>
                        ';
                    }
                }

                
            }
        }

        return $html;
    }

    public static function get_week_rubrik_pdf($kode_grade,$id_pelajaran,$id_week,$week){
        $html = "";
        $sql = "SELECT mst.*,mwb.id as id_mwb 
                from ".Session::get('kd_smt_active').".mec_master_rubrik mst
                LEFT JOIN ".Session::get('kd_smt_active').".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where (mst.id_parent = 0 or mst.id_parent is null)
                and mwb.id is not null
                order by mst.id asc"
                ;   
        // echo $sql;exit();
                
        $query=collect(\DB::select($sql));



        if($query){
            foreach ($query as $key) {
                

                $sql_child = "SELECT mst.*,mwb.id as id_mwb,mwb.maks_skor
                from ".Session::get('kd_smt_active').".mec_master_rubrik mst
                LEFT JOIN ".Session::get('kd_smt_active').".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where mst.id_parent = ".$key->id."
                and mwb.id is not null
                order by mst.id asc"
                ;   
                
                        
                $query_child=collect(\DB::select($sql_child));
                $rowspan = count($query_child)+1;
                $html.='
                    <tr>
                        <td rowspan="1" colspan="3"><b>'.$key->nama.'</b></td>
                    </tr>
                ';

                if($query_child){
                    foreach ($query_child as $key_child) {
                        $html.='
                            <tr>
                                <td><center></center></td>
                                <td><center>'.$key_child->nama.'</center></td>
                                <td><center>'.$key_child->maks_skor.'</center></td>
                            </tr>
                        ';
                    }
                }

                
            }
        }

        return $html;
    }

    public static function get_week_outcomes_pdf($kode_grade,$id_pelajaran,$id_week,$week){
        $html = "";

        $sql = "SELECT mwo.id as id_mwo,mst.id,mst.id_parent,mst.deskripsi as deskripsi_child,prt.deskripsi as dekripsi_parent
                from ".Session::get('kd_smt_active').".mec_week_outcomes mwo
                LEFT JOIN ".Session::get('kd_smt_active').".mec_outcomes mst on mwo.outcomes = mst.id
                LEFT JOIN ".Session::get('kd_smt_active').".mec_outcomes prt on mst.id_parent = prt.id
                WHERE mwo.id_week = ".$id_week." and mwo.pelajaran = ".$id_pelajaran."
                order by mst.id asc "
                ;  
        // echo $sql;exit();
                
        $query=collect(\DB::select($sql));


            foreach ($query as $key) {
                
                $html.='
                    <tr>
                        <td><center>'.$key->dekripsi_parent.'<center/></td>
                        <td><center>'.$key->deskripsi_child.'</center></td>
                    </tr>
                ';

                

                
            }
        
        return $html;
    }

    public static function sv_outcomes($id_week,$id_pelajaran,$child_outcomes,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_outcomes(id_week,pelajaran,outcomes) 
            values (".$id_week.",".$id_pelajaran.",".$child_outcomes.")";
        // echo $sql_kd;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function sv_rubrik($id_week,$id_pelajaran,$rubrik,$maks_skor=0,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_rubrik(id_week,pelajaran,rubrik,maks_skor) 
            values (".$id_week.",".$id_pelajaran.",".$rubrik.",'".$maks_skor."')";
        // echo $sql_kd;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_rubrik($id_week,$id_pelajaran,$rubrik,$maks_skor=0,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "
                UPDATE ".Session::get('kd_smt_active').".mec_week_rubrik
                SET maks_skor=".$maks_skor."
                where id_week = ".$id_week."
                AND pelajaran = ".$id_pelajaran."
                AND rubrik = ".$rubrik."
                ";
        // echo $sql_kd;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function del_outcomes($id_pelajaran,$id_week,$week_outcomes){

        date_default_timezone_set('Asia/Jakarta');
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_outcomes where id = ".$week_outcomes."
                    AND id_week = ".$id_week." AND pelajaran = ".$id_pelajaran."
            ";
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));
        return $query_del;
    }

    public static function del_rubrik($id_pelajaran,$id_week,$week_rubrik){
        $sql = "SELECT mwb.*,mst.id as id_mst
                FROM ".Session::get('kd_smt_active').".mec_week_rubrik mwb
                LEFT JOIN ".Session::get('kd_smt_active').".mec_master_rubrik mst on mwb.rubrik = mst.id
                WHERE mwb.id = ".$week_rubrik."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::select($sql))->first();

        $sql_rb = "SELECT id 
                    FROM ".Session::get('kd_smt_active').".mec_master_rubrik
                    WHERE (id = ".$query->id_mst." or id_parent = ".$query->id_mst.")
            ";
        // echo $sql_rb;exit(); 
        $query_rb=collect(\DB::select($sql_rb));

        $id_del = "";
        foreach ($query_rb as $key) {
            $id_del.=$key->id.',';
        }
        $id_del=substr($id_del, 0, -1);
        // print_r($id_del);exit();

        date_default_timezone_set('Asia/Jakarta');
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_rubrik where rubrik in (".$id_del.")
                    AND id_week = ".$id_week." AND pelajaran = ".$id_pelajaran."
            ";
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));
        return $query_del;
    }

    public static function get_mec_Child_rubrik($id_week,$id_pelajaran,$id_mst_rubrik,$id_mec_rubrik){
        $sql = "
                SELECT mwb.*,mst.id_parent,mst.nama
                FROM ".Session::get('kd_smt_active').".mec_week_rubrik mwb
                LEFT JOIN ".Session::get('kd_smt_active').".mec_master_rubrik mst on mwb.rubrik = mst.id
                WHERE mwb.id_week = ".$id_week."
                AND mwb.pelajaran = ".$id_pelajaran."
                AND mst.id_parent = ".$id_mst_rubrik."
            ";

        $query=collect(\DB::select($sql));
        // echo $sql ; exit();
        return $query;
    }

    public static function get_pelajaran($kode_grade,$id_pelajaran){
        $sql = "
                SELECT nama
                FROM ".Session::get('kd_smt_active').".pelajaran
                WHERE kode = ".$id_pelajaran."
                AND grade = ".$kode_grade."
            ";

        // echo $sql ; exit();
        $query=collect(\DB::select($sql))->first();
        return $query;
    }

    public static function get_priv_pelajaran($id_pelajaran){
        $sql = "
                SELECT sdm.nama,sdm.gelar_depan,sdm.gelar_belakang,sdm.profesi
                FROM ".Session::get('kd_smt_active').".priv_pelajaran pl
                LEFT JOIN tbl_sdm sdm on pl.guru = sdm.finger
                WHERE pl.pelajaran = '".$id_pelajaran."'
            ";

        $query=collect(\DB::select($sql))->first();
        // echo $sql ; exit();
        return $query;
    }

    public static function get_sdm($finger=''){
        $sql = "
                SELECT sdm.nama,sdm.gelar_depan,sdm.gelar_belakang,sdm.profesi
                FROM tbl_sdm sdm
                WHERE sdm.finger = '".$finger."'
            ";
        // echo $sql ; exit();
        $query=collect(\DB::select($sql))->first();
        return $query;
    }





















    public static function get_rubrik_diskusi($id_week,$id_pelajaran){
        $sql = 'SELECT id,nm_siswa,keaktifan,kerjasama,presentasi,bertanya,menjawab,jml_skor
                FROM '.Session::get('kd_smt_active').'.mec_week_rubrik_diskusi
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_rubrik_diskusi_by_id($id){
        $sql = 'SELECT id,nm_siswa,keaktifan,kerjasama,presentasi,bertanya,menjawab,jml_skor
                FROM '.Session::get('kd_smt_active').'.mec_week_rubrik_diskusi
                WHERE id = '.$id
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql))->first();
        return $key;
    }


    public static function get_rubrik_tugas($id_week,$id_pelajaran){
        $sql = 'SELECT id,nm_siswa,ketepatan,skala,kerapihan,simbol,jml_skor
                FROM '.Session::get('kd_smt_active').'.mec_week_rubrik_tugas
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_rubrik_tugas_by_id($id){
        $sql = 'SELECT id,nm_siswa,ketepatan,skala,kerapihan,simbol,jml_skor
                FROM '.Session::get('kd_smt_active').'.mec_week_rubrik_tugas
                WHERE id = '.$id
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql))->first();
        return $key;
    }


    public static function PrivilegeElearning($username,$kode_grade,$pelajaran){
    	if ($username == "admin"){
    		$return = 2;
    	}else{
    		$sql = 'select id from '.Session::get('kd_smt_active').'.priv_supervisor where grade="'. $kode_grade .'" and guru="'.$username.'"';
            // echo $sql;
    		$key=collect(\DB::select($sql));
    		if(count($key) > 0){
    			$return = 2;
    		}else{
    			$sql2 = 'select id,supervisor from '.Session::get('kd_smt_active').'.priv_grade where pelajaran="'. $pelajaran .'" and guru="'.$username.'"';
                // echo $sql2;exit();
    			$hasil=collect(\DB::select($sql2))->first();
    			if(count((array)$hasil) > 0){
    				if($hasil->supervisor){
    					$return = 2;
    				}else{
    					$return = 1;
    				}
    			}else{
    				$return = 0;
    			}
    		}
            // echo 'priv '.$return;exit();
    	}
    	return $return;
    }

    public static function Update_topic($id_week,$kolom,$data_topic,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET ".$kolom." = '".$data_topic."',
                finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));
        return $query;
    }

    public static function Update_topic_date($id_week,$tgl_awal,$tgl_akhir){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET tgl_awal= '".$tgl_awal."',
                tgl_akhir = '".$tgl_akhir."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));
        return $query;
    }

    public static function Update_topic_approve($id_week,$kolom,$data_topic,$approve,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET ".$kolom." = '".$data_topic."',
                tanggal = '".date('Y-m-d H:i:s')."',
                supervisor=".$username.",
                tglsuper=now()
        ";

        if($approve == 'true'){
            $sql .= ",approve=now()";
        }else{
            $sql .= ",approve=null";
        }
        $sql .= " where id = ".$id_week." ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function sv_topic_kd_indikator($id_week,$id_pelajaran,$kompetensi_dasar,$indikator,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_kd_indikator (id_week,pelajaran,kompetensi_dasar,indikator) 
            values (".$id_week.",".$id_pelajaran.",'".$kompetensi_dasar."','".$indikator."')";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_topic_kd_indikator($id_week,$id,$kompetensi_dasar,$indikator,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_kd_indikator
                SET kompetensi_dasar='".$kompetensi_dasar."',
                indikator='".$indikator."'
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_kd_indi($id){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_kd_indikator where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function sv_materi_pelajaran($id_week,$id_pelajaran,$materi,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        // $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_mapel (id_week,materi) 
        //     values (".$id_week.",'".$materi."')";
        $sql_kd = "insert into ".Session::get('kd_smt_active').".slides_item (id_week,pelajaran,judul,finger,tanggal) 
            values (".$id_week.",".$id_pelajaran.",'".$materi."','".$username."','".date('Y-m-d H:i:s')."')";
            
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_materi_pelajaran($id_week,$id,$materi,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        // $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_mapel
        //         SET materi='".$materi."'
        //         where id = ".$id."
        // ";

        $sql = "UPDATE ".Session::get('kd_smt_active').".slides_item
                SET judul='".$materi."',
                finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_mapel($id){
        date_default_timezone_set('Asia/Jakarta');
        // $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_mapel where id = ".$id."
        //     ";

        $sql = "DELETE FROM ".Session::get('kd_smt_active').".slides_item where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function sv_langkah_pembelajaran($id_week,$id_pelajaran,$kegiatan,$durasi,$muatan,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_langkah_pembelajaran (id_week,pelajaran,kegiatan,durasi,muatan) 
            values (".$id_week.",".$id_pelajaran.",'".$kegiatan."','".$durasi."','".$muatan."')";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_langkah_pembelajaran($id_week,$id,$kegiatan,$durasi,$muatan,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_langkah_pembelajaran
                SET kegiatan='".$kegiatan."',
                durasi='".$durasi."',
                muatan='".$muatan."'
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_langkahPembelajaran($id){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_langkah_pembelajaran where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function sv_hasil_pembelajaran($id_week,$id_pelajaran,$indikator,$tehnik,$bentuk_instrumen,$sampel_instrumen,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_hasil_pembelajaran (id_week,pelajaran,indikator,tehnik,bentuk_instrumen,sampel_instrumen) 
            values (".$id_week.",".$id_pelajaran.",'".$indikator."','".$tehnik."','".$bentuk_instrumen."','".$sampel_instrumen."')";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_hasil_pembelajaran($id_week,$id,$indikator,$tehnik,$bentuk_instrumen,$sampel_instrumen,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_hasil_pembelajaran
                SET indikator='".$indikator."',
                tehnik='".$tehnik."',
                bentuk_instrumen='".$bentuk_instrumen."',
                sampel_instrumen='".$sampel_instrumen."'
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_hasilPembelajaran($id){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_hasil_pembelajaran where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }


    public static function sv_rubrik_diskusi($id_week,$id_pelajaran,$nm_siswa,$keaktifan,$kerjasama,$presentasi,$bertanya,$menjawab,$jml_skor,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_rubrik_diskusi (id_week,pelajaran,nm_siswa,keaktifan,kerjasama,presentasi,bertanya,menjawab,jml_skor) 
            values (".$id_week.",".$id_pelajaran.",'".$nm_siswa."',".$keaktifan.",".$kerjasama.",".$presentasi.",".$bertanya.",".$menjawab.",".$jml_skor.")";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_rubrik_diskusi($id_week,$id,$nm_siswa,$keaktifan,$kerjasama,$presentasi,$bertanya,$menjawab,$jml_skor,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_rubrik_diskusi
                SET nm_siswa='".$nm_siswa."',
                keaktifan=".$keaktifan.",
                kerjasama=".$kerjasama.",
                presentasi=".$presentasi.",
                bertanya=".$bertanya.",
                menjawab=".$menjawab.",
                jml_skor=".$jml_skor."
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_rubrikDiskusi($id){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_rubrik_diskusi where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function sv_rubrik_tugas($id_week,$id_pelajaran,$nm_siswa,$ketepatan,$skala,$kerapihan,$simbol,$jml_skor,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "insert into ".Session::get('kd_smt_active').".mec_week_rubrik_tugas (id_week,pelajaran,nm_siswa,ketepatan,skala,kerapihan,simbol,jml_skor) 
            values (".$id_week.",".$id_pelajaran.",'".$nm_siswa."',".$ketepatan.",".$skala.",".$kerapihan.",".$simbol.",".$jml_skor.")";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::insert($sql_kd));

        return $query_kd;
    }

    public static function upd_rubrik_tugas($id_week,$id,$nm_siswa,$ketepatan,$skala,$kerapihan,$simbol,$jml_skor,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".weeklyguide
                SET finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_week."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        $sql_kd = "UPDATE ".Session::get('kd_smt_active').".mec_week_rubrik_tugas
                SET nm_siswa='".$nm_siswa."',
                ketepatan=".$ketepatan.",
                skala=".$skala.",
                kerapihan=".$kerapihan.",
                simbol=".$simbol.",
                jml_skor=".$jml_skor."
                where id = ".$id."
        ";
        // echo $sql;exit(); 
        $query_kd=collect(\DB::update($sql_kd));

        return $query_kd;
    }

    public static function Delete_rubrikTugas($id){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "DELETE FROM ".Session::get('kd_smt_active').".mec_week_rubrik_tugas where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function get_data_tlm_weekly($pelajaran,$id_week){
        $sql = 'SELECT it.*,date_format( it.tanggal, "%e %b %Y %H:%i" ) AS tgl ,s.nama,
                date_format(it.tglsuper,"%W, %M %e, %Y   %H:%i") as tgl2,date_format(it.approve,"%W, %M %e, %Y   %H:%i") as tgl3
                FROM '.Session::get('kd_smt_active').'.slides_item it
                left join tbl_sdm s on it.finger=s.finger
                WHERE it.pelajaran = "'.$pelajaran.'"
                AND it.id_week = "'.$id_week.'" '
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_data_tlm_weekly_by_id($id){
        $sql = 'SELECT it.*,spv.nama as nm_spv,date_format( it.tanggal, "%e %b %Y %H:%i" ) AS tgl ,s.nama,
                date_format(it.tglsuper,"%W, %M %e, %Y   %H:%i") as tgl2,date_format(it.approve,"%W, %M %e, %Y   %H:%i") as tgl3
                FROM '.Session::get('kd_smt_active').'.slides_item it
                left join tbl_sdm s on it.finger=s.finger
                left join tbl_sdm spv on it.supervisor=spv.finger
                WHERE it.id = '.$id
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function get_data_tlm_slide($id){
        $sql = 

            'SELECT
                sl.*,
                date_format( sl.tanggal, "%e %b %Y %H:%i" ) AS tgl,
                it.judul
            FROM
                '.Session::get('kd_smt_active').'.slides_lampiran sl
                LEFT JOIN '.Session::get('kd_smt_active').'.slides_item it on sl.item = it.id
            WHERE
                sl.item = '.$id.'
            ORDER BY
                sl.nama'

                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_data_tlm_slide_by_id($id){
        $sql = 

            'SELECT
                sl.*,
                date_format( sl.tanggal, "%e %b %Y %H:%i" ) AS tgl,
                it.judul
            FROM
                '.Session::get('kd_smt_active').'.slides_lampiran sl
                LEFT JOIN '.Session::get('kd_smt_active').'.slides_item it on sl.item = it.id
            WHERE
                sl.id = '.$id.' '
        ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function add_tlm($user_id,$pelajaran,$minggu,$judul,$isi){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "insert into ".Session::get('kd_smt_active').".slides_item (id_week,pelajaran,tanggal,finger,judul,isi) 
            values ('".$minggu."','".$pelajaran."','".date('Y-m-d H:i:s')."','".$user_id."','".$judul."','".$isi."')";
        // echo $sql;exit(); 
        $query=collect(\DB::insert($sql));
        return $query;
    }

    public static function update_tlm_isi($id_tlm,$isi,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".slides_item
                SET isi='".$isi."',
                finger=".$username.",
                tanggal = '".date('Y-m-d H:i:s')."'
                where id = ".$id_tlm."
        ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));
        return $query;
    }

    public static function Update_tlm_approve($id_tlm,$memo,$approve,$username){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "UPDATE ".Session::get('kd_smt_active').".slides_item
                SET memo = '".$memo."',
                tanggal = '".date('Y-m-d H:i:s')."',
                supervisor=".$username.",
                tglsuper=now()
        ";

        if($approve == 'true'){
            $sql .= ",approve=now()";
        }else{
            $sql .= ",approve=null";
        }
        $sql .= " where id = ".$id_tlm." ";
        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function Add_tlm_lmp($id_tlm,$eksAtc,$namaAtc,$ukuran){
        date_default_timezone_set('Asia/Jakarta');

        $id = DB::table(Session::get('kd_smt_active').".slides_lampiran")->insertGetId(
            [
                'item' => $id_tlm, 
                'tipe' => $eksAtc,
                'nama' => $namaAtc,
                'tanggal' => date('Y-m-d H:i:s'),
                'ukuran' => $ukuran,
            ]
        );
        return $id;
    }

    public static function Delete_tlm_slide($id){
        date_default_timezone_set('Asia/Jakarta');
        $sql = "DELETE FROM ".Session::get('kd_smt_active').".slides_lampiran where id = ".$id."
            ";
        // echo $sql;exit(); 
        $query=collect(\DB::delete($sql));
        return $query;
    }

    public static function get_alokasi_waktu_lt($id_pelajaran,$id_lt){
        $sql = '
                SELECT IFNULL(sum(wg.alokasi_waktu),0) as jml_d
                FROM '.Session::get('kd_smt_active').'.weeklyguide wg
                LEFT JOIN '.Session::get('kd_smt_active').'.mec_learning_type lt on wg.learning_type = lt.id
                WHERE pelajaran = '.$id_pelajaran.'
                AND wg.learning_type = '.$id_lt.'  '
            ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function List_discuss($id_pelajaran){
        $sql = '
                SELECT
                    f.id,
                    f.judul,
                    f.isi,
                    s.nama,
                    date_format( f.mulai, "%d-%m-%Y" ) AS t1,
                    date_format( f.ditutup, "%d-%m-%Y" ) AS t2 
                FROM
                    '.Session::get('kd_smt_active').'.forum_topic f
                    LEFT JOIN db_madania_bogor.tbl_sdm s on f.guru = s.finger
                WHERE
                    f.pelajaran = "'.$id_pelajaran.'"
                ORDER BY
                    mulai'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function Sv_discuss($id_pelajaran,$judul,$ditutup,$isi,$username){
        date_default_timezone_set('Asia/Jakarta');
        if(!empty($ditutup)){
            $ditutup = date('Y-m-d',strtotime($ditutup));
            $sql = "insert into ".Session::get('kd_smt_active').".forum_topic (pelajaran,guru,judul,isi,mulai,ditutup) 
            values ('".$id_pelajaran."','".$username."','".$judul."','".$isi."','".date('Y-m-d H:i:s')."','".$ditutup."')";
        }else{
            $sql = "insert into ".Session::get('kd_smt_active').".forum_topic (pelajaran,guru,judul,isi,mulai) 
            values ('".$id_pelajaran."','".$username."','".$judul."','".$isi."','".date('Y-m-d H:i:s')."')";
        }

        // echo $sql;exit(); 
        $query=collect(\DB::insert($sql));
        return $query;
    }

    public static function Update_discuss($id,$judul,$ditutup,$isi){
        date_default_timezone_set('Asia/Jakarta');
        if(!empty($ditutup)){
            $ditutup = date('Y-m-d',strtotime($ditutup));
            $sql = "UPDATE ".Session::get('kd_smt_active').".forum_topic 
                    SET judul='".$judul."',
                    ditutup='".$ditutup."',
                    isi='".$isi."'
                    where id = ".$id."
                    ";
        }else{
            $sql = "UPDATE ".Session::get('kd_smt_active').".forum_topic 
                    SET judul='".$judul."',
                    isi='".$isi."'
                    where id = ".$id."
                    ";
        }

        // echo $sql;exit();
        $query=collect(\DB::update($sql));


        return $query;
    }

    public static function delete_discuss($id){
        $sql_del = "DELETE FROM ".Session::get('kd_smt_active').".forum_topic where id = ".$id;
        // echo $sql_del;exit(); 
        $query_del=collect(\DB::delete($sql_del));

        $sql_del_cm = "DELETE FROM ".Session::get('kd_smt_active').".forum_comment where topic = ".$id;
        // echo $sql_del;exit(); 
        $query_del_cm=collect(\DB::delete($sql_del_cm));

        return $query_del_cm;
    }

    public static function Get_discuss($id){
        $sql = '
                SELECT
                    f.id,
                    f.judul,
                    f.isi,
                    s.nama,
                    date_format( f.mulai, "%d-%m-%Y %h:%i" ) AS t1,
                    date_format( f.ditutup, "%d-%m-%Y" ) AS t2 
                FROM
                    '.Session::get('kd_smt_active').'.forum_topic f
                    LEFT JOIN db_madania_bogor.tbl_sdm s on f.guru = s.finger
                WHERE
                    f.id = '.$id.' '
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql))->first();
        return $key;
    }

    public static function Get_comment($id){
        $sql = '
                SELECT
                    cm.id,
                    cm.nama,
                    cm.isi,
                    cm.guru,
                    cm.siswa,
                    date_format( cm.tanggal, "%d %M %Y %h:%i" ) AS tgl
                FROM
                    '.Session::get('kd_smt_active').'.forum_comment cm
                WHERE
                    cm.topic = '.$id.' 
                    AND cm.parent_comment is null'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function Sv_comment($id,$comment_discuss,$username,$tipe,$nama,$ip_client){
        date_default_timezone_set('Asia/Jakarta');
        if($tipe=='sdm'){
            // $sql = "insert into ".Session::get('kd_smt_active').".forum_topic (pelajaran,guru,judul,isi,mulai,ditutup) 
            // values ('".$id_pelajaran."','".$username."','".$judul."','".$isi."','".date('Y-m-d H:i:s')."','".$ditutup."')";

            $sql = "insert into ".Session::get('kd_smt_active').".forum_comment (topic,guru,nama,isi,tanggal,komputer) 
            values (".$id.",'".$username."','".$nama."','".$comment_discuss."','".date('Y-m-d H:i:s')."','".$ip_client."')";
        }else{
            $sql = "insert into ".Session::get('kd_smt_active').".forum_comment (topic,siswa,nama,isi,tanggal,komputer) 
            values (".$id.",'".$username."','".$nama."','".$comment_discuss."','".date('Y-m-d H:i:s')."','".$ip_client."')";
        }

        // echo $sql;exit(); 
        $query=collect(\DB::insert($sql));
        return $query;
    }

    public static function Sv_reply_comment($id,$parent_comment,$comment_discuss,$username,$tipe,$nama,$ip_client){
        date_default_timezone_set('Asia/Jakarta');
        if($tipe=='sdm'){
            // $sql = "insert into ".Session::get('kd_smt_active').".forum_topic (pelajaran,guru,judul,isi,mulai,ditutup) 
            // values ('".$id_pelajaran."','".$username."','".$judul."','".$isi."','".date('Y-m-d H:i:s')."','".$ditutup."')";

            $sql = "insert into ".Session::get('kd_smt_active').".forum_comment (topic,guru,nama,isi,tanggal,parent_comment,komputer) 
            values (".$id.",'".$username."','".$nama."','".$comment_discuss."','".date('Y-m-d H:i:s')."',".$parent_comment.",'".$ip_client."')";
        }else{
            $sql = "insert into ".Session::get('kd_smt_active').".forum_comment (topic,siswa,nama,isi,tanggal,parent_comment,komputer) 
            values (".$id.",'".$username."','".$nama."','".$comment_discuss."','".date('Y-m-d H:i:s')."',".$parent_comment.",'".$ip_client."')";
        }

        // echo $sql;exit(); 
        $query=collect(\DB::insert($sql));
        return $query;
    }

    public static function delete_comment($id){

        $sql_del_cm = "DELETE FROM ".Session::get('kd_smt_active').".forum_comment where id = ".$id;
        // echo $sql_del;exit(); 
        $query_del_cm=collect(\DB::delete($sql_del_cm));

        return $query_del_cm;
    }

    public static function get_student_subject($username){
        $sql = '
                SELECT
                    p.kode,p.english
                FROM
                    '.Session::get('kd_smt_active').'.pelajaran p,
                    '.Session::get('kd_smt_active').'.nilai_diknas n 
                WHERE
                    ( p.kode = n.pelajaran ) 
                    AND ( n.nim = "'.$username.'" ) 
                    AND ( p.english IS NOT NULL ) 
                    AND ( p.is_elearning IS NOT NULL ) 
                GROUP BY
                    p.kode
                ORDER BY p.english ASC
                '
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }



}
