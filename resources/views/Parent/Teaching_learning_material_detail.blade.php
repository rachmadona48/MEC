<div class="wrapper wrapper-content  animated fadeInRight">
    <!-- data tlm -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <div id="judul"><h5><?php echo $tlm->judul; ?></h5></div>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_tlm('<?php echo $minggu; ?>')"><< Back</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div id="isi"><?php echo $tlm->isi; ?></div>
                </div>

            </div>
        </div>
    </div>

    <!-- data tlm detail/slide -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
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
                                            <button class="btn btn-xs btn-success btn-outline" onclick="parent_show_tlm_slide_lmp('<?php echo $tlm->id; ?>','<?php echo $key->id; ?>','<?php echo $minggu; ?>')">
                                                <i class="fa fa-file-pdf-o"></i>
                                            </button>
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

