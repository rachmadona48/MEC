<div class="wrapper wrapper-content animated fadeInRight">
<div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Week : <?php echo $minggu; ?></h5>
                </div>
                <div class="ibox-content">
                    <center>
                        <button class="btn btn-success dim btn-large-dim btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="Teaching Learning Material" style="width: 250px;height: 250px;font-size: 70px;" onclick="parent_tlm(<?php echo $minggu; ?>)">
                            <img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/study.png') !!}">
                        </button>

                        <button class="btn btn-success dim btn-large-dim btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="Interactive" style="width: 250px;height: 250px;font-size: 70px;" onclick="parent_int(<?php echo $minggu; ?>)">
                            <img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/exam.png') !!}">
                        </button>
                    </center>
                </div>

            </div>
        </div>
    </div>
</div>


