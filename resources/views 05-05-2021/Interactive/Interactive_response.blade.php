<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="interactive('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>')"><< Back</button>

                        <?php if($state_interactive=='Publish'){ ?>
                            <button class="btn btn-xs btn-primary">Publish</button>
                        <?php }else{ ?>
                            <button class="btn btn-xs btn-warning">Unpublish</button>
                        <?php } ?>
                    </div>
                </div>

                <div class="panel-body">
                    <input type="hidden" value="<?php echo $kode_grade; ?>" id="kode_grade" name="kode_grade" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $id_pelajaran; ?>" id="id_pelajaran" name="id_pelajaran" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $id_week; ?>" id="id_week" name="id_week" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $minggu; ?>" id="minggu" name="minggu" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $name_interactive; ?>" id="name_interactive" name="name_interactive" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $state_interactive; ?>" id="state_interactive" name="state_interactive" class="form-control" readonly="">
                    <input type="hidden" value="<?php echo $id_interactive; ?>" id="id_interactive" name="id_interactive" class="form-control" readonly="">

                    <form method="POST" enctype="multipart/form-data" id="saveResponse" action="javascript:void(0)" >
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
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_answers ans
                                                            WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                            AND ans.id_week = "'.$id_week.'" 
                                                            AND ans.id_interactive = "'.$id_interactive.'" 
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
                            <?php }else{ ?>
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
                                                            FROM '.Session::get('kd_smt_active').'.mec_interactive_answers ans
                                                            WHERE ans.pelajaran = "'.$id_pelajaran.'"
                                                            AND ans.id_week = "'.$id_week.'" 
                                                            AND ans.id_interactive = "'.$id_interactive.'" 
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
                            <?php } ?>
                        <?php } ?>

                        </div>
                        
                        <button type="submit" class="btn btn-success pull-right" >Save</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


