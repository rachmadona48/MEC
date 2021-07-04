<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
Use DB;
use Session;

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

    public static function akses_menu2($username,$id_level,$tipe){
    	$menu = "";
    	/*jika db active ada*/
    	if (cek_db_old()>=1){
    		if($tipe == 'sdm'){
		    	if($username == 'admin'){
		    		$where = '';
		    	}else{
		    	// 	$where = '
		    	// 			WHERE kode in
			    // 				(SELECT kode_grade 
							// 	from '.Session::get('db_active').'.priv_guru_kelas
							// 	WHERE finger = '.$username.'
							// 	GROUP BY kode_grade)
							// ';	

					$where = '
		    				WHERE p.grade in (
								SELECT
									p.grade 
								FROM
									'.Session::get('kd_smt_active').'.priv_grade g,
									'.Session::get('kd_smt_active').'.pelajaran p 
								WHERE
									( g.pelajaran = p.kode ) 
									AND ( g.guru = "'.$username.'" )
							)
							';	



		    	}
		    	/*$sql = 'SELECT kode 
		    			FROM '.Session::get('db_active').'.ref_grade
		    			'.$where.' 
		    			order by kode ASC';	*/
		    	$sql = 'SELECT
							p.grade as kode
						FROM
							'.Session::get('kd_smt_active').'.pelajaran p 
						'.$where.'
						GROUP BY p.grade
						ORDER BY p.grade';	

		    	$query=DB::select($sql);
		    
			    foreach ($query as $key) {

				    $menu .= '
			    			<li id="menu_'.$key->kode.'">
				                <a href="#"><i class="fa fa-cube"></i> <span class="nav-label">Grade '.$key->kode.'</span></a>
				                <ul class="nav nav-second-level collapse">';

				                if($username == 'admin'){
						    		// $and_mp = '';
						    		$and_mp = 'AND ( g.guru = "'.$username.'" ) ';
						    	}else{
									$and_mp = 'AND ( g.guru = "'.$username.'" ) ';	
						    	}


						$sql_mp = 'SELECT p.kode as id_pelajaran, p.nama, p.english 
								FROM
									'.Session::get('kd_smt_active').'.priv_grade g,
									'.Session::get('kd_smt_active').'.pelajaran p 
								WHERE
									( g.pelajaran = p.kode ) 
									'.$and_mp.'
									AND ( p.english IS NOT NULL ) 
									AND ( p.grade = "'.$key->kode.'"  ) 
									AND p.is_elearning = "Y"
									AND (p.kode is not null AND p.kode <> "")
								ORDER BY
									p.english
							';
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

    public static function akses_menu_matpel($username,$tipe,$kode_grade,$id_pelajaran){
    	$menu = "";
    	/*jika db active dan db smt ada*/
    	if (cek_db_old()>=1){
	    	if($tipe == 'sdm'){

	    			if($username == 'admin'){
						// $and_mp = '';
						$and_mp = ' AND ( g.guru = "'.$username.'" ) ';
			    	}else{
			    		/*$and_mp = '
			    				AND pgk.finger = '.$username.'
								';*/	
						$and_mp = 'AND ( g.guru = "'.$username.'" ) ';
			    	}
		    
					
					$sql_mp = 'SELECT p.kode as id_pelajaran, p.nama, p.english 
								FROM
									'.Session::get('kd_smt_active').'.priv_grade g,
									'.Session::get('kd_smt_active').'.pelajaran p 
								WHERE
									( g.pelajaran = p.kode ) 
									'.$and_mp.'
									AND ( p.english IS NOT NULL ) 
									AND ( p.grade = "'.$kode_grade.'"  ) 
									and p.kode="'.$id_pelajaran.'"
									AND p.is_elearning = "Y"
								ORDER BY
									p.english
							';	
					// echo $sql_mp;exit();
					$key_mp=collect(\DB::select($sql_mp))->first();
				    $menu .= '
			    			<li id="menu_'.$kode_grade.'_'.$id_pelajaran.'">
				                <a href="'.url('/matpel/'.$kode_grade.'/'.$id_pelajaran).'"><i class="fa fa-fire"></i> <span class="nav-label">'.$key_mp->english.'</span></a>
				            </li>
				                '; 

				    $menu .= '
			    			<li>
			                    <a href="#" onclick="add_week(\''.$id_pelajaran.'\')"><i class="fa fa-folder"></i> <span class="nav-label">Add New Week</span></a>
			                </li>';   
	                $sql_w = 'select id,minggu from '.Session::get('kd_smt_active').'.weeklyguide where pelajaran="'.$key_mp->id_pelajaran.'" order by minggu desc
	                ';
	                // echo $sql_w;exit();
	                $key_w=collect(\DB::select($sql_w));
	                foreach ($key_w as $w) {

	                	$menu .= '
	                			<li>
				                    <a href="#"><i class="fa fa-sitemap"></i><span class="nav-label"> Week '.$w->minggu.'</span><span class="fa arrow"></span></a>
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

					$sql_mp = 'SELECT p.kode as id_pelajaran, p.nama, p.english, p.grade as kode_grade
							FROM
								'.Session::get('kd_smt_active').'.pelajaran p,
								'.Session::get('kd_smt_active').'.nilai_diknas n 
							WHERE
								( p.kode = n.pelajaran ) 
								AND ( n.nim = '.$username.' ) 
								AND ( p.english IS NOT NULL ) 
								AND ( p.is_elearning IS NOT NULL ) 
							AND p.grade = "'.$kode_grade.'"
							AND p.kode = "'.$id_pelajaran.'"
							ORDER BY
								p.english'
							;

			    	$key_mp=collect(\DB::select($sql_mp))->first();
			    	$menu .= '
			    			<li id="menu_'.$kode_grade.'_'.$id_pelajaran.'">
				                <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">'.$key_mp->english.'</span></a>
				            </li>';   

			        $menu .= '
			    			<li>
			                    <a href="'.url('/matpel/'.$key_mp->kode_grade.'/'.$id_pelajaran).'"><i class="fa fa-spinner"></i> <span class="nav-label">Refresh This List</span></a>
			                </li>';   
	                $sql_w = 'select id,minggu from '.Session::get('kd_smt_active').'.weeklyguide where pelajaran="'.$key_mp->id_pelajaran.'" order by minggu desc
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
    	$sql_mp = 'SELECT *
					FROM '.Session::get('kd_smt_active').'.pelajaran
					WHERE kode = "'.$id_pelajaran.'"'
				;	

    	$key_mp=collect(\DB::select($sql_mp))->first();
    	return $key_mp;
    }

}
