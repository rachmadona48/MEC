<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Week <?php echo $minggu; ?></h5> &nbsp; &nbsp;
                        <small>Last Editor : <?php echo $nama; ?> &nbsp; &nbsp; <?php echo $tgl; ?></small>
                        
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Topik Pembelajaran</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="topic">
                                            <?php echo $data->topic; ?>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','topic')">Edit</button>
                            <?php } ?>
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <?php if ($privilege > 0){ ?>
                            <?php if($approve){ ?>
                                <span class="label label-primary">Approve</span>
                            <?php }else{ ?>
                                <span class="label label-warning">Draft</span>
                        <?php  } ?>
                            <!-- <meta name="csrf-token" content="{{ csrf_token() }}"> -->
                            <a class="btn btn-xs btn-danger btn-outline pull-right" href="{{url('LD_pdf')}}"><i class="fa fa-file-pdf-o"></i> Pdf</a>

                            <!-- <a class="btn btn-xs btn-danger btn-outline pull-right" href="{{url('/LD_pdf')}}/<?php echo $kode_grade; ?>/<?php echo $id_pelajaran?>/<?php echo $id_week?>/<?php echo $minggu; ?>"><i class="fa fa-file-pdf-o"></i> Pdf</a> -->
                            
                        <?php } ?>
                        
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Alokasi Waktu (Menit)</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="alokasi_waktu">
                                            <?php echo $data->alokasi_waktu; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic_alokasi_waktu('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','alokasi_waktu','<?php echo $data->alokasi_waktu; ?>')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Mode of delivery</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original">
                                            <?php echo $data->md_deskripsi; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic_selection('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','mode_delivery','<?php echo $mode_delivery; ?>')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Aims</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="aims">
                                            <?php echo $data->aims; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','aims')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Learning Type</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original">
                                            <?php echo $data->lt_deskripsi; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic_selection('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','learning_type','<?php echo $learning_type; ?>')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Outcomes</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            
                            <?php if ($privilege > 0){ ?>
                                <!-- <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_rubrik('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','rubrik_dikusi')">Tambah</button>
                                </div> -->
                                <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_outcomes('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','rubrik_dikusi')">Tambah</button>
                                </div>
                            <?php } ?>

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th><center>Outcomes</center></th>
                                    <th><center>Detail<center/></th>
                                    <th width="20%"><center>Aksi</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php echo $outcomes; ?>
                                
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Hasil Yang Diharapkan</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Kompetensi Inti</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <!-- <div class="original">
                                            Mengahayati dan menghargai perilaku jujur, disiplin, santun, percaya diri, peduli, dan bertanggung jawab dalam berinteraksi secara efektif sesuai dengan perkemangan anak di lingkungan keluarga, sekolah, masyarakat, dan lingkungan alam sekitar, bangsa, negara, dan kawasan regional
                                        </div> -->
                                        <div class="original" id="kompetensi_inti">
                                            <?php echo $data->kompetensi_inti; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','kompetensi_inti')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <div class="col-md-6" style="padding: 0 0;">
                                <h4 class="m-t-lg">Kompetensi Dasar dan Indikator</h4>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <div class="col-md-6" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="topic_kd_indikator('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','kd_indikator')">Tambah</button>
                                </div>
                            <?php } ?>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Kompetensi Dasar</th>
                                    <th>Indikator</th>
                                    <th><center>Aksi</center></th>
                                </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($kd_indikator as $kd_indikator) { ?>
                                        <tr>
                                            <td><?php echo $kd_indikator->kompetensi_dasar; ?></td>
                                            <td><?php echo $kd_indikator->indikator; ?></td>
                                            <td>
                                                <?php if ($privilege > 0){ ?>
                                                    <center>
                                                        <button class="btn btn-xs btn-primary btn-outline" onclick="upd_kd_indikator('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','kd_indikator','<?php echo $kd_indikator->id; ?>')">
                                                            <i class="fa fa-pencil"></i>
                                                        </button>
                                                        <button class="btn btn-xs btn-danger btn-outline" onclick="delete_kd_indikator('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $kd_indikator->id; ?>')">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                    </center>
                                                    
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <?php if ($privilege > 0){ ?>
                                <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_materi_pelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','materi_pelajaran')">Tambah</button>
                                </div>
                            <?php } ?>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th width="5%"><center>No</center></th>
                                    <th>Materi Pembelajaran</th>
                                    <th><center>Aksi</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php 
                                $no = 1;
                                foreach ($mapel as $mapel) { 
                                ?>
                                    <tr>
                                        <td><center><?php echo $no; ?></center></td>
                                        <td><?php echo $mapel->materi; ?></td>
                                        <td>
                                            <?php if ($privilege > 0){ ?>
                                                <center>
                                                    <button class="btn btn-xs btn-primary btn-outline" onclick="upd_materi_pelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','materi_pelajaran','<?php echo $mapel->id; ?>')">
                                                        <i class="fa fa-pencil"></i>
                                                    </button>
                                                    <button class="btn btn-xs btn-danger btn-outline" onclick="delete_materi_pelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $mapel->id; ?>')">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </center>
                                                
                                            <?php } ?>
                                        </td>
                                    </tr>
                                <?php 
                                $no++;
                                } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Teknik Pembelajaran</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-6">
                                        <div class="original" id="teknik_pembelajaran">
                                            <?php echo $data->teknik_pembelajaran; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','teknik_pembelajaran')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Langkah-Langkah Pembelajaran</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <?php if ($privilege > 0){ ?>
                                <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_langkah_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','langkah_pembelajaran')">Tambah</button>
                                </div>
                            <?php } ?>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Kegiatan Pembelajaran</th>
                                    <th>Durasi</th>
                                    <th>Muatan PPK-MLP/HOTS/4C/Literasi</th>
                                    <th><center>Aksi</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($langkah_pembelajaran as $lb) { ?>
                                    <tr>
                                        <td><?php echo $lb->kegiatan; ?></td>
                                        <td><?php echo $lb->durasi; ?></td>
                                        <td><?php echo $lb->muatan; ?></td>
                                        <td>
                                            <?php if ($privilege > 0){ ?>
                                                <center>
                                                    <button class="btn btn-xs btn-primary btn-outline" onclick="upd_langkah_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','langkah_pembelajaran','<?php echo $lb->id; ?>')">
                                                        <i class="fa fa-pencil"></i>
                                                    </button>
                                                    <button class="btn btn-xs btn-danger btn-outline" onclick="delete_langkah_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $lb->id; ?>')">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </center>
                                                
                                            <?php } ?>
                                        </td>
                                    </tr>
                                <?php } ?>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Refleksi</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="refleksi">
                                            <?php echo $data->refleksi; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','refleksi')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Sumber Belajar dan Alat Bantu Pengajaran</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="sumber_alat">
                                            <?php echo $data->sumber_alat; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege > 0){ ?>
                                <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','sumber_alat')">Edit</button>
                            <?php } ?>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Penilaian Hasil Pembelajaran</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <?php if ($privilege > 0){ ?>
                                <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_hasil_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','hasil_pembelajaran')">Tambah</button>
                                </div>
                            <?php } ?>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th rowspan="2" style="vertical-align: middle;"><center>Indikator</center></th>
                                    <th colspan="3"><center>Penilaian</center></th>
                                    <th rowspan="2" style="vertical-align: middle;"><center>Aksi</center></th>
                                </tr>
                                <tr>
                                    <th><center>Teknik</center></th>
                                    <th><center>Bentuk Instrumen</center></th>
                                    <th><center>Sampel Instrumen</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($hasil_pembelajaran as $hp) { ?>
                                    <tr>
                                        <td><?php echo $hp->indikator; ?></td>
                                        <td><?php echo $hp->tehnik; ?></td>
                                        <td><?php echo $hp->bentuk_instrumen; ?></td>
                                        <td><?php echo $hp->sampel_instrumen; ?></td>
                                        <td>
                                            <?php if ($privilege > 0){ ?>
                                                <center>
                                                    <button class="btn btn-xs btn-primary btn-outline" onclick="upd_hasil_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','hasil_pembelajaran','<?php echo $hp->id; ?>')">
                                                        <i class="fa fa-pencil"></i>
                                                    </button>
                                                    <button class="btn btn-xs btn-danger btn-outline" onclick="delete_hasil_pembelajaran('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $hp->id; ?>')">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </center>
                                                
                                            <?php } ?>
                                        </td>
                                    </tr>
                                <?php } ?>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>



                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Rubrik Penilaian</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <?php if ($privilege > 0){ ?>
                                <div class="col-md-12" style="padding: 0 0;">
                                    <button class="btn btn-white btn-bitbucket btn-xs pull-right" onclick="save_rubrik('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','rubrik_dikusi')">Tambah</button>
                                </div>
                            <?php } ?>

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th><center>Rubrik</center></th>
                                    <th><center>Aspek Yang Dinilai<center/></th>
                                    <th><center>Maksimal Skor</center></th>
                                    <th width="20%"><center>Aksi</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <?php echo $rubrik; ?>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Approval Notes</h5>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <?php if ($approve){ ?>
                                <span class="label label-info">Learning designer ini telah di-approve pada <?php echo $approve; ?> 
                                Oleh <?php echo $namaSupervisor; ?></span>
                            <?php }else{ 
                                $last = "";
                                if ($namaSupervisor){
                                    $last = " Last notes by ".$namaSupervisor." ".$tglsuper; 
                                }
                            ?>
                                <span class="label label-danger"><b>Learning designer ini belum di-approve <?php echo $last; ?></b></span>
                            <?php } ?>
                        </div>
                        <br/>
                        <div class="row" style="padding: 0 20px;">

                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        
                                        <div class="original" id="memo">
                                            <?php echo $data->memo; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php if ($privilege == 2){ ?>
                                <button class="btn btn-success btn-bitbucket btn-xs pull-right" onclick="edit_topic_approve('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $cek_approve; ?>','memo')">Edit Approval</button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>



<!-- <script type="text/javascript">
    $(document).ready(function(){
        $('.active').removeClass('active');

        var menu_id = "<?php Print($id_menu_week); ?>";
        $('#'+menu_id).addClass('active');  
    });
    
</script> -->