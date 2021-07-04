<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Week <?php echo $minggu; ?></h5> &nbsp; &nbsp;
                    <small>Last Editor : <?php echo $nama; ?> &nbsp; &nbsp; <?php echo $tgl; ?></small>
                    <?php if ($privilege > 0){ ?>
                        <?php if($approve){ ?>
                            <span class="label label-primary pull-right">Approve</span>
                        <?php }else{ ?>
                            <span class="label label-warning pull-right">Draft</span>
                    <?php   }
                        } ?>
                    
                </div>

                <div class="ibox-content inspinia-timeline">

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <p class="m-b-xs"><strong>Activities</strong></p>

                                <div id="activities"><?php echo $data->activities; ?></div>

                                <?php if ($privilege > 0){ ?>
                                    <button class="btn btn-white btn-bitbucket btn-xs" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','activities')">Edit</button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <p class="m-b-xs"><strong>Assignment / Project</strong></p>

                                <div id="assignment"><?php echo $data->assignment; ?></div>

                                <?php if ($privilege > 0){ ?>
                                    <button class="btn btn-white btn-bitbucket btn-xs" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','assignment')">Edit</button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <p class="m-b-xs"><strong>Homework</strong></p>

                                <div id="homework"><?php echo $data->homework; ?></div>

                                <?php if ($privilege > 0){ ?>
                                    <button class="btn btn-white btn-bitbucket btn-xs" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','homework')">Edit</button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <p class="m-b-xs"><strong>Formative</strong></p>

                                <div id="formative"><?php echo $data->formative; ?></div>

                                <?php if ($privilege > 0){ ?>
                                    <button class="btn btn-white btn-bitbucket btn-xs" onclick="edit_topic('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','formative')">Edit</button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <p class="m-b-xs"><strong>Timeline</strong></p>

                                <div id="date_from">Date From : <?php echo date("d/m/Y", strtotime($data->tgl_awal)); ?></div>
                                <div id="date_to">Date To : <?php echo date("d/m/Y", strtotime($data->tgl_akhir)); ?></div>

                                <?php if ($privilege > 0){ ?>
                                    <button class="btn btn-white btn-bitbucket btn-xs" onclick="edit_topic_date('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo date("m/d/Y", strtotime($data->tgl_awal)); ?>','<?php echo date("m/d/Y", strtotime($data->tgl_akhir)); ?>')">Edit</button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <?php if ($privilege > 0){ ?>
                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase pull-right"></i>
                            </div>
                            <div class="col-xs-9 content no-top-border">
                                <?php if ($privilege == 2){ ?>
                                    <button class="btn btn-success btn-bitbucket btn-xs" onclick="edit_topic_approve('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $cek_approve; ?>','memo')">Edit Approval</button>
                                <?php } ?>
                                <p class="m-b-xs"><strong>Approval Notes</strong></p>
                                <?php if ($approve){ ?>
                                    <span class="label label-info">Prosata ini telah di-approve pada <?php echo $approve; ?> 
                                    Oleh <?php echo $namaSupervisor; ?></span>
                                <?php }else{ 
                                    $last = "";
                                    if ($namaSupervisor){
                                        $last = " Last notes by ".$namaSupervisor." ".$tglsuper; 
                                    }
                                ?>
                                    <span class="label label-danger"><b>Weekly Guide ini belum di-approve <?php echo $last; ?></b></span>
                                <?php } ?>
                                <div id="memo"><?php echo $data->memo; ?></div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

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