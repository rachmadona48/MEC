
<div class="modal inmodal fade" id="modal_ganti_semester" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Ganti Semester</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Semester</label>
                    <div class="col-sm-10">
                        <select data-placeholder="Pilih Semester" class="form-control m-b" id="id_ganti_smt">
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="ganti_semester()">Save</button>
            </div>
        </div>
    </div>
</div>



<div class="modal inmodal fade" id="modal_add_week" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Add Session</h4>
            </div>
            <div class="modal-body" style="padding: 20px 30px 100px 30px;">
                <input type="hidden" class="input-sm form-control" id="pelajaran_week" readonly />
                <input type="hidden" class="input-sm form-control" id="kode_grade_week" readonly />
                <div class="form-group">
                    <label class="col-sm-2 control-label">Week</label>
                    <div class="col-sm-10">
                        <select data-placeholder="Pilih Week" class="form-control m-b" id="id_minggu">
                            <?php
                            for ($a=1;$a<26;$a++) { ?>
                                <option value="<?php echo $a; ?>">Session <?php echo $a; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <div class="form-group" id="data_5">
                    <label class="col-sm-2 control-label">Date</label>
                    <div class="col-sm-10">
                        <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" id="tgl_awal" />
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" id="tgl_akhir" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="insert_week()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal_edit_week" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Edit Date Session</h4>
            </div>
            <div class="modal-body" style="padding: 20px 30px 100px 30px;">
                <input type="hidden" class="input-sm form-control" id="pelajaran_edit_week" readonly />
                <input type="hidden" class="input-sm form-control" id="kode_grade_edit_week" readonly />
                <input type="hidden" class="input-sm form-control" id="id_week_edit_week" readonly />

                <div class="form-group" id="data_5">
                    <label class="col-sm-2 control-label">Date</label>
                    <div class="col-sm-10">
                        <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" id="tgl_awal_edit_week" />
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" id="tgl_akhir_edit_week" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="save_edit_week()">Save</button>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="modal_edit_topic" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tpc_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tpc_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tpc_id_week" class="form-control">
                    <input type="hidden" id="mdl_tpc_week" class="form-control">
                    <input type="hidden" id="mdl_tpc_kolom" class="form-control">

                    <textarea id="mdl_edit_topic" name="mdl_edit_topic" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_aw" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_aw"></h4>
            </div>
            <div class="modal-body" style="padding: 20px 40px 70px 30px;">

                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Menit</label>
                        <div class="col-sm-10">
                            <input type="hidden" id="mdl_tpc_aw_kode_grade" class="form-control">
                            <input type="hidden" id="mdl_tpc_aw_id_pelajaran" class="form-control">
                            <input type="hidden" id="mdl_tpc_aw_id_week" class="form-control">
                            <input type="hidden" id="mdl_tpc_aw_week" class="form-control">
                            <input type="hidden" id="mdl_tpc_aw_kolom" class="form-control">

                            <input type="text" class="form-control m-b" id="mdl_edit_topic_aw" name="mdl_edit_topic_aw" placeholder="Alokasi Waktu" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic_aw()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_selection" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_selection"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tpc_selection_kode_grade" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_selection_id_pelajaran" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_selection_id_week" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_selection_week" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_selection_kolom" class="form-control" readonly="">

                    <select data-placeholder="" class="form-control m-b" id="id_topic_selection">
                    </select>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic_selection()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_kd_indikator" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_kd_indikator"></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" id="mdl_tpc_kode_grade_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_pelajaran_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_week_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_week_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_kolom_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_act_kd_indikator" class="form-control" readonly="">
                    <input type="hidden" id="mdl_topic_id_kd_indikator" class="form-control" readonly="">

                    <label class="control-label">Kompetensi Dasar</label>
                    <textarea id="mdl_topic_kompetensi_dasar" name="mdl_topic_kompetensi_dasar" class="summernote"></textarea>
                </div>

                <div class="form-group">

                    <label class="control-label">Indikator</label>
                    <textarea id="mdl_topic_indikator" name="mdl_topic_indikator" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="save_topic_kd_indikator()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_mapel" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_mapel"></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" id="mdl_tpc_kode_grade_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_pelajaran_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_week_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_week_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_kolom_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_act_mapel" class="form-control" readonly="">
                    <input type="hidden" id="mdl_topic_id_mapel" class="form-control" readonly="">

                    <label class="control-label">Materi :</label>
                    <!-- <textarea id="mdl_topic_kompetensi_dasar" name="mdl_topic_kompetensi_dasar" class="summernote"></textarea> -->
                    <input type="text" id="mdl_topic_materi_mapel" class="form-control">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="simpan_materi_pelajaran()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_lb" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_lb"></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" id="mdl_tpc_kode_grade_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_pelajaran_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_week_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_week_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_kolom_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_act_lb" class="form-control" readonly="">
                    <input type="hidden" id="mdl_topic_id_lb" class="form-control" readonly="">

                    <label class="control-label">Kegiatan Pembelajaran :</label>
                    <textarea id="mdl_topic_kegiatan_lb" name="mdl_topic_kegiatan_lb" class="summernote"></textarea>
                </div>

                <div class="form-group">
                    <label class="control-label">Durasi :</label>
                    <input type="text" id="mdl_topic_durasi_lb" class="form-control">
                </div>
                <div class="form-group">
                    <label class="control-label">Muatan PPK-MLP/HOTS/4C/Literasi :</label>
                    <textarea id="mdl_topic_muatan_lb" name="mdl_topic_muatan_lb" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="simpan_langkah_pembelajaran()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_hp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_hp"></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" id="mdl_tpc_kode_grade_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_pelajaran_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_id_week_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_week_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_kolom_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_tpc_act_hp" class="form-control" readonly="">
                    <input type="hidden" id="mdl_topic_id_hp" class="form-control" readonly="">

                    <label class="control-label">Indikator :</label>
                    <textarea id="mdl_topic_indikator_hp" name="mdl_topic_indikator_hp" class="summernote"></textarea>
                </div>

                <div class="form-group">
                    <label class="control-label">Tehnik :</label>
                    <textarea id="mdl_topic_tehnik_hp" name="mdl_topic_tehnik_hp" class="summernote"></textarea>
                </div>

                <div class="form-group">
                    <label class="control-label">Bentuk Instrumen :</label>
                    <textarea id="mdl_topic_bi_hp" name="mdl_topic_bi_hp" class="summernote"></textarea>
                </div>

                <div class="form-group">
                    <label class="control-label">Sampel Instrumen :</label>
                    <textarea id="mdl_topic_si_hp" name="mdl_topic_si_hp" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="simpan_hasil_pembelajaran()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal_edit_ot" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_ot"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="simpan_outcomes" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 20px 110px 30px !important;">
                    <div class="form-group">
                        <input type="hidden" id="mdl_ot_kode_grade" name="mdl_ot_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_ot_id_pelajaran" name="mdl_ot_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_ot_id_week" name="mdl_ot_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_ot_week" name="mdl_ot_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_ot_kolom" name="mdl_ot_kolom" class="form-control" readonly="">

                        <label class="col-sm-4 control-label">Outcomes</label>
                        <div class="col-sm-8">
                            <select data-placeholder="Pilih" class="form-control m-b" id="id_parent_outcomes" name="id_parent_outcomes" onchange="get_child_outcomes()" required="">
                            </select>
                        </div>
                    </div>
                    <div>
                        <label class="col-sm-4 control-label">Child</label>
                        <div class="col-sm-8">
                            <select data-placeholder="Pilih" class="form-control m-b" id="child_outcomes" name="child_outcomes"  required="">
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <!-- <button type="button" class="btn btn-success" onclick="simpan_rubrik()">Save</button> -->
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal_edit_topic_rb" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_rb"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="simpan_rubrik" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 20px 220px 30px !important;">
                    <div class="form-group">
                        <input type="hidden" id="mdl_tpc_kode_grade_rb" name="mdl_tpc_kode_grade_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_pelajaran_rb" name="mdl_tpc_id_pelajaran_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_week_rb" name="mdl_tpc_id_week_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_week_rb" name="mdl_tpc_week_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_kolom_rb" name="mdl_tpc_kolom_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_act_rb" name="mdl_tpc_act_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_topic_id_rb" name="mdl_topic_id_rb" class="form-control" readonly="">

                        <label class="col-sm-4 control-label">Rubrik</label>
                        <div class="col-sm-8">
                            <select data-placeholder="Pilih Rubrik" class="form-control m-b" id="id_mst_rubrik" name="id_mst_rubrik" onchange="get_child_rubrik()">
                            </select>
                        </div>
                    </div>
                    <div id="child_rubrik">
                        
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <!-- <button type="button" class="btn btn-success" onclick="simpan_rubrik()">Save</button> -->
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal inmodal fade" id="modal_edit_upd_topic_rb" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_upd_rd"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="simpan_upd_rubrik" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 20px 220px 30px !important;">
                    <div class="form-group">
                        <input type="hidden" id="mdl_tpc_upd_kode_grade_rb" name="mdl_tpc_upd_kode_grade_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_upd_id_pelajaran_rb" name="mdl_tpc_upd_id_pelajaran_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_upd_id_week_rb" name="mdl_tpc_upd_id_week_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_upd_week_rb" name="mdl_tpc_upd_week_rb" class="form-control" readonly="">
                        <input type="hidden" id="mdl_topic_id_rb" name="mdl_topic_id_rb" class="form-control" readonly="">

                    </div>
                    <div id="child_upd_rb">
                        
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <!-- <button type="button" class="btn btn-success" onclick="simpan_rubrik()">Save</button> -->
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal inmodal" id="modal_edit_topic_rd" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_rd"></h4>
            </div>
            <div class="modal-body" style="padding: 20px 20px 220px 30px !important;">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="hidden" id="mdl_tpc_kode_grade_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_pelajaran_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_week_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_week_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_kolom_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_act_rd" class="form-control" readonly="">
                        <input type="hidden" id="mdl_topic_id_rd" class="form-control" readonly="">

                        <label class="control-label">Nama Siswa :</label>
                        <input type="text" id="mdl_topic_nm_siswa_rd" class="form-control">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group col-md-4">
                        <label class="control-label">Keaktifan (1-4) :</label>
                        <input type="number" id="mdl_topic_keaktifan_rd" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Kerjasama (1-4) :</label>
                        <input type="number" id="mdl_topic_kerjasama_rd" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Presentasi (1-4) :</label>
                        <input type="number" id="mdl_topic_presentasi_rd" class="form-control">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group col-md-4">
                        <label class="control-label">Bertanya (1-4) :</label>
                        <input type="number" id="mdl_topic_bertanya_rd" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Menjawab (1-4) :</label>
                        <input type="number" id="mdl_topic_menjawab_rd" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Jumlah Skor :</label>
                        <input type="number" id="mdl_topic_jml_skor_rd" class="form-control">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="simpan_rubrik_diskusi()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_rt" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_rt"></h4>
            </div>
            <div class="modal-body" style="padding: 20px 20px 220px 30px !important;">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="hidden" id="mdl_tpc_kode_grade_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_pelajaran_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_id_week_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_week_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_kolom_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tpc_act_rt" class="form-control" readonly="">
                        <input type="hidden" id="mdl_topic_id_rt" class="form-control" readonly="">

                        <label class="control-label">Nama Siswa :</label>
                        <input type="text" id="mdl_topic_nm_siswa_rt" class="form-control">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group col-md-4">
                        <label class="control-label">Ketepatan (1-4) :</label>
                        <input type="number" id="mdl_topic_ketepatan_rt" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Skala (1-4) :</label>
                        <input type="number" id="mdl_topic_skala_rt" class="form-control">
                    </div>

                    <div class="form-group col-md-4">
                        <label class="control-label">Kerapihan (1-4) :</label>
                        <input type="number" id="mdl_topic_kerapihan_rt" class="form-control">
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group col-md-6">
                        <label class="control-label">Simbol (1-4) :</label>
                        <input type="number" id="mdl_topic_simbol_rt" class="form-control">
                    </div>

                    <div class="form-group col-md-6">
                        <label class="control-label">Jumlah Skor :</label>
                        <input type="number" id="mdl_topic_jml_skor_rt" class="form-control">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="simpan_rubrik_tugas()">Save</button>
            </div>
        </div>
    </div>
</div>




<div class="modal inmodal" id="modal_edit_topic2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic2"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tpc2_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tpc2_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tpc2_id_week" class="form-control">
                    <input type="hidden" id="mdl_tpc2_week" class="form-control">
                    <input type="hidden" id="mdl_tpc2_kolom" class="form-control">

                    <textarea id="mdl_edit_topic2" name="mdl_edit_topic2" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic2()">Save</button>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="modal_edit_topic_approve" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_approve"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tpc_approve_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tpc_approve_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tpc_approve_id_week" class="form-control">
                    <input type="hidden" id="mdl_tpc_approve_week" class="form-control">
                    <input type="hidden" id="mdl_tpc_approve_kolom" class="form-control">
                    <textarea id="mdl_edit_approve_topic" name="mdl_edit_approve_topic" class="summernote"></textarea>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="topic_check_approve" > Sudah di-approve  <small>(harap dicentang jika sudah di-approve)</small>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic_approve()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_topic_date" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_topic_date"></h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" id="mdl_tpc_date_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tpc_date_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tpc_date_id_week" class="form-control">
                    <input type="hidden" id="mdl_tpc_date_week" class="form-control">
                    <!-- <textarea id="mdl_edit_approve_topic" name="mdl_edit_approve_topic" class="summernote"></textarea> -->
                </div>
                <div class="form-group" id="data_5">
                    <label class="col-sm-2 control-label">Date</label>
                    <div class="col-sm-10">
                        <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" id="mdl_edit_date_topic_date_from" />
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" id="mdl_edit_date_topic_date_to" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_topic_date()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_add_tlm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_tlm"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_add_tlm_kode_grade" class="form-control" readonly="">
                    <input type="hidden" id="mdl_add_tlm_id_pelajaran" class="form-control" readonly="">
                    <input type="hidden" id="mdl_add_tlm_id_week" class="form-control" readonly="">
                    <input type="hidden" id="mdl_add_tlm_week" class="form-control" readonly="">
                    <!-- <textarea id="mdl_edit_approve_topic" name="mdl_edit_approve_topic" class="summernote"></textarea> -->
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="mdl_add_tlm_judul" placeholder="Judul" />
                </div>

                <div class="form-group">
                    <textarea id="mdl_add_tlm_isi" name="mdl_add_tlm_isi" class="summernote"></textarea>
                </div>

                

            </div>
            <div class="modal-footer" style="margin-top: 0px !important;">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="insert_tlm()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_tlm_isi" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_tlm_isi"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tlm_isi_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tlm_isi_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tlm_isi_id_week" class="form-control">
                    <input type="hidden" id="mdl_tlm_isi_week" class="form-control">
                    <input type="hidden" id="mdl_tlm_isi_id_tlm" class="form-control">

                    <textarea id="mdl_tlm_isi_isi" name="mdl_tlm_isi_isi" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_tlm_isi()">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_tlm_approve" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_tlm_approve"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="mdl_tlm_approve_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_tlm_approve_id_pelajaran" class="form-control">
                    <input type="hidden" id="mdl_tlm_approve_id_week" class="form-control">
                    <input type="hidden" id="mdl_tlm_approve_week" class="form-control">
                    <input type="hidden" id="mdl_tlm_approve_id_tlm" class="form-control">
                    <textarea id="mdl_tlm_approve_memo" name="mdl_tlm_approve_memo" class="summernote"></textarea>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="topic_check_tlm_approve" > Sudah di-approve  <small>(harap dicentang jika sudah di-approve)</small>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="update_tlm_approve()">Save</button>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="modal_tlm_add_lmp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_tlm_add_lmp"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_tlm_lmp" action="javascript:void(0)" >
                <div class="modal-body">
                    <div>
                        <input type="hidden" id="mdl_tlm_add_lmp_kode_grade" name="mdl_tlm_add_lmp_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tlm_add_lmp_id_pelajaran" name="mdl_tlm_add_lmp_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tlm_add_lmp_id_week" name="mdl_tlm_add_lmp_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tlm_add_lmp_week" name="mdl_tlm_add_lmp_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_tlm_add_lmp_id_tlm" name="mdl_tlm_add_lmp_id_tlm" class="form-control" readonly="">
                    </div>

                    <div class="form-group">
                        <label>File (.pdf)</label> 
                        <input type="file" id="mdl_add_file_tlm_slide" name="mdl_add_file_tlm_slide" class="form-control" accept=".pdf">
                        <div id="title_alert_tlm_slide" class="alert alert-warning" style="padding: 7px !important;display: none;">
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_add_int" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_int"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_interactive" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 280px 30px;">
                    <div>
                        <input type="hidden" id="mdl_add_int_kode_grade" name="mdl_add_int_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_int_id_pelajaran" name="mdl_add_int_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_int_id_week" name="mdl_add_int_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_int_week" name="mdl_add_int_week" class="form-control" readonly="">
                        <!-- <textarea id="mdl_edit_approve_topic" name="mdl_edit_approve_topic" class="summernote"></textarea> -->
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control m-b" id="mdl_add_int_name" name="mdl_add_int_name" placeholder="Judul" required="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Type" class="form-control m-b" id="mdl_add_int_type" name="mdl_add_int_type" onclick="show_file_int()" required="">
                                <option value="General">General</option>
                                <option value="Upload">Upload</option>
                                <option value="Canvas">Canvas</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" style="display: none;" id="id_mdl_add_int_file">
                        <label class="col-sm-2 control-label">File</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control m-b" id="mdl_add_int_file" name="mdl_add_int_file" placeholder="File" accept=".pdf"/>
                        </div>
                    </div>

                    <div class="form-group" style="display: none;" id="id_mdl_add_int_canvas">
                        <label class="col-sm-2 control-label">File</label>
                        <div class="col-sm-10">
                            <textarea class="form-control m-b message-input" id="mdl_add_int_canvas" name="mdl_add_int_canvas" placeholder="Link Canvas"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Category</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Category" class="form-control m-b" id="mdl_add_int_category" name="mdl_add_int_category" required="">
                                <option value="Homework">Homework</option>
                                <option value="Assignment">Assignment</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" id="data_5">
                        <label class="col-sm-2 control-label">Date Range</label>
                        <div class="col-sm-10">
                            <div class="input-daterange input-group" id="datepicker">
                                <input type="text" class="input-sm form-control" id="mdl_add_int_date_from" name="mdl_add_int_date_from" required="" />
                                <span class="input-group-addon">to</span>
                                <input type="text" class="input-sm form-control" id="mdl_add_int_date_to" name="mdl_add_int_date_to" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_int" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_add_int" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_int" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_edit_int"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_edit_interactive" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 280px 30px;">
                    <div>
                        <input type="hidden" id="mdl_edit_int_id" name="mdl_edit_int_id" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_int_kode_grade" name="mdl_edit_int_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_int_id_pelajaran" name="mdl_edit_int_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_int_id_week" name="mdl_edit_int_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_int_week" name="mdl_edit_int_week" class="form-control" readonly="">
                        <!-- <textarea id="mdl_edit_approve_topic" name="mdl_edit_approve_topic" class="summernote"></textarea> -->
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control m-b" id="mdl_edit_int_name" name="mdl_edit_int_name" placeholder="Judul" required="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Type" class="form-control m-b" id="mdl_edit_int_type" name="mdl_edit_int_type" onclick="show_file_edit_int()" required="">
                                <option value="General">General</option>
                                <option value="Upload">Upload</option>
                                <option value="Canvas">Canvas</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" style="display: none;" id="id_mdl_edit_int_file">
                        <label class="col-sm-2 control-label">File</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control m-b" id="mdl_edit_int_file" name="mdl_edit_int_file" placeholder="File" accept=".pdf"/>
                        </div>
                    </div>

                    <div class="form-group" style="display: none;" id="id_mdl_edit_int_canvas">
                        <label class="col-sm-2 control-label">File</label>
                        <div class="col-sm-10">
                            <textarea class="form-control m-b message-input" id="mdl_edit_int_canvas" name="mdl_edit_int_canvas" placeholder="Link Canvas"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Category</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Category" class="form-control m-b" id="mdl_edit_int_category" name="mdl_edit_int_category" required="">
                                <option value="Homework">Homework</option>
                                <option value="Assignment">Assignment</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" id="data_5">
                        <label class="col-sm-2 control-label">Date Range</label>
                        <div class="col-sm-10">
                            <div class="input-daterange input-group" id="datepicker">
                                <input type="text" class="input-sm form-control" id="mdl_edit_int_date_from" name="mdl_edit_int_date_from" required="" />
                                <span class="input-group-addon">to</span>
                                <input type="text" class="input-sm form-control" id="mdl_edit_int_date_to" name="mdl_edit_int_date_to" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_edit_int" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_edit_int" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- question -->
<div class="modal inmodal" id="modal_add_qt_int" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_qt_int"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_qt_interactive" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 220px 30px;">
                    <div>
                        <input type="hidden" id="mdl_add_qt_int_kode_grade" name="mdl_add_qt_int_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_qt_int_id_pelajaran" name="mdl_add_qt_int_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_qt_int_id_week" name="mdl_add_qt_int_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_qt_int_week" name="mdl_add_qt_int_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_add_qt_int_id_interactive" name="mdl_add_qt_int_id_interactive" class="form-control" readonly="">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Question</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control m-b" id="mdl_add_qt_int_name_question" name="mdl_add_qt_int_name_question" placeholder="Judul" required="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Type" class="form-control m-b" id="mdl_add_qt_int_type" name="mdl_add_qt_int_type" required="" >
                                <option value="">--Pilih--</option>
                                <option value="Text">Text</option>
                                <option value="Option">Option</option>
                                <option value="Matching">Matching</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" id="id_mdl_add_qt_int_file">
                        <label class="col-sm-2 control-label">Image</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control m-b" id="mdl_add_qt_int_file" name="mdl_add_qt_int_file" placeholder="File" accept="image/*"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Required</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Category" class="form-control m-b" id="mdl_add_qt_int_required" name="mdl_add_qt_int_required" required="">
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_qt_int" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_add_qt_int" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_qt_int" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_edit_qt_int"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="update_qt_interactive" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 220px 30px;">
                    <div>
                        <input type="hidden" id="mdl_edit_qt_int_kode_grade" name="mdl_edit_qt_int_kode_grade" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_id_pelajaran" name="mdl_edit_qt_int_id_pelajaran" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_id_week" name="mdl_edit_qt_int_id_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_week" name="mdl_edit_qt_int_week" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_id_interactive" name="mdl_edit_qt_int_id_interactive" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_name_interactive" name="mdl_edit_qt_int_name_interactive" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_state_interactive" name="mdl_edit_qt_int_state_interactive" class="form-control" readonly="">
                        <input type="hidden" id="mdl_edit_qt_int_id" name="mdl_edit_qt_int_id" class="form-control" readonly="">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Question</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control m-b" id="mdl_edit_qt_int_name_question" name="mdl_edit_qt_int_name_question" placeholder="Question" required="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Type" class="form-control m-b" id="mdl_edit_qt_int_type" name="mdl_edit_qt_int_type" required="" >
                                <option value="">--Pilih--</option>
                                <option value="Text">Text</option>
                                <option value="Option">Option</option>
                                <option value="Matching">Matching</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" id="id_mdl_edit_qt_int_file">
                        <label class="col-sm-2 control-label">Image</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control m-b" id="mdl_edit_qt_int_file" name="mdl_edit_qt_int_file" placeholder="File" accept="image/*"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Required</label>
                        <div class="col-sm-10">
                            <select data-placeholder="Category" class="form-control m-b" id="mdl_edit_qt_int_required" name="mdl_edit_qt_int_required" required="">
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_edit_qt_int" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_edit_qt_int" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- answer -->
<div class="modal inmodal" id="modal_add_ans" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_ans"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_answer" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 110px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_add_ans_kode_grade" name="mdl_add_ans_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_id_pelajaran" name="mdl_add_ans_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_id_week" name="mdl_add_ans_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_week" name="mdl_add_ans_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_id_interactive" name="mdl_add_ans_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_name_interactive" name="mdl_add_ans_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_state_interactive" name="mdl_add_ans_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_ans_id_question" name="mdl_add_ans_id_question" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_add_ans_name_answer" name="mdl_add_ans_name_answer" placeholder="Answer" required="" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Type</label>
                            <div class="col-sm-8">
                                <select data-placeholder="Type" class="form-control m-b" id="mdl_add_ans_true" name="mdl_add_ans_true" required="">
                                    <option value="True">True</option>
                                    <option value="False">False</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Skor</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control m-b" id="mdl_add_ans_skor" name="mdl_add_ans_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" value="0" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_ans" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_add_ans" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_ans" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_edit_ans"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="edit_answer_question" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 110px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_edit_ans_kode_grade" name="mdl_edit_ans_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_id_pelajaran" name="mdl_edit_ans_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_id_week" name="mdl_edit_ans_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_week" name="mdl_edit_ans_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_id_interactive" name="mdl_edit_ans_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_name_interactive" name="mdl_edit_ans_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_state_interactive" name="mdl_edit_ans_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_id_question" name="mdl_edit_ans_id_question" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_id_answer" name="mdl_edit_ans_id_answer" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_edit_ans_name_answer" name="mdl_edit_ans_name_answer" placeholder="Answer" required="" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Type</label>
                            <div class="col-sm-8">
                                <select data-placeholder="Type" class="form-control m-b" id="mdl_edit_ans_true" name="mdl_edit_ans_true" required="">
                                    <option value="True">True</option>
                                    <option value="False">False</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Skor</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control m-b" id="mdl_edit_ans_skor" name="mdl_edit_ans_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_edit_ans" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_edit_ans" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- answer text -->
<div class="modal inmodal" id="modal_add_text_ans" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_text_ans"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_answer_text" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 150px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_add_text_ans_kode_grade" name="mdl_add_text_ans_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_id_pelajaran" name="mdl_add_text_ans_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_id_week" name="mdl_add_text_ans_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_week" name="mdl_add_text_ans_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_id_interactive" name="mdl_add_text_ans_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_name_interactive" name="mdl_add_text_ans_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_state_interactive" name="mdl_add_text_ans_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_text_ans_id_question" name="mdl_add_text_ans_id_question" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <textarea class="form-control m-b message-input" id="mdl_add_text_ans_name_answer" name="mdl_add_text_ans_name_answer" placeholder="Answer" required=""></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Skor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_add_text_ans_skor" name="mdl_add_text_ans_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_text_ans" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_add_text_ans" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_ans_text" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_edit_ans_text"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="edit_answer_text_question" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 40px 150px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_edit_ans_text_kode_grade" name="mdl_edit_ans_text_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_id_pelajaran" name="mdl_edit_ans_text_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_id_week" name="mdl_edit_ans_text_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_week" name="mdl_edit_ans_text_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_id_interactive" name="mdl_edit_ans_text_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_name_interactive" name="mdl_edit_ans_text_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_state_interactive" name="mdl_edit_ans_text_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_id_question" name="mdl_edit_ans_text_id_question" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_ans_text_id_answer" name="mdl_edit_ans_text_id_answer" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <textarea class="form-control m-b message-input" id="mdl_edit_ans_text_name_answer" name="mdl_edit_ans_text_name_answer" placeholder="Answer" required=""></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Skor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_edit_ans_text_skor" name="mdl_edit_ans_text_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_edit_ans_text" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_edit_ans_text" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- answer matching -->
<div class="modal inmodal" id="modal_add_matching_ans" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_add_matching_ans"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_answer_matching" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 150px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_add_matching_ans_kode_grade" name="mdl_add_matching_ans_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_id_pelajaran" name="mdl_add_matching_ans_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_id_week" name="mdl_add_matching_ans_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_week" name="mdl_add_matching_ans_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_id_interactive" name="mdl_add_matching_ans_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_name_interactive" name="mdl_add_matching_ans_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_state_interactive" name="mdl_add_matching_ans_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_add_matching_ans_id_question" name="mdl_add_matching_ans_id_question" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Question</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_add_matching_ans_question_matching" name="mdl_add_matching_ans_question_matching" class="form-control" placeholder="Question"  required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_add_matching_ans_name_answer" name="mdl_add_matching_ans_name_answer" class="form-control" placeholder="Answer"  required="">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Skor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_add_matching_ans_skor" name="mdl_add_matching_ans_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_matching_ans" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_add_matching_ans" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_matching_ans" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title" id="title_edit_matching_ans"></h4>
            </div>
            <form method="POST" enctype="multipart/form-data" id="edit_answer_matching" action="javascript:void(0)" >
                <div class="modal-body"style="padding: 20px 40px 150px 30px;">
                    <div class="col-md-12">
                        <div>
                            <input type="hidden" id="mdl_edit_matching_ans_kode_grade" name="mdl_edit_matching_ans_kode_grade" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_id_pelajaran" name="mdl_edit_matching_ans_id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_id_week" name="mdl_edit_matching_ans_id_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_week" name="mdl_edit_matching_ans_week" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_id_interactive" name="mdl_edit_matching_ans_id_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_name_interactive" name="mdl_edit_matching_ans_name_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_state_interactive" name="mdl_edit_matching_ans_state_interactive" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_id_question" name="mdl_edit_matching_ans_id_question" class="form-control" readonly="">
                            <input type="hidden" id="mdl_edit_matching_ans_id_answer" name="mdl_edit_matching_ans_id_answer" class="form-control" readonly="">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Question</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_edit_matching_ans_question_matching" name="mdl_edit_matching_ans_question_matching" class="form-control" placeholder="Question"  required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Answer</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_edit_matching_ans_name_answer" name="mdl_edit_matching_ans_name_answer" class="form-control" placeholder="Answer"  required="">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Skor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control m-b" id="mdl_edit_matching_ans_skor" name="mdl_edit_matching_ans_skor" placeholder="Skor" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_edit_matching_ans" style="margin-top: 0px !important;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
                <div class="modal-footer" id="spinner-modal_edit_matching_ans" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_add_discuss" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4>Add Topic</h4>
            </div>
            <div class="modal-body" style="padding: 20px 40px 15px 30px;">

                <div class="form-group">
                    <label class="control-label">Topic Title</label>
                    <input type="hidden" id="mdl_add_discuss_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_add_discuss_id_pelajaran" class="form-control">
                    <input type="text" id="mdl_add_discuss_judul" class="form-control">
                </div>

                <div class="form-group" id="date_close_discuss">
                    <label class="control-label">Close Date</label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" id="mdl_add_discuss_ditutup" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">Description</label>
                    <textarea id="mdl_add_discuss_isi" name="mdl_add_dicuss_isi" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer" id="submit-modal_add_discuss">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="save_discuss()">Save</button>
            </div>
            <div class="modal-footer" id="spinner-modal_add_discuss" style="margin-top: 0px !important;display: none;">
                <div class="sk-spinner sk-spinner-circle">
                    <div class="sk-circle1 sk-circle"></div>
                    <div class="sk-circle2 sk-circle"></div>
                    <div class="sk-circle3 sk-circle"></div>
                    <div class="sk-circle4 sk-circle"></div>
                    <div class="sk-circle5 sk-circle"></div>
                    <div class="sk-circle6 sk-circle"></div>
                    <div class="sk-circle7 sk-circle"></div>
                    <div class="sk-circle8 sk-circle"></div>
                    <div class="sk-circle9 sk-circle"></div>
                    <div class="sk-circle10 sk-circle"></div>
                    <div class="sk-circle11 sk-circle"></div>
                    <div class="sk-circle12 sk-circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_discuss" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4>Edit Topic</h4>
            </div>
            <div class="modal-body" style="pediting: 20px 40px 15px 30px;">

                <div class="form-group">
                    <label class="control-label">Topic Title</label>
                    <input type="hidden" id="mdl_edit_discuss_id" class="form-control">
                    <input type="hidden" id="mdl_edit_discuss_kode_grade" class="form-control">
                    <input type="hidden" id="mdl_edit_discuss_id_pelajaran" class="form-control">
                    <input type="text" id="mdl_edit_discuss_judul" class="form-control">
                </div>

                <div class="form-group" id="date_close_discuss">
                    <label class="control-label">Close Date</label>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="text" id="mdl_edit_discuss_ditutup" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">Description</label>
                    <textarea id="mdl_edit_discuss_isi" class="summernote"></textarea>
                </div>

            </div>
            <div class="modal-footer" id="submit-modal_edit_discuss">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" onclick="save_edit_discuss()">Save</button>
            </div>
            <div class="modal-footer" id="spinner-modal_edit_discuss" style="margin-top: 0px !important;display: none;">
                <div class="sk-spinner sk-spinner-circle">
                    <div class="sk-circle1 sk-circle"></div>
                    <div class="sk-circle2 sk-circle"></div>
                    <div class="sk-circle3 sk-circle"></div>
                    <div class="sk-circle4 sk-circle"></div>
                    <div class="sk-circle5 sk-circle"></div>
                    <div class="sk-circle6 sk-circle"></div>
                    <div class="sk-circle7 sk-circle"></div>
                    <div class="sk-circle8 sk-circle"></div>
                    <div class="sk-circle9 sk-circle"></div>
                    <div class="sk-circle10 sk-circle"></div>
                    <div class="sk-circle11 sk-circle"></div>
                    <div class="sk-circle12 sk-circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- <div class="modal inmodal fade" id="modal_add_bukom" tabindex="-1" role="dialog" aria-hidden="true" > -->
<div class="modal inmodal fade" id="modal_add_bukom" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog" style="width: 70%;">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-envelope-o modal-icon"></i>
                <center><h4>Bukom</h4></center>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_bukom" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 40px 15px 30px;">
                    <div class="form-group">
                        <label class="control-label">Recipients v</label>
                        <div class="input-group">
                            <select data-placeholder="Choose parent of student..." class="chosen-select " multiple style="width:350px;" id="mdl_add_bukom_penerima" name="mdl_add_bukom_penerima[]">
                                <?php
                                    $sql = '
                                            SELECT
                                            pn.nim,
                                            pn.kode_pelajaran as pelajaran,
                                            sdm.nama,
                                            ks.kode as kelas
                                            FROM '.db_active().'.pelajaran_nilai pn
                                            LEFT JOIN tbl_siswa sdm ON pn.nim = sdm.nim
                                            LEFT JOIN '.db_active().'.mapping_kelas_siswa mpk on pn.nim = mpk.nim
                                            LEFT JOIN '.db_active().'.ref_kelas ks on mpk.id_kelas = ks.id
                                            WHERE
                                            pn.kode_pelajaran in (
                                                SELECT
                                                    mpg.kode
                                                FROM
                                                    '.db_active().'.mapping_pelajaran_grade AS mpg
                                                    INNER JOIN '.db_active().'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
                                                WHERE
                                                    guru_kelas.finger = "'.Session::get('username').'" 
                                                    AND mpg.is_elearning = "Y" 
                                                    AND guru_kelas.kode_pelajaran <> "" 
                                                GROUP BY
                                                    guru_kelas.kode_pelajaran 
                                            )
                                            AND sdm.nama <> ""
                                            '
                                    ;   
                                    // echo $sql;exit();
                                    $query=collect(\DB::select($sql));
                                    foreach ($query as $dt) { 
                                ?>
                                    <option value="<?php echo $dt->nim; ?>"><?php echo $dt->nama; ?> (<?php echo $dt->kelas; ?>)</option>
                                <?php } ?>
                            </select>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Subject</label>
                        <input type="text" id="mdl_add_bukom_subyek" name="mdl_add_bukom_subyek" class="form-control">
                    </div>

                    <div class="form-group">
                        <label class="control-label">Message</label>
                        <textarea id="mdl_add_bukom_isi" name="mdl_add_bukom_isi" class="summernote"></textarea>
                    </div>

                    <div class="form-group">
                        <label class="control-label">attachment 1</label>
                        <input type="file" class="form-control m-b" id="mdl_add_bukom_lampiran1" name="mdl_add_bukom_lampiran1" placeholder="File"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label">attachment 2</label>
                        <input type="file" class="form-control m-b" id="mdl_add_bukom_lampiran2" name="mdl_add_bukom_lampiran2" placeholder="File"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label">attachment 3</label>
                        <input type="file" class="form-control m-b" id="mdl_add_bukom_lampiran3" name="mdl_add_bukom_lampiran3" placeholder="File"/>
                    </div>

                    <div class="form-group">
                        <input type="checkbox" checked name="mdl_add_status" > <label class="control-label">Is Send ?</label>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_add_bukom">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                    <!-- <input type="button" class="btn btn-success" value="Send2" id="save_bukom_send"> -->
                </div>
                <div class="modal-footer" id="spinner-modal_add_bukom" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="modal_reply_bukom" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog" style="width: 70%;">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-envelope-o modal-icon"></i>
                <center><h4>Reply Bukom</h4></center>
            </div>
            <form method="POST" enctype="multipart/form-data" id="reply_bukom" action="javascript:void(0)" >
                <div class="modal-body" style="padding: 20px 40px 15px 30px;">
                    

                    <div class="form-group">
                        <label class="control-label" id="mdl_reply_bukom_subyek"></label>
                        <input type="hidden" class="input-sm form-control" id="mdl_reply_bukom_id_bukom" name="mdl_reply_bukom_id_bukom" readonly />
                    </div>

                    <div class="form-group">
                        <label class="control-label">Reply</label>
                        <textarea id="mdl_reply_bukom_reply" name="mdl_reply_bukom_reply" class="summernote"></textarea>
                    </div>

                </div>
                <div class="modal-footer" id="submit-modal_reply_bukom">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                    <!-- <input type="button" class="btn btn-success" value="Send2" id="save_bukom_send"> -->
                </div>
                <div class="modal-footer" id="spinner-modal_reply_bukom" style="margin-top: 0px !important;display: none;">
                    <div class="sk-spinner sk-spinner-circle">
                        <div class="sk-circle1 sk-circle"></div>
                        <div class="sk-circle2 sk-circle"></div>
                        <div class="sk-circle3 sk-circle"></div>
                        <div class="sk-circle4 sk-circle"></div>
                        <div class="sk-circle5 sk-circle"></div>
                        <div class="sk-circle6 sk-circle"></div>
                        <div class="sk-circle7 sk-circle"></div>
                        <div class="sk-circle8 sk-circle"></div>
                        <div class="sk-circle9 sk-circle"></div>
                        <div class="sk-circle10 sk-circle"></div>
                        <div class="sk-circle11 sk-circle"></div>
                        <div class="sk-circle12 sk-circle"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>




