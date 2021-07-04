<div class="wrapper wrapper-content  animated fadeInRight">
    <!-- data tlm -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <div >
                        <h5><a href="#" onclick="parent_tlm_detail('<?php echo $minggu; ?>','<?php echo $id_tlm; ?>')">
                            <?php echo $lmp->judul; ?></a> : <?php echo $lmp->nama; ?>
                        </h5>
                    </div>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_tlm_detail('<?php echo $minggu; ?>','<?php echo $id_tlm; ?>')"><< Back</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <object data="{!! asset('upload/'.Session::get('kd_smt_active').'/slide/lmp/') !!}/<?php echo $lmp->id.''.$lmp->tipe; ?>" type="application/pdf" width="100%" height="800px">  
                    </object>
                </div>

            </div>
        </div>
    </div>

</div>

