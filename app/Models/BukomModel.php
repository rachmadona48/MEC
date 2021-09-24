<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;

class BukomModel extends Model
{
	public static function Get_list($req,$user){
		// $requestData = $this->input->post();
		$requestData = $req; 

        // echo $bulan.' - '.$supplier;exit();

        $columns = array( 
		// datatable column index  => database column name
			// 0 => 'no',
			0 => 'status',
			1 => 'nama',
			2 => 'subyek',
			3 => 'date_create'
		);

		$sql = "
				SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('kd_smt_active').".mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.user_pengirim = '".$user."'
				";
		// echo $sql;exit();
		$query = collect(\DB::select($sql));

		// $totalData = $query->num_rows();
		$totalData = collect(\DB::select($sql))->count();

		$totalFiltered = $totalData; 

		$sql = "SELECT bk.id,bk.status,sdm.nama,bk.subyek,bk.isi,bk.lampiran1,bk.ukuran1,bk.nmfile1,bk.lampiran2,bk.ukuran2,
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, '%a %D %b %Y') as date_create,bk.date_send
				FROM ".Session::get('kd_smt_active').".mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.user_pengirim = '".$user."'
				and 1 = 1";




		// getting records as per search parameters
		if( !empty($requestData['search']['value']) ){   
			$sql.=" AND ( lower(subyek) LIKE lower('%".$requestData['search']['value']."%'))";
		}
		

		
		$query= collect(\DB::select($sql));
		// $totalFiltered = $query->num_rows();	
		$totalFiltered = collect(\DB::select($sql))->count();	
		
		// var_dump($requestData) ;exit();

		// $sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."   LIMIT ".$requestData['length']." OFFSET ".$requestData['start']." ";  // adding length
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
					"draw"            => intval( $requestData['draw'] ),   
					"recordsTotal"    => intval( $totalData ),  
					"recordsFiltered" => intval( $totalFiltered ), 
					"data"            => $data   
					);

		echo json_encode($json_data); 
	}

	public static function add_bukom($username,$subyek,$isi,$lampiran1,$size1,$nm_file1,$lampiran2,$size2,$nm_file2,$lampiran3,$size3,$nm_file3,$status,$date_send){
        date_default_timezone_set('Asia/Jakarta');

        $insert = DB::table(Session::get('kd_smt_active').".mec_bukom")->insertGetId(
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

        $insert = DB::table(Session::get('kd_smt_active').".mec_bukom_penerima")->insertGetId(
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
				bk.nmfile2,bk.lampiran3,bk.ukuran3,bk.nmfile3,DATE_FORMAT(bk.date_create, "%a %D %b %Y") as date_create,bk.date_send
				FROM '.Session::get('kd_smt_active').'.mec_bukom bk
				LEFT JOIN tbl_sdm sdm on bk.user_pengirim = sdm.finger
				WHERE bk.id = '.$id_bukom.'
			';
		// echo $sql;exit();
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }
    
}
