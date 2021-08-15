<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Interactive : Week <?php echo $minggu; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="parent_tlm_int('<?php echo $minggu; ?>')"><< Back</button>
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
                                <th><center>Subject</center></th>
                                <th><center>View Detail</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                <td>
                                    <center>
                                        <?php if($key->state=='Publish'){ ?>
                                            <button class="btn btn-xs btn-primary">Publish</button>
                                        <?php }else{ ?>
                                            <button class="btn btn-xs btn-warning">Unpublish</button>
                                        <?php } ?>
                                    </center>
                                </td>
                                <td class="issue-info">
                                    <a>
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
                                        <!-- <?php 
                                            $sql_mp = '
                                            SELECT english from '.Session::get('kd_smt_active').'.pelajaran WHERE kode = "'.$key->pelajaran.'" '
                                            ;   
                                            // echo $sql_count;exit();
                                            $query_mp=collect(\DB::select($sql_mp))->first();
                                        ?>
                                        <?php echo $query_mp->english;?> -->
                                        <?php echo $key->english;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                    <!-- siswa -->
                                        <?php if ($key->type=='Upload'){ ?>
                                            <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Show File Question" onclick="parent_show_file_interactive('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->file_upload;?>','<?php echo $key->name; ?>')"><i class="fa fa-file-pdf-o"></i></button>

                                            <?php
                                                $sql_count = 'SELECT count(*) as jml_d
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_appraisal
                                                            WHERE id_interactive = "'.$key->id.'" 
                                                            AND username ="'.$username.'"'
                                                            ;   
                                                // echo $sql_count;exit();
                                                $query_count=collect(\DB::select($sql_count))->first();
                                                if($query_count->jml_d>0){
                                            ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="parent_show_file_response_interactive('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->state; ?>','<?php echo $key->name; ?>')"><i class="fa fa-indent"></i></button>
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
                                                    <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Answer the questions" onclick="parent_response_interactive('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>','<?php echo $key->dateFrom2;?>','<?php echo $key->dateTo2;?>')"><i class="fa fa-indent"></i></button>
                                                <?php }else{ ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="parent_show_response_interactive('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-indent"></i></button>
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
                                                    <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Answer the questions with video interactive" onclick="parent_response_interactive_canvas('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-indent"></i></button>
                                                <?php }else{ ?>
                                                    <button class="btn btn-outline btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Show answer the questions" onclick="parent_show_canvas_response_interactive('<?php echo $minggu; ?>','<?php echo $key->id; ?>','<?php echo $key->name;?>','<?php echo $key->state; ?>')"><i class="fa fa-indent"></i></button>
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
