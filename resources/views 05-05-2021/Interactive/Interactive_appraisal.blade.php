<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')"><< Back</button>

                        <?php if($state_interactive=='Publish'){ ?>
                            <button class="btn btn-xs btn-primary">Publish</button>
                        <?php }else{ ?>
                            <button class="btn btn-xs btn-warning">Unpublish</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr style="background-color: skyblue;">
                                <th width="10px"><center>No</center></th>
                                <th>User</th>
                                <th><center>Skor Temporary</center></th>
                                <th><center>Skor Final</center></th>
                                <th>Note</th>
                                <th><center>Action</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php $no=1; ?>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                <td>
                                    <center>
                                        <?php echo $no;?>
                                    </center>
                                </td>
                                <td class="issue-info">
                                    <?php echo $key->nama_lengkap;?>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->skor_temp;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->skor_final;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->note;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php if($type=='General'){ ?>
                                            <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Appraisal" onclick="show_appraisal_general('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $type; ?>','<?php echo $key->id;?>','<?php echo $key->idResponse;?>','<?php echo $key->username;?>')"><i class="fa fa-stack-exchange"></i></button>
                                        <?php }else{ ?>
                                            <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Appraisal" onclick="show_appraisal_upload('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $type; ?>','<?php echo $key->id;?>','<?php echo $key->idResponse;?>','<?php echo $key->username;?>')"><i class="fa fa-stack-exchange"></i></button>
                                        <?php } ?>
                                    </center>
                                </td>
                            </tr>
                        <?php $no++; } ?>
                    
                        </tbody>
                    </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
