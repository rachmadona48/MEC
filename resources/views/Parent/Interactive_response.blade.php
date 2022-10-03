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
                                                            FROM '.db_active().'.mec_interactive_answers ans
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
                                                        <input type="radio" 
                                                            name="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>" 
                                                            id="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>"  
                                                            value="val_<?php echo $key_ans->id; ?>_<?php echo $key_ans->skor; ?>_<?php echo $key_ans->true; ?>_<?php echo $key_ans->name_answer; ?>" <?php echo $req; ?> >
                                                        <label>
                                                            <?php echo $key_ans->name_answer; ?>
                                                        </label>
                                                    </div>
                                                <?php }
                                                ?>
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
                                                    $sql_ans = 'SELECT ans.*
                                                            FROM '.db_active().'.mec_interactive_answers ans
                                                            WHERE ans.id_interactive = "'.$id_interactive.'" 
                                                            AND ans.id_question = "'.$key->id.'" 
                                                            order by ans.id DESC limit 1
                                                            '
                                                    ;   
                                                    // echo $sql_ans;exit();
                                                    $query_ans=collect(\DB::select($sql_ans))->first();

                                                    if($key->required=='Yes'){
                                                        $req = 'required="" ';
                                                    }else{
                                                        $req = '';
                                                    }
                                                ?>
                                                <textarea class="form-control m-b message-input" 
                                                    name="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>_<?php echo $query_ans->id; ?>_<?php echo $query_ans->skor; ?>"
                                                    id="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>_<?php echo $query_ans->id; ?>_<?php echo $query_ans->skor; ?>"    
                                                    placeholder="Answer" <?php echo $req; ?>></textarea>
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
                                                    $sql_ans = 'SELECT ans.*
                                                            FROM '.db_active().'.mec_interactive_answers ans
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
                                                    <div>
                                                        <label class="col-sm-4 control-label"><?php echo $key_ans->question_matching; ?></label>
                                                        <div class="col-sm-8">
                                                            <select data-placeholder="Choose an answer" class="form-control m-b" 
                                                            name="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>_<?php echo $key_ans->id; ?>" 
                                                            id="ans_qt_<?php echo $key->type; ?>_<?php echo $key->id_interactive; ?>_<?php echo $key->id; ?>_<?php echo $key_ans->id; ?>" 
                                                            <?php echo $req; ?>>
                                                                <option value="">Choose an answer</option>
                                                                <?php
                                                                    $sql_ans_mt = 'SELECT ans.*
                                                                    FROM '.db_active().'.mec_interactive_answers ans
                                                                    WHERE ans.id_interactive = "'.$id_interactive.'" 
                                                                    AND ans.id_question = "'.$key->id.'" 
                                                                    '
                                                                    ;   
                                                                    // echo $sql;exit();
                                                                    $query_ans_mt=collect(\DB::select($sql_ans_mt));
                                                                    foreach ($query_ans_mt as $key_ans_mt) {
                                                                ?>
                                                                    <option value="<?php echo $key_ans_mt->name_answer; ?>"><?php echo $key_ans_mt->name_answer; ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                <?php }
                                                ?>
                                            </td>
                                        </tr>
                                    </table>
                            <?php } ?>
                        <?php } ?>

                        </div>
                        
                        <!-- <button type="submit" class="btn btn-success pull-right" >Save</button> -->
                    <!-- </form> -->
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


