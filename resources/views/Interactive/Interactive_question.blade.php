<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')"><< Back</button>

                        <?php if($state_interactive=='Publish'){ ?>
                            <button class="btn btn-xs btn-primary">Publish</button>
                        <?php }else{ ?>
                            <button class="btn btn-xs btn-warning">Unpublish</button>
                        <?php } ?>

                        <?php if ($privilege > 0){ ?>
                            <button class="btn btn-success btn-xs" onclick="add_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>')">Add Question</button>
                        <?php } ?>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr style="background-color: skyblue;">
                                <th width="10px"><center>Orders</center></th>
                                <th style="width: 25%">Questions</th>
                                <th style="width: 10%"><center>Image</center></th>
                                <th style="width: 10%"><center>Type & Required</center></th>
                                <th style="width: 40%"><center>Answers</center></th>
                                <th style="width: 15%"><center>Action</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                <td>
                                    <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Up" onclick="up_sort_question('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $key->sort;?>')"><i class="fa fa-angle-double-up"></i></button>

                                    <button class="btn btn-outline btn-white btn-xs"><?php echo $key->sort;?></button>

                                    <button class="btn btn-outline btn-white btn-xs" data-toggle="tooltip" data-placement="top" title="Down" onclick="down_sort_question('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $key->sort;?>')"><i class="fa fa-angle-double-down"></i></button>
                                    
                                </td>
                                <td class="issue-info">
                                    <?php echo $key->name_question;?>
                                </td>
                                <td>
                                    <center>
                                        <?php if (!empty($key->file)){ ?>
                                            <div class="lightBoxGallery">
                                                <a href="{!! asset('upload/'.Session::get('kd_smt_active').'/question') !!}/<?php echo $key->file; ?>" title="Image" data-gallery="">
                                                    <img src="{!! asset('upload/'.Session::get('kd_smt_active').'/question') !!}/<?php echo $key->file; ?>" alt="Image" width="70" height="70">
                                                </a>
                                                
                                                <div id="blueimp-gallery" class="blueimp-gallery">
                                                    <div class="slides"></div>
                                                    <h3 class="title"></h3>
                                                    <a class="close">×</a>
                                                </div>

                                            </div>
                                        <?php } ?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <?php echo $key->type;?><br/>
                                        <?php echo $key->required;?>
                                    </center>
                                </td>
                                <td align="center" style="vertical-align: middle;"> 
                                    <?php if($key->type=='Option') { ?>
                                        <?php
                                            $sql = 'SELECT ans.*
                                                    FROM '.Session::get('db_active').'.mec_interactive_answers ans
                                                    WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                    AND ans.id_week = "'.$id_week.'" 
                                                    AND ans.id_interactive = "'.$id_interactive.'" 
                                                    AND ans.id_question = "'.$key->id.'" 
                                                    '
                                            ;   
                                            // echo $sql;exit();
                                            $query=collect(\DB::select($sql));
                                            foreach ($query as $ans) { 
                                        ?>
                                            <?php echo $ans->name_answer;?>
                                            <?php if($ans->true=='True') { ?>
                                                <i class="fa fa-check-circle" style="color:green"></i>
                                            <?php }else{ ?>
                                                <i class="fa fa-times-circle" style="color:tomato"></i>
                                            <?php } ?>
                                            (<?php echo $ans->skor;?>)

                                            <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit Answer" onclick="edit_answers('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $ans->id; ?>','<?php echo $ans->name_answer; ?>','<?php echo $ans->true; ?>','<?php echo $ans->skor; ?>')"><i class="fa fa-edit"></i></button>

                                            <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete Answer" onclick="del_answers('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $ans->id; ?>')"><i class="fa fa-trash"></i></button>

                                            <hr style="margin-bottom:2px; margin-top:2px" />
                                        <?php } ?>
                                        
                                            <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Add Answer" onclick="add_answers('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-plus"></i> Answer</button>

                                    <!-- Text input -->
                                    <?php }elseif($key->type=='Text'){ ?> 
                                        <?php
                                            $sql_count_text = 'SELECT count(*) as jml_d
                                                    FROM '.Session::get('db_active').'.mec_interactive_answers ans
                                                    WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                    AND ans.id_week = "'.$id_week.'" 
                                                    AND ans.id_interactive = "'.$id_interactive.'" 
                                                    AND ans.id_question = "'.$key->id.'" 
                                                    '
                                            ;   
                                            // echo $sql;exit();
                                            $query_count_text=collect(\DB::select($sql_count_text))->first();
                                        if ($query_count_text->jml_d<=0){ /*belum ada answer text*/
                                        ?>
                                            <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Add Answer" onclick="add_answers_text('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-plus"></i> Answer</button>
                                        <?php }else{ /*sudah ada answer text*/
                                            $sql_text = 'SELECT ans.*
                                                    FROM '.Session::get('db_active').'.mec_interactive_answers ans
                                                    WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                    AND ans.id_week = "'.$id_week.'" 
                                                    AND ans.id_interactive = "'.$id_interactive.'" 
                                                    AND ans.id_question = "'.$key->id.'" 
                                                    order by ans.id DESC limit 1
                                                    '
                                            ;   
                                            // echo $sql_text;exit();
                                            $query_text=collect(\DB::select($sql_text))->first();
                                            ?>
                                            <?php echo $query_text->name_answer;?> (<?php echo $query_text->skor;?>)
                                            <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit Answer" onclick="edit_answers_text('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $query_text->id; ?>','<?php echo $query_text->name_answer; ?>','<?php echo $query_text->true; ?>','<?php echo $query_text->skor; ?>')"><i class="fa fa-edit"></i></button>
                                        <?php }
                                        }elseif($key->type=='Matching'){ ?> 
                                        <?php

                                            $sql = 'SELECT ans.*
                                                    FROM '.Session::get('db_active').'.mec_interactive_answers ans
                                                    WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                    AND ans.id_week = "'.$id_week.'" 
                                                    AND ans.id_interactive = "'.$id_interactive.'" 
                                                    AND ans.id_question = "'.$key->id.'" 
                                                    '
                                            ;   
                                            // echo $sql;exit();
                                            $query=collect(\DB::select($sql));
                                            foreach ($query as $ans) { 
                                            ?>
                                                <?php echo $ans->question_matching;?> : <?php echo $ans->name_answer;?> (<?php echo $ans->skor;?>)
                                                <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit Answer" onclick="edit_answers_matching('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $ans->id; ?>','<?php echo $ans->question_matching; ?>','<?php echo $ans->name_answer; ?>','<?php echo $ans->true; ?>','<?php echo $ans->skor; ?>')"><i class="fa fa-edit"></i></button>

                                                <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete Answer" onclick="del_answers('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $ans->id; ?>')"><i class="fa fa-trash"></i></button>

                                                <hr style="margin-bottom:2px; margin-top:2px" />

                                            <?php } ?> 

                                            <button class="btn btn-outline btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="Add Answer" onclick="add_answers_matching('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-plus"></i> Answer Matching</button>
                                        <?php } ?> 
                                    
                                </td>
                                <td>
                                    <?php if ($privilege > 0){ ?>
                                        <button class="btn btn-outline btn-warning btn-sm" data-toggle="tooltip" data-placement="top" title="Edit" onclick="edit_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>','<?php echo $key->name_question; ?>','<?php echo $key->type;?>','<?php echo $key->required;?>')"><i class="fa fa-edit"></i></button>

                                        <!-- hide show -->
                                        <?php if ($key->state == 'Show'){ ?>
                                            <button class="btn btn-outline btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Hide" onclick="hide_state_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-eye"></i></button>
                                        <?php }else{ ?>
                                            <button class="btn btn-outline btn-default btn-sm" data-toggle="tooltip" data-placement="top" title="Show" onclick="show_state_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-eye-slash"></i></button>
                                        <?php } ?>

                                        <button class="btn btn-outline btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_question_interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $key->id; ?>')"><i class="fa fa-trash"></i></button>
                                    <?php } ?>
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
