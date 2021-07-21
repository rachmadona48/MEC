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
                    <form method="POST" enctype="multipart/form-data" id="saveResponse_upload" action="javascript:void(0)" >
                        <div>
                            <input type="hidden" value="<?php echo $kode_grade; ?>" id="kode_grade" name="kode_grade" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $id_pelajaran; ?>" id="id_pelajaran" name="id_pelajaran" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $id_week; ?>" id="id_week" name="id_week" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $minggu; ?>" id="minggu" name="minggu" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $name_interactive; ?>" id="name_interactive" name="name_interactive" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $state_interactive; ?>" id="state_interactive" name="state_interactive" class="form-control" readonly="">
                            <input type="hidden" value="<?php echo $id_interactive; ?>" id="id_interactive" name="id_interactive" class="form-control" readonly="">
                        </div>

                        <div class="form-group">
                            <label>Upload your answer (.pdf/.image)</label> 
                            <input type="file" id="file_upload_response" name="file_upload_response" class="form-control" accept=".pdf,.jpeg,.jpg,.png" required="">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success" >Save</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


