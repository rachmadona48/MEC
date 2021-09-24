<div class="mail-box-header">
    <div class="pull-right tooltip-demo">
        <a href="#" class="btn btn-danger btn-sm" onclick="show_bukom()" data-toggle="tooltip" data-placement="top" title="Back to bukom"><i class="fa fa-backward"> Back</i> </a>
        <a href="mail_compose.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-reply"></i> Reply</a>
        <?php if($bukom->status=='Draft'){ ?>
            <a href="mail_compose.html" class="btn btn-warning btn-sm" data-toggle="tooltip" data-placement="top" title="Send Bukom (State is Draft)"><?php echo $bukom->status; ?></a>
        <?php }else{ ?>
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
            <span class="pull-right font-noraml"><?php echo $bukom->date_create; ?></span>
            <span class="font-noraml">From: </span><?php echo $bukom->nama; ?>
        </h5>
        <h5>
            <span class="font-noraml">To: </span><?php echo $bukom->nama; ?>
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
            <div class="file-box">
                <div class="file">
                    <a href="#">
                        <span class="corner"></span>

                        <div class="icon">
                            <i class="fa fa-file"></i>
                        </div>
                        <div class="file-name">
                            Document_2014.doc
                            <br/>
                            <small>Added: Jan 11, 2014</small>
                        </div>
                    </a>
                </div>

            </div>
            
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="mail-body text-right tooltip-demo">
        <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-reply"></i> Reply</a>
    </div>
    <div class="clearfix"></div>
</div>


