@include('layouts.Header_scan')
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <center>
                        <h3>Learning Designer</h3>
                        <h3><?php echo $nama_pelajaran; ?></h3>
                        <h3>Kelas <?php echo $kode_grade; ?></h3>
                        <h3>Minggu ke - <?php echo $minggu; ?></h3>
                    </center>
                </div>
            </div>
        </div>

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
                        </div>
                        
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <?php if($approve){ ?>
                            <span class="label label-primary">Approve</span>
                        <?php }else{ ?>
                            <span class="label label-warning">Draft</span>
                        <?php  } ?>
                        
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <h4 class="m-t-lg">Alokasi Waktu</h4>
                            <div class="well">
                                <div class="row diff-wrapper">
                                    <div class="col-md-12">
                                        <div class="original" id="alokasi_waktu">
                                            <?php echo $data->alokasi_waktu; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th><center>Outcomes</center></th>
                                    <th><center>Detail<center/></th>
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
                                        <div class="original" id="kompetensi_inti">
                                            <?php echo $data->kompetensi_inti; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <div class="col-md-6" style="padding: 0 0;">
                                <h4 class="m-t-lg">Kompetensi Dasar dan Indikator</h4>
                            </div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Kompetensi Dasar</th>
                                    <th>Indikator</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($kd_indikator as $kd_indikator) { ?>
                                        <tr>
                                            <td><?php echo $kd_indikator->kompetensi_dasar; ?></td>
                                            <td><?php echo $kd_indikator->indikator; ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row" style="padding: 0 20px;">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th width="5%"><center>No</center></th>
                                    <th>Materi Pembelajaran</th>
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
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Kegiatan Pembelajaran</th>
                                    <th>Durasi</th>
                                    <th>Muatan PPK-MLP/HOTS/4C/Literasi</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($langkah_pembelajaran as $lb) { ?>
                                    <tr>
                                        <td><?php echo $lb->kegiatan; ?></td>
                                        <td><?php echo $lb->durasi; ?></td>
                                        <td><?php echo $lb->muatan; ?></td>
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
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th rowspan="2" style="vertical-align: middle;"><center>Indikator</center></th>
                                    <th colspan="3"><center>Penilaian</center></th>
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

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th><center>Rubrik</center></th>
                                    <th><center>Aspek Yang Dinilai<center/></th>
                                    <th><center>Maksimal Skor</center></th>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
