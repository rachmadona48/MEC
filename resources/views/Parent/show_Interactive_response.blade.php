<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
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

                <div class="panel-body">

                    <!-- <form method="POST" enctype="multipart/form-data" id="saveResponse" action="javascript:void(0)" > -->
                        <div class="col-md-12">

                        <?php foreach ($question as $key) { ?>
                            <?php if($key->type=='Option'){ ?>
                                <div class="form-group">
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width:2%"><?php echo $key->sort; ?>.</td>
                                            <td><?php echo $key->name_question; ?></td>
                                        </tr>
                                        <tr>
                                            <td style="width:2%"></td>
                                            <td>
                                                <?php 
                                                    $sql_ans = 'SELECT ans.*
                                                            FROM '.Session::get('db_active').'.mec_interactive_answers ans
                                                            WHERE ans.id_interactive = "'.$id_interactive.'" 
                                                            AND ans.id_question = "'.$key->id.'" 
                                                            '
                                                    ;   
                                                    // echo $sql;exit();
                                                    $query_ans=collect(\DB::select($sql_ans));
                                                    
                                                    foreach ($query_ans as $key_ans) { 
                                                        if($key->required=='Yes'){
                                                            $req = 'required="" ';
                                                        }else{
                                                            $req = '';
                                                        }
                                                ?>
                                                    <div class="radio">
                                                        <label>
                                                            - <?php echo $key_ans->name_answer; ?>
                                                        </label>
                                                    </div>
                                                <?php }
                                                ?>
                                                <div class="radio">
                                                    <label>
                                                        <?php 
                                                            $sql_qt = 'SELECT id as id_responses,response,skor,`true`
                                                                    FROM '.Session::get('db_active').'.mec_interactive_responses
                                                                    WHERE id_interactive = "'.$id_interactive.'" 
                                                                    AND id_question = "'.$key->id.'"
                                                                    '
                                                            ;   
                                                            // echo $sql_ans;exit();
                                                            $query_qt=collect(\DB::select($sql_qt))->first();
                                                        ?>
                                                        <b>Answer : <?php echo $query_qt->response; ?></b>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- <label class="col-md-2 control-label"><?php echo $key->sort; ?></label>
                                    <label class="col-md-10 control-label"><?php echo $key->name_question; ?></label> -->
                                </div>
                            <?php }else if($key->type=='Text'){ ?>
                                <table style="width:100%">
                                        <tr>
                                            <td style="width:2%"><?php echo $key->sort; ?>.</td>
                                            <td><?php echo $key->name_question; ?></td>
                                        </tr>
                                        <tr>
                                            <td style="width:2%"></td>
                                            <td>
                                                <?php 

                                                    if($key->required=='Yes'){
                                                        $req = 'required="" ';
                                                    }else{
                                                        $req = '';
                                                    }
                                                ?>
                                                <div class="radio">
                                                    <label>
                                                        <?php 
                                                            $sql_qt = 'SELECT id as id_responses,response,skor,`true`
                                                                    FROM '.Session::get('db_active').'.mec_interactive_responses
                                                                    WHERE id_interactive = "'.$id_interactive.'" 
                                                                    AND id_question = "'.$key->id.'"
                                                                    '
                                                            ;   
                                                            // echo $sql_ans;exit();
                                                            $query_qt=collect(\DB::select($sql_qt))->first();
                                                        ?>
                                                        <b>Answer : <?php echo $query_qt->response; ?></b>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                            <?php }else if($key->type=='Matching'){ ?>
                                <table style="width:100%">
                                        <tr>
                                            <td style="width:2%"><?php echo $key->sort; ?>.</td>
                                            <td><?php echo $key->name_question; ?></td>
                                        </tr>
                                        <tr>
                                            <td style="width:2%"></td>
                                            <td>
                                                <?php 
                                                    if($key->required=='Yes'){
                                                        $req = 'required="" ';
                                                    }else{
                                                        $req = '';
                                                    }
                                                ?>
                                                
                                                <?php 
                                                    $sql_qt = '
                                                            SELECT res.id as id_responses,res.response,res.skor,res.`true`,ans.question_matching
                                                            from mdn120202021.mec_interactive_responses res
                                                            LEFT JOIN mdn120202021.mec_interactive_answers ans on res.id_answer = ans.id
                                                            WHERE res.id_interactive =  "'.$id_interactive.'" 
                                                            AND res.id_question = "'.$key->id.'"
                                                            '
                                                    ;   
                                                    // echo $sql_ans;exit();
                                                    $query_qt=collect(\DB::select($sql_qt));
                                                    foreach ($query_qt as $key_ans) {
                                                ?>
                                                <div class="radio">
                                                    <label>
                                                    <b><?php echo $key_ans->question_matching; ?> : <?php echo $key_ans->response; ?></b>
                                                    </label>
                                                </div>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    </table>
                            <?php } ?>
                        <?php } ?>
                            <div class="ibox-content">
                                <i><b>Score (automatically,temporary) : <?php echo $skor_temp; ?></b></i><br/>
                                <i><b>Score (final) : <?php echo $skor_final; ?></b></i><br/>
                                <i>Note : </i>
                                <i><?php echo $note; ?></i>
                            </div>
                        </div>
                        
                        
                    <!-- </form> -->
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


