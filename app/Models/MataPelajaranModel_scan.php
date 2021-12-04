<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;


class MataPelajaranModel_scan extends Model
{
    
    public static function get_data_weekly($id_week,$kd_smt_active){
    	$sql = 'SELECT w.*,s.nama,spv.nama as nm_spv,date_format(w.tanggal,"%W, %M %e, %Y   %H:%i") as tgl,date_format(w.tanggal,"%d %M %Y") as tgl_2,w.supervisor,w.memo,
                date_format(w.tglsuper,"%W, %M %e, %Y   %H:%i") as tgl2,date_format(w.approve,"%W, %M %e, %Y   %H:%i") as tgl3,date_format( w.approve, "%d %M %Y" ) AS tgl_approve,w.topic,
                w.alokasi_waktu,w.kompetensi_inti,w.kompetensi_indikator,w.teknik_pembelajaran,w.Refleksi,w.sumber_alat,w.aims,
                w.mode_delivery,md.deskripsi as md_deskripsi,
                lt.deskripsi as lt_deskripsi
				FROM '.$kd_smt_active.'.weeklyguide w
                left join tbl_sdm s on w.finger=s.finger
                left join tbl_sdm spv on w.supervisor=spv.finger
                left join '.$kd_smt_active.'.mec_mode_delivery md on w.mode_delivery = md.id
                left join '.$kd_smt_active.'.mec_outcomes oc on w.outcomes = oc.id
                left join '.$kd_smt_active.'.mec_learning_type lt on w.learning_type = lt.id
				WHERE w.id='.$id_week
				;	
		// echo $sql;exit();
    	$key=collect(\DB::select($sql))->first();
    	return $key;
    }

    public static function get_kd_indikator($id_week,$id_pelajaran,$kd_smt_active){
        $sql = 'SELECT id,kompetensi_dasar,indikator
                FROM '.$kd_smt_active.'.mec_week_kd_indikator
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_materi_pembelajaran($id_week,$id_pelajaran,$kd_smt_active){
        $sql = 'SELECT id,judul as materi
                FROM '.$kd_smt_active.'.slides_item
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_langkah_pembelajaran($id_week,$id_pelajaran,$kd_smt_active){
        $sql = 'SELECT id,kegiatan,durasi,muatan
                FROM '.$kd_smt_active.'.mec_week_langkah_pembelajaran
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }

    public static function get_hasil_pembelajaran($id_week,$id_pelajaran,$kd_smt_active){
        $sql = 'SELECT id,indikator,tehnik,bentuk_instrumen,sampel_instrumen
                FROM '.$kd_smt_active.'.mec_week_hasil_pembelajaran
                WHERE id_week = '.$id_week.'
                AND pelajaran = '.$id_pelajaran.'
                ORDER BY id ASC'
                ;   
        // echo $sql;exit();
                
        $key=collect(\DB::select($sql));
        return $key;
    }
    public static function get_week_outcomes($kd_smt_active,$kode_grade,$id_pelajaran,$id_week,$week){
        $html = "";

        $sql = "SELECT mwo.id as id_mwo,mst.id,mst.id_parent,mst.deskripsi as deskripsi_child,prt.deskripsi as dekripsi_parent
                from ".$kd_smt_active.".mec_week_outcomes mwo
                LEFT JOIN ".$kd_smt_active.".mec_outcomes mst on mwo.outcomes = mst.id
                LEFT JOIN ".$kd_smt_active.".mec_outcomes prt on mst.id_parent = prt.id
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

    public static function get_week_rubrik($kode_grade,$id_pelajaran,$id_week,$week,$kd_smt_active){
        $html = "";
        $sql = "SELECT mst.*,mwb.id as id_mwb 
                from ".$kd_smt_active.".mec_master_rubrik mst
                LEFT JOIN ".$kd_smt_active.".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where (mst.id_parent = 0 or mst.id_parent is null)
                and mwb.id is not null
                order by mst.id asc"
                ;   
        // echo $sql;exit();
                
        $query=collect(\DB::select($sql));

        if($query){
            foreach ($query as $key) {
                

                $sql_child = "SELECT mst.*,mwb.id as id_mwb,mwb.maks_skor
                from ".$kd_smt_active.".mec_master_rubrik mst
                LEFT JOIN ".$kd_smt_active.".mec_week_rubrik mwb on mst.id = mwb.rubrik and mwb.id_week = ".$id_week." and mwb.pelajaran = ".$id_pelajaran."
                where mst.id_parent = ".$key->id."
                and mwb.id is not null
                order by mst.id asc"
                ;   
                
                        
                $query_child=collect(\DB::select($sql_child));

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

    public static function get_pelajaran($kode_grade,$id_pelajaran,$kd_smt_active){
        $sql = "
                SELECT nama
                FROM ".$kd_smt_active.".pelajaran
                WHERE kode = ".$id_pelajaran."
                AND grade = ".$kode_grade."
            ";

        $query=collect(\DB::select($sql))->first();
        return $query;
    }


}
