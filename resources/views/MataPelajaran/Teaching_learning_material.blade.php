<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Teaching Learning Material : Week <?php echo $minggu; ?></h5>
                    <!-- <div class="ibox-tools">
                        <?php if ($privilege > 0){ ?>
                            <button class="btn btn-success btn-xs" onclick="add_tlm('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')">Add new Topic</buttom>
                        <?php } ?>
                    </div> -->
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-hover issue-tracker">
                        <tbody>
                        <?php foreach ($data as $key) { 
                            $approve = $key->tgl3;
                        ?>
                            <tr>
                                <td>
                                    <?php if($approve){ ?>
                                        <span class="label label-primary">Approve</span>
                                    <?php }else{ ?>
                                        <span class="label label-warning">Waiting</span>
                                    <?php } ?>
                                </td>
                                <td class="issue-info">
                                    <a onclick="menu_tlm_detail('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>')">
                                        <?php echo $key->judul;?>
                                    </a>

                                    <small>
                                        <?php echo $key->memo;?>
                                    </small>
                                </td>
                                <td>
                                    <?php echo $key->nama;?>
                                </td>
                            </tr>
                        <?php } ?>
                    
                        
                        <!-- <tr>
                            <td>
                                <span class="label label-warning">Waiting</span>
                            </td>
                            <td class="issue-info">
                                <a href="#">
                                    ISSUE-07
                                </a>

                                <small>
                                    Always free from repetition, injected humour, or non-characteristic words etc.
                                </small>
                            </td>
                            <td>
                                Alex Ferguson
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="label label-danger">Cancel</span>
                            </td>
                            <td class="issue-info">
                                <a href="#">
                                    ISSUE-44
                                </a>

                                <small>
                                    This is issue with the coresponding note
                                </small>
                            </td>
                            <td>
                                Adrian Novak
                            </td>
                        </tr> -->
                        </tbody>
                    </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- <script type="text/javascript">
    $(document).ready(function(){
        $('.active').removeClass('active');

        var menu_id = "<?php Print($id_menu_tlm); ?>";
        $('#'+menu_id).addClass('active');  
    });
    
</script> -->