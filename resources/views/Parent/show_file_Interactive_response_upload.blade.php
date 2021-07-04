<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_int('<?php echo $minggu; ?>')"><< Back</button>

                        <?php if($state_interactive=='Publish'){ ?>
                            <button class="btn btn-xs btn-primary">Publish</button>
                        <?php }else{ ?>
                            <button class="btn btn-xs btn-warning">Unpublish</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <object data="{!! asset('upload/'.Session::get('kd_smt_active').'/interactive_response_upload') !!}/<?php echo $file; ?>" type="application/pdf" width="100%" height="800px">  
                    </object>
                </div>
                <div class="ibox-content">
                    <i><b>Score (automatically,temporary) : <?php echo $skor_temp; ?></b></i><br/>
                    <i><b>Score (final) : <?php echo $skor_final; ?></b></i><br/>
                    <i>Note : </i>
                    <i><?php echo $note; ?></i>
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


