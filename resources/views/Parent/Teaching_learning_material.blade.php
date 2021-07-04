<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Teaching Learning Material : Week <?php echo $minggu; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_tlm_int('<?php echo $minggu; ?>')"><< Back</button>
                    </div>
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
                                        <a onclick="parent_tlm_detail('<?php echo $minggu; ?>','<?php echo $key->id; ?>')">
                                            <?php echo $key->judul;?>
                                        </a>

                                        <small>
                                            <?php echo $key->memo;?>
                                        </small>
                                    </td>
                                    <td>
                                        <?php echo $key->english;?>
                                    </td>
                                    <td>
                                        <?php echo $key->nama;?>
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
