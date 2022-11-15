<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')"><< Back</button>
                    </div>
                </div>
                <div class="ibox-content">
                    
                    <a href="<?php echo $link_canvas; ?>" target="_blank" rel="nofollow" title="Interactive">Klik untuk respon interactive</a>
                    <?php 
                    $id_h5p[] = explode("=",$link_canvas);
                    // echo $id_h5p[0][3];
                    ?>
                    <hr/>
                    <iframe src="<?php echo h5p();?>/wp-admin/admin-ajax.php?action=h5p_embed&id=<?php echo $id_h5p[0][3] ?>" width="845" height="536" frameborder="0" allowfullscreen="allowfullscreen" title="Covid 19"></iframe>
                    <script src="<?php echo h5p();?>/wp-content/plugins/h5p/h5p-php-library/js/h5p-resizer.js" charset="UTF-8"></script>
                </div>

            </div>
        </div>
    </div>
</div>
