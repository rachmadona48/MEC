<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;

class BukomModel extends Model
{
	public static function Get_list($type_user,$req,$user){
		// $requestData = $this->input->post();
		$requestData = $req; 

        // echo $bulan.' - '.$supplier;exit();

        $columns = array( 
		// datatable column index  => database column name
			// 0 => 'no',
			0 => 'date_send',
			1 => 'nama',
			2 => 'subyek',
			3 => 'date_create'
		);

        if($type_user=='sdm'){
        	$sql = "
				SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('db_active').".mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.user_pengirim = '".$user."'
				";
		}else{
			$sql = "
				SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('db_active').".mec_bukom_penerima pn
				LEFT JOIN ".Session::get('db_active').".mec_bukom bk on pn.id_bukom = bk.id
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE pn.user_penerima = '".$user."'
				AND bk.status = 'Send'
				";
		}
		
		// echo $sql;exit();
		$query = collect(\DB::select($sql));

		// $totalData = $query->num_rows();
		$totalData = collect(\DB::select($sql))->count();

		$totalFiltered = $totalData; 

		if($type_user=='sdm'){
			$sql = "SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('db_active').".mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.user_pengirim = '".$user."'
				and 1 = 1";
		}else{
			$sql = "
				SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('db_active').".mec_bukom_penerima pn
				LEFT JOIN ".Session::get('db_active').".mec_bukom bk on pn.id_bukom = bk.id
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE pn.user_penerima = '".$user."'
				AND bk.status = 'Send'
				and 1 = 1
				";
		}


		// getting records as per search parameters
		if( !empty($requestData['search']['value']) ){   
			$sql.=" AND ( lower(subyek) LIKE lower('%".$requestData['search']['value']."%'))";
		}
		

		
		$query= collect(\DB::select($sql));
		// $totalFiltered = $query->num_rows();	
		$totalFiltered = collect(\DB::select($sql))->count();	
		
		// var_dump($requestData) ;exit();

		// $sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."   LIMIT ".$requestData['length']." OFFSET ".$requestData['start']." ";  // adding length
		$sql.=" ORDER BY date_send DESC";  // adding length
		// echo $sql;exit();

		$query= collect(\DB::select($sql));
		
		$data = array();
		// $no = 1;
		// $no = $_POST['start'];	
		$no = 1;			

		foreach($query as $row){

			
			
			$nestedData=array(); 


            // $this->format_uang->rp_format($kfm->nominal_deposit)

            if($row->status=='Draft'){
            	$status = '<span class="label label-warning">'.$row->status.'</span>';
            }else{
            	$status = '<span class="label label-info">'.$row->status.'</span>';
            }

			$nestedData[] = '<center>'.$status.'</center>';			
			$nestedData[] = $row->nama;
			$nestedData[] = '<a onclick="detail_bukom(\''.$row->id.'\')">'.$row->subyek.'</a>';
			$nestedData[] = '<center>'.$row->date_create.'</center>';		
			
			$data[] = $nestedData;
			$no++;
		}	

		$json_data = array(
					// "draw"            => intval( $requestData['draw'] ),  
					"draw"            => 0,  
					"recordsTotal"    => intval( $totalData ),  
					"recordsFiltered" => intval( $totalFiltered ), 
					"data"            => $data   
					);

		echo json_encode($json_data); 
	}

	public static function add_bukom($username,$subyek,$isi,$lampiran1,$size1,$nm_file1,$lampiran2,$size2,$nm_file2,$lampiran3,$size3,$nm_file3,$status,$date_send){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(db_active().".mec_bukom")->insertGetId(
            [
                'status' => $status, 
                'user_pengirim' => $username,
                'subyek' => $subyek,
                'isi' => $isi,
                'lampiran1' => $lampiran1,
                'ukuran1' => $size1,
                'nmfile1' => $nm_file1,
                'lampiran2' => $lampiran2,
                'ukuran2' => $size2,
                'nmfile2' => $nm_file2,
                'lampiran3' => $lampiran3,
                'ukuran3' => $size3,
                'nmfile3' => $nm_file3,
                'date_create' => date('Y-m-d H:i:s'),
                'date_send' => $date_send,
            ]
        );
        return $insert;
    }

    public static function add_penerima($id_bukom,$nim_siswa){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(db_active().".mec_bukom_penerima")->insertGetId(
            [
                // 'status' => $id_week, 
                'id_bukom' => $id_bukom,
                'user_penerima' => $nim_siswa,
                
            ]
        );
        return $insert;
    }

    public static function Get_bukom($id_bukom){
    	$sql = 'SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, "%a %D %b %Y") as date_create,
				DATE_FORMAT(bk.date_send, "%a %D %b %Y") as date_send
				FROM '.Session::get('db_active').'.mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.id = '.$id_bukom.'
			';
		// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    public static function Get_bukom_penerima($id_bukom){
    	// $sql = 'SELECT sdm.nama,ks.kelas
		// 		FROM '.Session::get('db_active').'.mec_bukom_penerima pn
		// 		LEFT JOIN '.Session::get('db_active').'.kelas_siswa ks on pn.user_penerima = ks.nim
		// 		LEFT JOIN tbl_siswa sdm on pn.user_penerima = sdm.nim
		// 		WHERE pn.id_bukom = '.$id_bukom.'
		// 		ORDER BY ks.kelas ASC
		// 	';

		$sql = 'SELECT sdm.nama,ks.kode as kelas
				FROM '.Session::get('db_active').'.mec_bukom_penerima pn
				LEFT JOIN '.Session::get('db_active').'.mapping_kelas_siswa mpk on pn.user_penerima = mpk.nim
				LEFT JOIN '.Session::get('db_active').'.ref_kelas ks on mpk.id_kelas = ks.id
				LEFT JOIN tbl_siswa sdm on pn.user_penerima = sdm.nim
				WHERE pn.id_bukom = '.$id_bukom.'
				ORDER BY ks.kode ASC
			';

		// echo $sql;exit();
	    $query=collect(\DB::select($sql));
	    return $query;
    }

    public static function Get_bukom_reply($id_bukom){
    	// $sql = '
		// 		SELECT
		// 		CASE
						
		// 			WHEN
		// 				( sdm.nama IS NULL ) THEN
		// 					sw.nama ELSE sdm.nama 
		// 					END AS nama,
		// 			CASE
							
		// 					WHEN ( ks.kelas IS NULL ) THEN
		// 					"" ELSE concat( "(", ks.kelas, ")" ) 
		// 				END AS kelas,
		// 				rp.isi_reply,
		// 				DATE_FORMAT( rp.date_reply, "%a %D %b %Y" ) AS date_reply 
		// 			FROM
		// 				'.Session::get('db_active').'.mec_bukom_reply rp
		// 				LEFT JOIN '.Session::get('db_active').'.kelas_siswa ks ON rp.user_reply = ks.nim
		// 				LEFT JOIN tbl_sdm sdm ON rp.user_reply = sdm.finger
		// 				LEFT JOIN tbl_siswa sw ON rp.user_reply = sw.nim 
		// 			WHERE
		// 				rp.id_bukom = '.$id_bukom.' 
		// 		ORDER BY
		// 			rp.date_reply ASC
		// 	';

		$sql = '
				SELECT
					CASE	
						WHEN ( sdm.nama IS NULL ) THEN sw.nama 
						ELSE sdm.nama 
					END AS nama,
					CASE
						WHEN ( ks.kode IS NULL ) THEN "" 
						ELSE concat( "(", ks.kode, ")" ) 
					END AS kelas,
					rp.isi_reply,
					DATE_FORMAT( rp.date_reply, "%a %D %b %Y" ) AS date_reply 
				FROM
					'.Session::get('db_active').'.mec_bukom_reply rp
					LEFT JOIN '.Session::get('db_active').'.mapping_kelas_siswa mpk on rp.user_reply = mpk.nim
					LEFT JOIN '.Session::get('db_active').'.ref_kelas ks on mpk.id_kelas = ks.id
					LEFT JOIN tbl_sdm sdm ON rp.user_reply = sdm.finger
					LEFT JOIN tbl_siswa sw ON rp.user_reply = sw.nim 
				WHERE
					rp.id_bukom = '.$id_bukom.'  
				ORDER BY
					rp.date_reply ASC
			';
		// echo $sql;exit();
	    $query=collect(\DB::select($sql));
	    return $query;
    }

    public static function Update_send_bukom($id_bukom,$status){
        date_default_timezone_set('Asia/Jakarta');

        $sql = "UPDATE ".Session::get('db_active').".mec_bukom
                SET status = '".$status."',
                date_send = '".date('Y-m-d H:i:s')."'
                where id = ".$id_bukom."
                
        ";

        // echo $sql;exit();
        $query=collect(\DB::update($sql));

        return $query;
    }

    public static function reply_bukom($username,$id_bukom,$isi_reply){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(db_active().".mec_bukom_reply")->insertGetId(
            [
            	'id_bukom' => $id_bukom,
                'user_reply' => $username,
                'isi_reply' => $isi_reply,
                'date_reply' => date('Y-m-d H:i:s'),
            ]
        );
        return $insert;
    }
    
}
