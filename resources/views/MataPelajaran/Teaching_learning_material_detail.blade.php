<div class="wrapper wrapper-content  animated fadeInRight">
    <!-- data tlm -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <div id="judul"><h5><?php echo $tlm->judul; ?></h5></div>
                    <div class="ibox-tools">
                        <?php if ($privilege > 0){ ?>
                            <button class="btn btn-outline btn-default btn-xs" onclick="edit_tlm_isi('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $tlm->id; ?>')">Edit Text</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <div id="isi"><?php echo $tlm->isi; ?></div>
                </div>

            </div>
        </div>
    </div>

    <!-- approval tlm -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Approval Notes : </h5>
                    <div class="ibox-tools">
                        <?php if ($privilege == 2){
                        ?>
                            <button class="btn btn-outline btn-default btn-xs" onclick="edit_approve_tlm('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $cek_approve; ?>','<?php echo $tlm->id; ?>')">Edit Approval</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <?php $approve = $tlm->tgl3; ?>
                    <?php if($approve){ ?>
                        <span class="label label-primary">Approve</span>
                    <?php }else{ ?>
                        <span class="label label-warning">Waiting</span>
                    <?php } ?>

                    <?php if ($approve){ ?>
                        <b>Slide/Video/Animation ini telah di-approve pada <?php echo $tglsuper; ?><br> Oleh <?php echo $namaSupervisor; ?></b>
                    <?php }else{ ?>
                        <b>Slide/Video/Animation ini belum di-approve</b>
                        <?php if ($namaSupervisor){ ?>
                            <br> Last notes by <?php echo $namaSupervisor; ?> <?php echo $tglsuper; ?>
                    <?php }} ?>
                    
                    <br/>
                    <div id="memo"><?php echo $tlm->memo; ?></div>
                </div>

            </div>
        </div>
    </div>

    <!-- data tlm detail/slide -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <div class="ibox-tools">
                        <?php if ($privilege > 0){ ?>
                            <button class="btn btn-success btn-xs" onclick="add_tlm_slide_lmp('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $tlm->id; ?>')">Add new Attachments</buttom>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-hover issue-tracker">
                        <thead>
                            <tr>
                                <th>File Name</th>
                                <th>Size (KB)</th>
                                <th><center>Upload Date</center></th>
                                <th><center>Action</center></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($slide as $key) { 
                            $ukuran = round($key->ukuran/1024, 1);
                            ?>
                                <tr>
                                    <td><?php echo $key->nama; ?></td>
                                    <td><?php echo $ukuran; ?></td>
                                    <td><center><?php echo $key->tgl; ?></center></td>
                                    <td>
                                        <center>
                                        <button class="btn btn-xs btn-success btn-outline" onclick="show_tlm_slide_lmp('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $tlm->id; ?>','<?php echo $key->id; ?>')">
                                            <i class="fa fa-file-pdf-o"></i>
                                        </button>
                                        <?php if ($privilege > 0){ ?>
                                            <button class="btn btn-xs btn-danger btn-outline" onclick="delete_tlm_slide('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $tlm->id; ?>','<?php echo $key->id; ?>','<?php echo $key->tipe; ?>')">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        <?php } ?>
                                        </center>
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
</div>

