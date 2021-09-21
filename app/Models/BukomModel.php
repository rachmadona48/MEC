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
	    $query=collect(\DB::select($sql))->first();
	    return $query;
    }

    
}
