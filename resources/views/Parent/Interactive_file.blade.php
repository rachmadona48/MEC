<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_int('<?php echo $minggu; ?>')"><< Back</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <object data="{!! asset('upload/'.Session::get('kd_smt_active').'/interactive') !!}/<?php echo $file_upload; ?>" type="application/pdf" width="100%" height="800px">  
                    </object>
                </div>

            </div>
        </div>
    </div>
</div>
