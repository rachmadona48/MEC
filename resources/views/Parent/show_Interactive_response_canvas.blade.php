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
                    <?php 
                    $id_h5p[] = explode("=",$link_canvas);
                    // echo $id_h5p[0][3];
                    ?>
                    <!-- <?php echo $link_canvas; ?> -->
                    <iframe src="http://103.119.230.51:81/wp-admin/admin-ajax.php?action=h5p_embed&id=<?php echo $id_h5p[0][3] ?>" width="845" height="536" frameborder="0" allowfullscreen="allowfullscreen" title="Covid 19"></iframe>
                    <script src="http://103.119.230.51:81/wp-content/plugins/h5p/h5p-php-library/js/h5p-resizer.js" charset="UTF-8"></script>
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


