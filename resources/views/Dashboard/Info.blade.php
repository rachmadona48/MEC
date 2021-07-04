<?php if($count_info > 0){ ?>
<div class="row">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInUp">
            <ul class="notes">
                <?php
                    foreach ($info as $info) {
                ?>
                    <li>
                        <div>
                            <small><?php echo $info->date_info; ?></small>
                            <h4><?php echo $info->title; ?></h4>
                            <!-- <p>The years, sometimes by accident, sometimes on purpose (injected humour and the like).</p> -->
                            <p>Grade <?php echo $info->kode_grade; ?>, Class <?php echo $info->kode_kelas; ?>.</p>
                            <a style="right: 161px !important;" href="detail_info/<?php echo $info->id; ?>"><i>Details</i>
                            </a>
                            <?php 
                                if(Session::get('id') == $info->id_user){ /*jika user create dan login sama*/
                            ?>
                                <a style="right: 22px !important; bottom: 9px !important;" onclick="edit_info(<?php echo $info->id; ?>)"><i class="fa fa-pencil-square-o"></i></a>
                                <!-- <a href="del_info/<?php echo $info->id; ?>"><i class="fa fa-trash-o"></i></a> -->
                                <a onclick="del_info(<?php echo $info->id; ?>)"><i class="fa fa-trash-o"></i></a>
                            <?php 
                                }
                            ?>
                            
                        </div>
                    </li>
                <?php
                    }
                ?>
            </ul>
        </div>
    </div>
</div>
<?php } ?>


