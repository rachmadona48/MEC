<div class="mail-box-header">
    <div class="pull-right tooltip-demo">
        <a href="#" class="btn btn-danger btn-sm" onclick="show_bukom()" data-toggle="tooltip" data-placement="top" title="Back to bukom"><i class="fa fa-backward"> Back</i> </a>
        
        <?php if($bukom->status=='Draft'){ ?>
            <a href="#" onclick="send_bukom('<?php echo $id_bukom; ?>')" class="btn btn-warning btn-sm" data-toggle="tooltip" data-placement="top" title="Send Bukom (State is Draft)"><?php echo $bukom->status; ?></a>
        <?php }else{ ?>
            <a onclick="reply_bukom('<?php echo $id_bukom; ?>','<?php echo $bukom->subyek; ?>')" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-reply"></i> Reply</a>

            <a href="#" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Bukom is Send"><i class="fa fa-send-o"></i> <?php echo $bukom->status; ?></a>
        <?php } ?>
    </div>
    <!-- <h2>
        Bukom
    </h2> -->
    <div class="mail-tools tooltip-demo m-t-md">


        <h3>
            <span class="font-noraml">Subject: </span><?php echo $bukom->subyek; ?>
        </h3>
        <h5>
            <span class="pull-right font-noraml">Create: <?php echo $bukom->date_create; ?>, Send: <?php echo $bukom->date_send; ?></span>
            <span class="font-noraml">From: </span><?php echo $bukom->nama; ?>
        </h5>
        <h5>
            <span class="font-noraml">To: </span>
            <?php foreach ($penerima as $key) {
                echo $key->nama.' ('.$key->kelas.'), ';
            } ?>
        </h5>
    </div>
</div>
<div class="mail-box">
    <div class="mail-body">
        <?php echo $bukom->isi; ?>
    </div>
    <div class="mail-attachment">
        <p>
            <span><i class="fa fa-paperclip"></i> Attachments - </span>
        </p>

        
            <div class="attachment">
                <?php if(!empty($bukom->lampiran1)){ ?>
                    <div class="file-box">
                        <div class="file">
                            <a href="{!! asset('upload/'.Session::get('kd_smt_active').'/bukom') !!}/<?php echo $bukom->lampiran1; ?>" target="_blank">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    <?php echo $bukom->nmfile1; ?>
                                </div>
                            </a>
                        </div>

                    </div>
                <?php } ?>

                <?php if(!empty($bukom->lampiran2)){ ?>
                    <div class="file-box">
                        <div class="file">
                            <a href="{!! asset('upload/'.Session::get('kd_smt_active').'/bukom') !!}/<?php echo $bukom->lampiran2; ?>" target="_blank">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    <?php echo $bukom->nmfile2; ?>
                                </div>
                            </a>
                        </div>

                    </div>
                <?php } ?>

                <?php if(!empty($bukom->lampiran3)){ ?>
                    <div class="file-box">
                        <div class="file">
                            <a href="{!! asset('upload/'.Session::get('kd_smt_active').'/bukom') !!}/<?php echo $bukom->lampiran3; ?>" target="_blank">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    <?php echo $bukom->nmfile3; ?>
                                </div>
                            </a>
                        </div>

                    </div>
                <?php } ?>

                <div class="clearfix"></div>
            </div>

    </div>

    <?php foreach ($reply as $reply) { ?>
        <div class="mail-body" id="div_reply">
            <h5>
                <span class="font-noraml"><b>Reply by : <?php echo $reply->nama; ?> <?php echo $reply->kelas; ?></b>, on <?php echo $reply->date_reply; ?>
            </h5>
            <?php echo $reply->isi_reply; ?>
        </div>
    <?php } ?>

    <div class="mail-body text-right tooltip-demo">
        <?php if($bukom->status=='Send'){ ?>
            <a onclick="reply_bukom('<?php echo $id_bukom; ?>','<?php echo $bukom->subyek; ?>')" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-reply"></i> Reply</a>
        <?php } ?>
    </div>
    <div class="clearfix"></div>
</div>


