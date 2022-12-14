<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>List Week</h5>
                    <div class="ibox-tools">
                            <button class="btn btn-success btn-xs" onclick="add_week('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>')">Add Week</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr style="background-color: skyblue;">
                                <th><center>Week</center></th>
                                <th><center>Start Date</center></th>
                                <th><center>End Date</center></th>
                                <th><center>Action</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                
                                <td>
                                    <center>
                                        Week <?php echo $key->minggu;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->tglawal;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->tglakhir;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php 
                                            if ($key->state == 'Publish'){
                                        ?>
                                            <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Change state to draft" onclick="change_state_week('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>','Draft')"><i class="fa fa-check"></i><?php echo $key->state;?></button>
                                        <?php }else{ ?>
                                            <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Change state to publish" onclick="change_state_week('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>','Publish')"><i class="fa fa-times"></i><?php echo $key->state;?></button>
                                        <?php } ?>

                                        <button class="btn btn-outline btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Edit Date Week" onclick="edit_date_week('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>','<?php echo $key->tglawal2; ?>','<?php echo $key->tglakhir2; ?>')"><i class="fa fa-indent"></i></button>
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
