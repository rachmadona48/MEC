<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

// Route::get('/', function () {
//     return view('frontend/index');
// });
Route::resource('/', 'Awal');
Route::resource('/awal', 'Awal');
Route::resource('/login_sdm', 'Awal@login_sdm');
Route::resource('/login_student', 'Awal@login_student');
Route::resource('/login_parent', 'Awal@login_parent');
Route::resource('/cek_login', 'Awal@cek_login');
Route::resource('/cek_login_parent', 'Awal@cek_login_parent');
Route::get('google', 'Awal@redirect_google');
Route::get('/callback/google', 'Awal@callback');
Route::resource('/logout', 'Awal@logout');
Route::resource('/dashboard', 'DashboardController');
Route::resource('/add_info', 'DashboardController@Add_info');
Route::get('/detail_info/{id}', 'DashboardController@Detail_info');
Route::resource('/del_info', 'DashboardController@Delete_info');
Route::resource('/div_info', 'DashboardController@Div_information');
Route::resource('/edit_info', 'DashboardController@Edit_info');
Route::resource('/update_info', 'DashboardController@Update_info');
Route::resource('/Profile', 'DashboardController@Profile');
Route::resource('/ganti_smt', 'DashboardController@Ganti_smt');
Route::resource('/ganti_smt2', 'DashboardController@Ganti_smt2');
Route::resource('/show_bukom', 'BukomController@Show_bukom');
Route::resource('/list_bukom', 'BukomController@List_bukom');
Route::resource('/save_bukom', 'BukomController@Save_bukom');
Route::resource('/show_detail_bukom', 'BukomController@Show_detail_bukom');

Route::get('/matpel/{kode_grade}/{id_pelajaran}', 'MataPelajaranController@Matpel');
Route::resource('/insert_week', 'MataPelajaranController@Insert_week');
Route::resource('/matpel_week', 'MataPelajaranController@Matpel_week');
Route::resource('/update_topic', 'MataPelajaranController@Update_topic');
Route::resource('/update_topic_date', 'MataPelajaranController@Update_topic_date');
Route::resource('/update_topic_approve', 'MataPelajaranController@Update_topic_approve');
Route::resource('/matpel_week_tlm', 'MataPelajaranController@Matpel_tlm');
Route::resource('/insert_tlm', 'MataPelajaranController@Insert_tlm');
Route::resource('/matpel_tlm_detail', 'MataPelajaranController@Matpel_tlm_detail');
Route::resource('/update_tlm_isi', 'MataPelajaranController@Update_tlm_isi');
Route::resource('/update_tlm_approve', 'MataPelajaranController@Update_tlm_approve');
Route::resource('/add_tlm_lmp', 'MataPelajaranController@Add_tlm_lmp');
Route::resource('/show_tlm_slide_lmp', 'MataPelajaranController@Show_tlm_slide_lmp');
Route::resource('/delete_tlm_slide', 'MataPelajaranController@Delete_tlm_slide');
Route::resource('/update_icon_subject', 'MataPelajaranController@Update_icon_subject');
Route::resource('/week_topic_selection', 'MataPelajaranController@Week_topic_selection');
Route::resource('/save_topic_kd_indikator', 'MataPelajaranController@Save_topic_kd_indikator');
Route::resource('/get_kd_indikator', 'MataPelajaranController@Get_kd_indikator');
Route::resource('/delete_kd_indikator', 'MataPelajaranController@Delete_kd_indikator');
Route::resource('/simpan_materi_pelajaran', 'MataPelajaranController@Simpan_materi_pelajaran');
Route::resource('/get_materi_pelajaran', 'MataPelajaranController@Get_materi_pelajaran');
Route::resource('/delete_materi_pelajaran', 'MataPelajaranController@Delete_materi_pelajaran');
Route::resource('/simpan_langkah_pembelajaran', 'MataPelajaranController@Simpan_langkah_pembelajaran');
Route::resource('/get_langkah_pembelajaran', 'MataPelajaranController@Get_langkah_pembelajaran');
Route::resource('/delete_langkah_pembelajaran', 'MataPelajaranController@Delete_langkah_pembelajaran');
Route::resource('/simpan_hasil_pembelajaran', 'MataPelajaranController@Simpan_hasil_pembelajaran');
Route::resource('/get_hasil_pembelajaran', 'MataPelajaranController@Get_hasil_pembelajaran');
Route::resource('/delete_hasil_pembelajaran', 'MataPelajaranController@Delete_hasil_pembelajaran');

Route::resource('/parent_tlm_int', 'ParentController@Parent_tlm_int');
Route::resource('/parent_tlm', 'ParentController@Parent_tlm');
Route::resource('/parent_tlm_Detail', 'ParentController@Parent_tlm_detail');
Route::resource('/parent_Show_tlm_slide_lmp', 'ParentController@Parent_show_tlm_slide_lmp');

Route::resource('/parent_int', 'ParentController@Parent_int');
Route::resource('/parent_show_file_interactive', 'ParentController@Parent_show_file_interactive');
Route::resource('/parent_show_file_response_interactive', 'ParentController@Parent_Show_file_response_interactive_upload');
Route::resource('/parent_response_interactive_canvas', 'ParentController@Parent_Response_interactive_canvas');
Route::resource('/parent_show_canvas_response_interactive', 'ParentController@Parent_Show_canvas_response_interactive');
Route::resource('/parent_response_interactive', 'ParentController@Parent_Response_interactive');
Route::resource('/parent_show_response_interactive', 'ParentController@Parent_Show_response_interactive');

// Route::get('/parent_tlm/{minggu}', 'MataPelajaranController@Parent_tlm');

Route::resource('/simpan_rubrik_diskusi', 'MataPelajaranController@Simpan_rubrik_diskusi');
Route::resource('/get_rubrik_diskusi', 'MataPelajaranController@Get_rubrik_diskusi');
Route::resource('/delete_rubrik_diskusi', 'MataPelajaranController@Delete_rubrik_diskusi');
Route::resource('/simpan_rubrik_tugas', 'MataPelajaranController@Simpan_rubrik_tugas');
Route::resource('/get_rubrik_tugas', 'MataPelajaranController@Get_rubrik_tugas');
Route::resource('/delete_rubrik_tugas', 'MataPelajaranController@Delete_rubrik_tugas');

Route::resource('/get_mst_outcomes', 'MataPelajaranController@Get_mst_outcomes');
Route::resource('/get_mst_child_outcomes', 'MataPelajaranController@Get_mst_child_outcomes');
Route::resource('/simpan_outcomes', 'MataPelajaranController@Simpan_outcomes');
Route::resource('/delete_outcomes', 'MataPelajaranController@Delete_outcomes');

Route::resource('/get_mst_rubrik', 'MataPelajaranController@Get_mst_rubrik');
Route::resource('/get_mst_child_rubrik', 'MataPelajaranController@Get_mst_child_rubrik');
Route::resource('/simpan_rubrik', 'MataPelajaranController@Simpan_rubrik');
Route::resource('/delete_rubrik', 'MataPelajaranController@Delete_rubrik');
Route::resource('/get_upd_rubrik', 'MataPelajaranController@Get_upd_rubrik');
Route::resource('/simpan_upd_rubrik', 'MataPelajaranController@Simpan_upd_rubrik');

Route::get('/LD_pdf/{kode_grade}/{id_pelajaran}/{id_week}/{minggu}', 'MataPelajaranController@LD_pdf');
Route::get('/Scan_Ld/{kd_smt_active}/{kode_grade}/{id_pelajaran}/{id_week}/{minggu}', 'MataPelajaranController@Scan_Ld');

Route::resource('/get_list_discuss', 'MataPelajaranController@Get_list_discuss');
Route::resource('/save_discuss', 'MataPelajaranController@Save_discuss');
Route::resource('/save_edit_discuss', 'MataPelajaranController@Save_edit_discuss');
Route::resource('/del_discuss', 'MataPelajaranController@Del_discuss');
Route::resource('/get_comment_discuss', 'MataPelajaranController@Get_comment_discuss');
Route::resource('/send_comment', 'MataPelajaranController@Send_comment');
Route::resource('/reply_comment', 'MataPelajaranController@Reply_comment');
Route::resource('/del_comment', 'MataPelajaranController@Del_comment');
Route::resource('/get_list_discuss_parent', 'MataPelajaranController@Get_list_discuss_parent');
Route::resource('/get_comment_discuss_parent', 'MataPelajaranController@Get_comment_discuss_parent');

Route::resource('/interactive', 'InteractiveController@Interactive');
Route::resource('/add_interactive', 'InteractiveController@Add_interactive');
Route::resource('/interactive_ubah_state', 'InteractiveController@Interactive_ubah_state');
Route::resource('/edit_interactive', 'InteractiveController@Edit_interactive');
Route::resource('/del_interactive', 'InteractiveController@Del_interactive');

Route::resource('/show_file_interactive', 'InteractiveController@Show_file_interactive');
Route::resource('/show_canvas_interactive', 'InteractiveController@Show_canvas_interactive');
Route::resource('/show_question_interactive', 'InteractiveController@Show_question_interactive');
Route::resource('/add_question', 'InteractiveController@Add_question');
Route::resource('/update_question', 'InteractiveController@Update_question');
Route::resource('/update_sort_question', 'InteractiveController@Update_sort_question');
Route::resource('/update_state_question', 'InteractiveController@Update_state_question');
Route::resource('/delete_question', 'InteractiveController@Delete_question');
Route::resource('/show_appraisal', 'InteractiveController@Show_appraisal');
Route::resource('/show_response_appraisal_general', 'InteractiveController@Show_response_appraisal_general');
Route::resource('/show_response_appraisal_upload', 'InteractiveController@show_response_appraisal_upload');
Route::resource('/show_response_appraisal_canvas', 'InteractiveController@Show_response_appraisal_canvas');
Route::resource('/update_appraisal', 'InteractiveController@Update_appraisal');

Route::resource('/add_answer', 'InteractiveController@Add_answer');
Route::resource('/edit_answer', 'InteractiveController@Edit_answer');
Route::resource('/delete_answer', 'InteractiveController@Delete_answer');
Route::resource('/add_answer_text', 'InteractiveController@Add_answer_text');
Route::resource('/edit_answer_text', 'InteractiveController@Edit_answer_text');
Route::resource('/add_answer_matching', 'InteractiveController@Add_answer_matching');
Route::resource('/edit_answer_matching', 'InteractiveController@Edit_answer_matching');

Route::resource('/response_interactive_upload', 'InteractiveController@Response_interactive_upload');
Route::resource('/save_response_upload', 'InteractiveController@Save_response_upload');
Route::resource('/show_file_response_interactive_upload', 'InteractiveController@Show_file_response_interactive_upload');

Route::resource('/response_interactive_canvas', 'InteractiveController@Response_interactive_canvas');
Route::resource('/save_response_canvas', 'InteractiveController@Save_response_canvas');
Route::resource('/show_canvas_response_interactive', 'InteractiveController@Show_canvas_response_interactive');

Route::resource('/response_interactive', 'InteractiveController@Response_interactive');
Route::resource('/save_response', 'InteractiveController@Save_response');
Route::resource('/show_response_interactive', 'InteractiveController@Show_response_interactive');
Route::resource('/graph_subjek', 'MataPelajaranController@Graph_subjek');



// Route::resource('/learning_designer', 'LDController');
// Route::resource('/w_guide', 'WgController');
// Route::resource('/assign', 'AssignmentsController');
// Route::resource('/base_class', 'BaseClassController');
// Route::resource('/bukom', 'BukomController');
// Route::controller('awal', 'Awal@');
