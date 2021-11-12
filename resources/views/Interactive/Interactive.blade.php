<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Interactive : Week <?php echo $minggu; ?></h5>
                    <div class="ibox-tools">
                        <?php if ($privilege > 0){ ?>
                            <button class="btn btn-success btn-xs" onclick="add_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')">Add Interactive</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr style="background-color: skyblue;">
                                <th><center>State</center></th>
                                <th>Interactive Name</th>
                                <th><center>Category</center></th>
                                <th><center>Type</center></th>
                                <th><center>Action</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                <td>
                                    <center>
                                        <?php if(Session::get('tipe')=='sdm'){ ?>
                                            <?php if($key->state=='Publish'){ ?>
                                                <button class="btn btn-xs btn-primary" data-toggle="tooltip" data-placement="top" title="To Unpublish" onclick="unpublish_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>')">Publish</button>
                                            <?php }else{ ?>
                                                <button class="btn btn-xs btn-warning" data-toggle="tooltip" data-placement="top" title="To Publish" onclick="publish_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>')">Unpublish</button>
                                            <?php } ?>
                                        <?php }else{ ?>
                                            <?php if($key->state=='Publish'){ ?>
                                                <button class="btn btn-xs btn-primary">Publish</button>
                                            <?php }else{ ?>
                                                <button class="btn btn-xs btn-warning">Unpublish</button>
                                            <?php } ?>
                                        <?php } ?>
                                    </center>
                                </td>
                                <td class="issue-info">
                                    <a onclick="interactive_question('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>')">
                                        <?php echo $key->name;?>
                                    </a>

                                    <small>
                                        <?php echo $key->dateFrom;?> to <?php echo $key->dateTo;?>
                                    </small>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->category;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->type;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                    <?php if ($privilege > 0){ ?> <!-- sdm -->
                                        <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit" onclick="edit_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->state; ?>','<?php echo $key->name;?>','<?php echo $key->type;?>','<?php echo $key->category;?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-edit"></i></button>

                                        <?php if ($key->type=='Upload'){ ?>
                                            <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Show File Question" onclick="show_file_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->file_upload;?>')"><i class="fa fa-file-pdf-o"></i></button>
                                        <?php }elseif ($key->type=='General'){ ?>
                                            <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show Question" onclick="show_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-question-circle"></i></button>
                                        <?php }elseif ($key->type=='Canvas'){ ?>
                                            <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Show Canvas Movie" onclick="show_canvas_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-file-movie-o"></i></button>
                                        <?php } ?>

                                        <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Show Appraisal Student" onclick="show_appraisal('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->type; ?>')"><i class="fa fa-comments-o"></i></button>

                                        <!-- start preview interactive -->
                                        <?php if ($key->type=='General'){ ?>
                                            <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Preview questions" onclick="response_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                        
                                        <?php } ?>
                                        <!-- end preview interactive -->

                                        <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-trash"></i></button>


                                    <?php }else{ ?> <!-- siswa -->
                                        <?php if ($key->type=='Upload'){ ?>
                                            <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Show File Question" onclick="show_file_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->file_upload;?>')"><i class="fa fa-file-pdf-o"></i></button>

                                            <?php
                                                $sql_count = 'SELECT count(*) as jml_d
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                                                            WHERE id_interactive = "'.$key->id.'" 
                                                            AND username ="'.$username.'"'
                                                            ;   
                                                // echo $sql_count;exit();
                                                $query_count=collect(\DB::select($sql_count))->first();
                                                if($query_count->jml_d<=0){
                                            ?>
                                                    <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Answer the questions" onclick="response_interactive_upload('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php }else{ ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="show_file_response_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php } ?>
                                        <?php }elseif ($key->type=='General'){ ?>

                                            <?php
                                                $sql_count = 'SELECT count(*) as jml_d
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                                                            WHERE id_interactive = "'.$key->id.'" 
                                                            AND username ="'.$username.'"'
                                                            ;   
                                                // echo $sql_count;exit();
                                                $query_count=collect(\DB::select($sql_count))->first();
                                                if($query_count->jml_d<=0){
                                            ?>
                                                    <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Answer the questions" onclick="response_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php }else{ ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="show_response_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php } ?>
                                        <?php }elseif ($key->type=='Canvas'){ ?>
                                            <?php
                                                $sql_count = 'SELECT count(*) as jml_d
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                                                            WHERE id_interactive = "'.$key->id.'" 
                                                            AND username ="'.$username.'"'
                                                            ;   
                                                // echo $sql_count;exit();
                                                $query_count=collect(\DB::select($sql_count))->first();
                                                if($query_count->jml_d<=0){
                                            ?>
                                                    <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Answer the questions with video interactive" onclick="response_interactive_canvas('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php }else{ ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="show_canvas_response_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php } ?>
                                        <?php } ?>
                                    <?php } ?>
                                    </center>
                                </td>
                            </tr>
                        <?php } ?>
                    
                        </tbody>
                    </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- <script type="text/javascript">
    $(document).ready(function(){
        $('.active').removeClass('active');

        var menu_id = "<?php Print($id_menu_tlm); ?>";
        $('#'+menu_id).addClass('active');  
    });
    
</script> -->