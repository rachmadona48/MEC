<div class="ibox-title">
    <h5><?php echo $discuss->judul; ?></h5>
    <div class="ibox-tools">
        <button class="btn btn-danger btn-xs" onclick="get_discuss_parent('<?php echo $id_pelajaran; ?>')"><< Back</button>
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
                        </span>
                        <span class="message-content">
                        <?php echo $key->isi; ?>
                        </span>
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
                                    '.Session::get('kd_smt_active').'.forum_comment cm
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
    
</div>
