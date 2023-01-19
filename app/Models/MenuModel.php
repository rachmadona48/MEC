<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;
use App\Models\DashboardModel;

class MenuModel extends Model
{
    public static function akses_menu($id_level){
   //  	$sql_tes = 'SELECT * FROM server
			// 		WHERE db_utama = "db_madania_bogor"
			// 		AND aktif = 1
			// ';
	  //   $query_tes=collect(DB::connection('mysql_mdn')->select($sql_tes))->first();
	  //   print_r($query_tes);


    	$sql = 'SELECT a.id_menu,a.id_level,b.title_menu,b.icon_menu,b.link,b.parentID,b.id_status
				from mec_menu_level a
				LEFT JOIN mec_menu b on a.id_menu = b.id_menu
				WHERE a.id_level = "'.$id_level.'" and b.parentID = 0 and b.id_status = 1
				ORDER BY a.id_menu ASC
			';
	    $query=DB::select($sql);
	    $menu = "";
	    foreach ($query as $key) {
	    	$menu .= '
	    			<li id="menu_'.$key->id_menu.'">
		                <a href="'.url($key->link).'"><i class="'.$key->icon_menu.'"></i> <span class="nav-label">'.$key->title_menu.'</span></a>
		            </li>';
	    }
		return $menu;
    }

    public static function akses_menu2($username,$id_level,$tipe,$level){
		$walas = DashboardModel::getwali_kelas($username);
		$grade_walas = DashboardModel::grade_walas($username);
    	$menu = "";
    	/*jika db active ada*/
    	if (cek_db_old()>=1){
    		if($tipe == 'sdm'){
		    	// if($username == 'admin'){
				if($level == '1'){
		    		$where = '';
		    	}else{
					$where = 'WHERE g.finger="'.$username.'"
							or g.kode_grade in (
								SELECT
									kode_grade 
								FROM
								'.Session::get('db_active').'.priv_sdm_akses 
								WHERE
									finger = "'.$username.'"
							)
					';	
		    	}
				$sql = 'SELECT kode
						FROM
						(
							SELECT
								g.kode_grade AS kode 
							FROM
							'.Session::get('db_active').'.priv_guru_kelas AS g 
								'.$where.'
							UNION ALL
							SELECT
								kl.kode_grade AS kode 
							FROM
							'.Session::get('db_active').'.ref_kelas_wali wl
								LEFT JOIN '.Session::get('db_active').'.ref_kelas kl ON wl.id_kelas = kl.id 
							WHERE
								finger = "'.$username.'"
								AND ketua = "1" 
								AND kl.kode IS NOT NULL
							UNION ALL
							SELECT
								nilai.kode_grade AS kode
							FROM
							'.Session::get('db_active').'.pelajaran_nilai AS nilai
							WHERE
								nilai.kode_pelajaran <> "" 
								AND nilai.finger = "'.$username.'" 
							GROUP BY
								nilai.kode_grade
						) dt
						GROUP BY kode
						ORDER BY kode ASC
					';	
				// echo $sql;exit();
		    	$query=DB::select($sql);
		    
			    foreach ($query as $key) {

				    $menu .= '
			    			<li id="menu_'.$key->kode.'">
				                <a href="#"><i class="fa fa-cube"></i> <span class="nav-label">Grade '.$key->kode.'</span></a>
				                <ul class="nav nav-second-level collapse">';

				                // if($username == 'admin'){
								if($level == '1'){
						    		$and_mp = '';
						    		// $and_mp = '
									// AND (
									// 	guru_kelas.finger = "'.$username.'"
									// 	OR guru_kelas.kode_grade in (
									// 		SELECT
									// 			kode_grade 
									// 		FROM
									// 			'.Session::get('db_active').'.priv_sdm_akses 
									// 		WHERE
									// 			finger = "'.$username.'"
									// 	)
									// ) 
									// ';
						    	}else{
									$and_mp = '
									AND (
										guru_kelas.finger = "'.$username.'"
										OR guru_kelas.kode_grade in (
											SELECT
												kode_grade 
											FROM
												'.Session::get('db_active').'.priv_sdm_akses 
											WHERE
												finger = "'.$username.'"
										)
									) 
									';	
						    	}

						if($walas>=1 && $grade_walas->kode_grade_walas==$key->kode){
							$sql_mp = 'SELECT
                                        mpg.kode AS id_pelajaran,
                                        pel.pelajaran_ktsp AS nama,
                                        pel.pelajaran_eng AS english,
                                        nilai.kode_pelajaran 
                                    FROM
                                        '.Session::get('db_active').'.pelajaran_nilai AS nilai
                                        INNER JOIN tbl_pelajaran AS pel ON nilai.id_pelajaran = pel.id 
                                        INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
                                    WHERE
                                        nilai.kode_grade = "'.$key->kode.'"
                                        AND nilai.kode_pelajaran <> "" 
                                        AND mpg.is_elearning = "Y" 
                                    GROUP BY
                                        nilai.kode_pelajaran 
                                    ORDER BY
                                        english
                                        ';
						}else{
							$sql_mp = 'SELECT
									mpg.kode AS id_pelajaran,
									pel.pelajaran_ktsp AS nama,
									pel.pelajaran_eng AS english 
								FROM
									db_madania_bogor.tbl_pelajaran AS pel
									INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
									INNER JOIN '.Session::get('db_active').'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
								WHERE
									guru_kelas.kode_grade = "'.$key->kode.'"
									'.$and_mp.'
									AND mpg.is_elearning = "Y" 
									AND guru_kelas.kode_pelajaran <> "" 
									
								GROUP BY
									guru_kelas.kode_pelajaran 
								UNION ALL
								SELECT
									nilai.kode_pelajaran AS id_pelajaran,
									pel.pelajaran_ktsp AS nama,
									pel.pelajaran_eng AS english 
								FROM
									'.Session::get('db_active').'.pelajaran_nilai AS nilai
									INNER JOIN db_madania_bogor.tbl_pelajaran AS pel ON nilai.id_pelajaran = pel.id 
								WHERE
									nilai.kode_grade = "'.$key->kode.'" 
									AND nilai.kode_pelajaran <> "" 
									AND nilai.finger = "'.$username.'" 
								GROUP BY
									nilai.kode_pelajaran
								ORDER BY
									english
							';
						}
						
						// echo $sql_mp;exit();
						$query_mp=DB::select($sql_mp);
						foreach ($query_mp as $key_mp) {
						$menu .= '
			                        <li id="menu_'.$key->kode.'_'.$key_mp->id_pelajaran.'">
			                            <a href="'.url('/matpel/'.$key->kode.'/'.$key_mp->id_pelajaran).'">'.$key_mp->english.'</a>
			                        </li>';

			            }

			        $menu .= ' 
			                    </ul>
				            </li>';
			    }

		    }else if($tipe == 'siswa'){
		    	$menu .='
		    		<li>
		                <a href="#"><i class="fa fa-fire"></i> <span class="nav-label">Subject</span><span class="fa arrow"></span></a>
		                <ul class="nav nav-second-level collapse">';

		     //        $sql_mp = 'SELECT kode_grade,kode_pelajaran,id_pelajaran,tp.pelajaran_eng
							// 	FROM '.Session::get('db_active').'.pelajaran_nilai pn
							// 	LEFT JOIN tbl_pelajaran tp on pn.id_pelajaran=tp.id
							// 	WHERE nim = '.$username.'
							// 	ORDER BY tp.pelajaran_eng'
							// ;	

		            $sql_mp = 'SELECT
								mpgrade.kode as id_pelajaran,
								pel.pelajaran_ktsp AS nama,
								pel.pelajaran_eng AS english,
								mpgrade.kode_grade 
							FROM
								'.Session::get('db_active').'.pelajaran_nilai AS nilai
								INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpgrade ON nilai.kode_pelajaran = mpgrade.kode
								INNER JOIN db_madania_bogor.tbl_pelajaran AS pel ON mpgrade.id_pelajaran = pel.id 
							WHERE
								mpgrade.is_elearning = "Y" 
								AND nilai.nim = "'.$username.'"
							GROUP BY
								pel.id 
							ORDER BY
								pel.pelajaran_eng ASC
							'
							;	
					// echo $sql_mp;exit();

			    	$query_mp=DB::select($sql_mp);
			    	foreach ($query_mp as $key_mp) {
		        $menu .='
		                    <li id="menu_'.$key_mp->kode_grade.'_'.$key_mp->id_pelajaran.'">
		                    	<a href="'.url('/matpel/'.$key_mp->kode_grade.'/'.$key_mp->id_pelajaran).'">'.$key_mp->english.'</a>
		                    </li>
		                ';
		            }

		        $menu .='
		                </ul>
		            </li>
		    	';
		    }
    	}else{
    		$menu .='
		            <li style="background: #b91d24 !important;">
	                    <a href="#"><i class="fa fa-warning"></i> <span class="nav-label">Pelajaran pada semester ini belum tercatat di database</span></a>
	                </li>
		    	';
    	}
    	
   
		return $menu;
    }

    public static function akses_menu_matpel($username,$tipe,$kode_grade,$id_pelajaran,$level="",$walas=""){
		// echo $id_pelajaran;exit();
		$grade_walas = DashboardModel::grade_walas($username);
    	$menu = "";
    	/*jika db active dan db smt ada*/
    	if (cek_db_old()>=1){
	    	if($tipe == 'sdm'){

	    			// if($username == 'admin'){
					if($level == "1"){
						$and_mp = '';
						// $and_mp = ' AND ( g.guru = "'.$username.'" ) ';
						// $and_mp = 'AND (
						// 				guru_kelas.finger = "'.$username.'"
						// 				OR guru_kelas.kode_grade in (
						// 					SELECT
						// 						kode_grade 
						// 					FROM
						// 					'.Session::get('db_active').'.priv_sdm_akses 
						// 					WHERE
						// 						finger = "'.$username.'"
						// 				)
						// 			) 
						// '; 
			    	}else{
			    		/*$and_mp = '
			    				AND pgk.finger = '.$username.'
								';*/	
						// $and_mp = 'AND ( g.guru = "'.$username.'" ) ';
						$and_mp = 'AND (
										guru_kelas.finger = "'.$username.'"
										OR guru_kelas.kode_grade in (
											SELECT
												kode_grade 
											FROM
											'.Session::get('db_active').'.priv_sdm_akses 
											WHERE
												finger = "'.$username.'"
										)
									) 
						'; 
			    	}
		    
					// $sql_mp = 'SELECT
					// 		mpg.kode AS id_pelajaran,
					// 		pel.pelajaran_ktsp AS nama,
					// 		pel.pelajaran_eng AS english 
					// 	FROM
					// 		db_madania_bogor.tbl_pelajaran AS pel
					// 		INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
					// 		INNER JOIN '.Session::get('db_active').'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
					// 	WHERE
					// 		guru_kelas.kode_grade = "'.$kode_grade.'"
					// 		'.$and_mp.'
					// 		AND mpg.is_elearning = "Y" 
					// 		AND mpg.kode = "'.$id_pelajaran.'"
					// 	GROUP BY
					// 		guru_kelas.kode_pelajaran 
					// 	ORDER BY
					// 		english
					// ';
					if($walas>=1 && $grade_walas->kode_grade_walas==$kode_grade){
						$sql_mp = 'SELECT
									mpg.kode AS id_pelajaran,
									pel.pelajaran_ktsp AS nama,
									pel.pelajaran_eng AS english,
									nilai.kode_pelajaran 
								FROM
									'.Session::get('db_active').'.pelajaran_nilai AS nilai
									INNER JOIN tbl_pelajaran AS pel ON nilai.id_pelajaran = pel.id 
									INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
								WHERE
									nilai.kode_grade = "'.$kode_grade.'" 
									AND nilai.kode_pelajaran <> "" 
									AND mpg.is_elearning = "Y" 
									AND mpg.kode = "'.$id_pelajaran.'" 
								GROUP BY
									nilai.kode_pelajaran 
								ORDER BY
									english
									';
					}else{
						$sql_mp = 'SELECT id_pelajaran,nama,english,kode_pelajaran
									FROM
									(
										SELECT
											mpg.kode AS id_pelajaran,
											pel.pelajaran_ktsp AS nama,
											pel.pelajaran_eng AS english,
										guru_kelas.kode_pelajaran	
										FROM
											tbl_pelajaran AS pel
											INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
											INNER JOIN '.Session::get('db_active').'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
										WHERE
											guru_kelas.kode_grade = "'.$kode_grade.'"
											'.$and_mp.'
											AND mpg.is_elearning = "Y" 
											AND guru_kelas.kode_pelajaran <> "" 
											AND mpg.kode = "'.$id_pelajaran.'"
									) dt
									GROUP BY kode_pelajaran
									UNION ALL
									SELECT
										nilai.kode_pelajaran AS id_pelajaran,
										pel.pelajaran_ktsp AS nama,
										pel.pelajaran_eng AS english ,
										nilai.kode_pelajaran AS kode_pelajaran 
									FROM
										'.Session::get('db_active').'.pelajaran_nilai AS nilai
										INNER JOIN db_madania_bogor.tbl_pelajaran AS pel ON nilai.id_pelajaran = pel.id 
									WHERE
										nilai.kode_grade = "'.$kode_grade.'"
										AND nilai.kode_pelajaran = "'.$id_pelajaran.'" 
										AND nilai.finger = "'.$username.'" 
									GROUP BY
										nilai.kode_pelajaran 
									ORDER BY english
						';
					}
					
					// echo $sql_mp;exit();
					$key_mp=collect(\DB::select($sql_mp))->first();
				    $menu .= '
			    			<li id="menu_'.$kode_grade.'_'.$id_pelajaran.'">
				                <a href="'.url('/matpel/'.$kode_grade.'/'.$id_pelajaran).'"><i class="fa fa-fire"></i> <span class="nav-label">Grade '.$kode_grade.':'.$key_mp->english.'</span></a>
				            </li>
				                '; 

				    // $menu .= '
			    	// 		<li>
			     //                <a href="#" onclick="add_week(\''.$id_pelajaran.'\')"><i class="fa fa-folder"></i> <span class="nav-label">Add New Week</span></a>
			     //            </li>'; 
				 	$menu .= '
						<li>
							<a onclick="matpel_ld(\''.$kode_grade.'\',\''.$key_mp->id_pelajaran.'\')"><i class="fa fa-folder"></i> <span class="nav-label">Learning Designer</span></a>
						</li>';

			     	$menu .= '
			    			<li>
			                    <a onclick="show_week(\''.$kode_grade.'\',\''.$key_mp->id_pelajaran.'\')"><i class="fa fa-folder"></i> <span class="nav-label">Session</span></a>
			                </li>'; 

	                $sql_w = 'select id,minggu from '.Session::get('db_active').'.weeklyguide where pelajaran="'.$key_mp->id_pelajaran.'" and state ="Publish" order by minggu desc
	                ';
	                // echo $sql_w;exit();
	                $key_w=collect(\DB::select($sql_w));
	                foreach ($key_w as $w) {

	                	$menu .= '
	                			<li>
				                    <a href="#"><i class="fa fa-sitemap"></i><span class="nav-label"> Session '.$w->minggu.'</span><span class="fa arrow"></span></a>
				                    <ul class="nav nav-second-level collapse">
				                
				                        <li id="menu_topic_'.$kode_grade.'_'.$id_pelajaran.'_'.$w->id.'">
		                                	<a onclick="matpel_week(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Learning Designer</a>
		                                </li>
		                                <li id="menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$w->id.'">
		                                	<a onclick="matpel_week_tlm(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Teaching Learning Material</a>
		                                </li>
		                                <li>
		                                    <a onclick="interactive(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Interactive</a>
		                                </li>

				                    </ul>
				                </li>
				    		';
	                }
			    
		    }else if($tipe=='siswa'){
		    	

		     //        $sql_mp = 'SELECT pn.kode_grade,kode_pelajaran,pn.id_pelajaran,tp.pelajaran_eng,mpg.kode_lama
							// 	FROM '.Session::get('db_active').'.pelajaran_nilai pn
							// 	LEFT JOIN tbl_pelajaran tp on pn.id_pelajaran=tp.id
							// 	LEFT JOIN '.Session::get('db_active').'.mapping_pelajaran_grade mpg on pn.kode_grade = mpg.kode_grade and pn.id_pelajaran = mpg.id_pelajaran
							// 	WHERE nim = '.$username.'
							// 	AND pn.kode_grade = "'.$kode_grade.'"
							// 	AND pn.id_pelajaran = "'.$id_pelajaran.'"
							// 	ORDER BY tp.pelajaran_eng'
							// ;

					$sql_mp = '
							SELECT
								mpgrade.kode as id_pelajaran,
								pel.pelajaran_ktsp AS nama,
								pel.pelajaran_eng AS english,
								mpgrade.kode_grade 
							FROM
								'.Session::get('db_active').'.pelajaran_nilai AS nilai
								INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpgrade ON nilai.kode_pelajaran = mpgrade.kode
								INNER JOIN db_madania_bogor.tbl_pelajaran AS pel ON mpgrade.id_pelajaran = pel.id 
							WHERE
								mpgrade.is_elearning = "Y" 
								AND nilai.nim = "'.$username.'"
								AND mpgrade.kode_grade  = "'.$kode_grade.'"
								AND mpgrade.kode = "'.$id_pelajaran.'" 
							GROUP BY
								pel.id 
							ORDER BY
								pel.pelajaran_eng ASC'
							;
					// echo $sql_mp;exit();
			    	$key_mp=collect(\DB::select($sql_mp))->first();
			    	$menu .= '
			    			<li id="menu_'.$kode_grade.'_'.$id_pelajaran.'">
				                <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">'.$key_mp->english.'</span></a>
				            </li>';   

			        $menu .= '
			    			<li>
			                    <a href="'.url('/matpel/'.$key_mp->kode_grade.'/'.$id_pelajaran).'"><i class="fa fa-spinner"></i> <span class="nav-label">Refresh This List</span></a>
			                </li>';   
	                $sql_w = 'select id,minggu from '.Session::get('db_active').'.weeklyguide where pelajaran="'.$key_mp->id_pelajaran.'" and state ="Publish" order by minggu desc
	                ';
	                $key_w=collect(\DB::select($sql_w));
	                foreach ($key_w as $w) {
				    	$menu .= '
	                			<li>
				                    <a href="#"><i class="fa fa-sitemap"></i><span class="nav-label"> Week '.$w->minggu.'</span><span class="fa arrow"></span></a>
				                    <ul class="nav nav-second-level collapse">
				                
				                        <li id="menu_topic_'.$kode_grade.'_'.$id_pelajaran.'_'.$w->id.'">
		                                	<a onclick="matpel_week(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Topic</a>
		                                </li>
		                                <li id="menu_tlm_'.$kode_grade.'_'.$id_pelajaran.'_'.$w->id.'">
		                                	<a onclick="matpel_week_tlm(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Teaching Learning Material</a>
		                                </li>
		                                <li>
		                                    <a onclick="interactive(\''.$kode_grade.'\',\''.$id_pelajaran.'\',\''.$w->id.'\',\''.$w->minggu.'\')">Interactive</a>
		                                </li>

				                    </ul>
				                </li>
				    		';

	                }
		       
		    }
		}else{
    		$menu .='
		            <li style="background: #b91d24 !important;">
	                    <a href="#"><i class="fa fa-warning"></i> <span class="nav-label">Pelajaran pada semester ini belum tercatat di database.
	                    	Harap hubungi wali kelas anda atau administrator.
	                    </span></a>
	                </li>
		    	';
    	}
   
		return $menu;
    }

    public static function matpel($id_pelajaran){
    	// $sql_mp = 'SELECT *
		// 			FROM '.Session::get('kd_smt_active').'.pelajaran
		// 			WHERE kode = "'.$id_pelajaran.'"'
		// 		;	

		$sql_mp = 'SELECT
				mpg.kode AS id_pelajaran,
				pel.pelajaran_ktsp AS nama,
				pel.pelajaran_eng AS english 
			FROM
				db_madania_bogor.tbl_pelajaran AS pel
				LEFT JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
				LEFT JOIN '.Session::get('db_active').'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
			WHERE
				mpg.kode = "'.$id_pelajaran.'"
			GROUP BY
				guru_kelas.kode_pelajaran 
			ORDER BY
				english
				'
			;	
		// echo $sql_mp;exit();
    	$key_mp=collect(\DB::select($sql_mp))->first();
    	return $key_mp;
    }

}
