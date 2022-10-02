<div class="ibox-title">
    <h5><?php echo $discuss->judul; ?></h5>
    <div class="ibox-tools">
        <button class="btn btn-danger btn-xs" onclick="get_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>')"><< Back</button>
    </div>
</div>
<div class="ibox-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                    <strong><?php echo $discuss->nama; ?>, <?php echo $discuss->t1; ?></strong><br/>
                    <?php echo $discuss->isi; ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-12">
            <div class="chat-discussion">
                <?php foreach ($komen as $key) { ?>
                <div class="chat-message left">
                    <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                    <div class="message">
                        <a class="message-author" href="#"> <?php echo $key->nama; ?> </a>
                        <span class="message-date"> <?php echo $key->tgl; ?> 
                            <?php if ($user_id == $key->guru && $key->siswa == null){ ?>
                                <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>','<?php echo $key->id; ?>')"><i class="fa fa-times"></i></button>
                            <?php }elseif ($user_id == $key->siswa && $key->guru == null){ ?>
                                <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>','<?php echo $key->id; ?>')"><i class="fa fa-times"></i></button>
                            <?php } ?>
                        </span>
                        <span class="message-content">
                        <?php echo $key->isi; ?>
                        </span>
                        <input type="text" class="form-control" id="reply_comment_discuss_<?php echo $key->id; ?>" placeholder="Reply (Enter to reply)" onkeypress="reply_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>','<?php echo $key->id; ?>')"> 
                        <!-- <div class="input-group">
                            <input type="text" class="form-control" placeholder="Reply..."> 
                            <span class="input-group-btn"> 
                                <button type="button" class="btn btn-primary">Send!</button>
                            </span>
                        </div> -->
                    </div>
                    <?php
                        $sql = 'SELECT
                                    cm.id,
                                    cm.nama,
                                    cm.isi,
                                    cm.guru,
                                    cm.siswa,
                                    date_format( cm.tanggal, "%d %M %Y %h:%i" ) AS tgl
                                FROM
                                    '.db_active().'.forum_comment cm
                                WHERE
                                    cm.topic = '.$id.'
                                    AND cm.parent_comment = '.$key->id.'
                                '
                        ;   
                        // echo $sql;exit();
                        $query=collect(\DB::select($sql));
                        foreach ($query as $reply) { 
                    ?>

                        <div class="chat-message right">
                            <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                            <div class="message">
                                <a class="message-author" href="#"> <?php echo $reply->nama; ?> </a>
                                <span class="message-date">  
                                    <?php if ($user_id == $reply->guru && $reply->siswa == null){ ?>
                                        <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>','<?php echo $reply->id; ?>')"><i class="fa fa-times"></i></button>
                                    <?php }elseif ($user_id == $reply->siswa && $reply->guru == null){ ?>
                                        <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>','<?php echo $reply->id; ?>')"><i class="fa fa-times"></i></button>
                                    <?php } ?>
                                    <?php echo $reply->tgl; ?> 
                                </span>
                                <span class="message-content">
                                <?php echo $reply->isi; ?>
                                </span>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <?php } ?> 

            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="chat-message-form">
                <div class="form-group">
                    <textarea class="form-control message-input" id="comment_discuss" btn-lg nam="message" placeholder="Comment (Enter to send comment)" 
                    onkeypress="send_comment('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id; ?>')"></textarea>
                </div>
                <!-- <div class="input-group">
                    <textarea class="form-control message-input" name="message" placeholder="Enter message text"></textarea>
                    <span class="input-group-btn"> 
                        <button type="button" class="btn btn-primary btn-lg dim">Comment!</button>
                    </span>
                </div> -->

            </div>
        </div>
    </div>
</div>
