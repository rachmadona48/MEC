<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5><?php echo $name_interactive; ?></h5>
                    <div class="ibox-tools">
                        <button class="btn btn-danger btn-xs" onclick="show_appraisal('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $id_week; ?>','<?php echo $minggu; ?>','<?php echo $id_interactive; ?>','<?php echo $name_interactive; ?>','<?php echo $state_interactive; ?>','<?php echo $type; ?>')"><< Back</button>

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
                                                        <label>
                                                            - <?php echo $key_ans->name_answer; ?>
                                                        </label>
                                                    </div>
                                                <?php }
                                                ?>
                                                <div class="radio">
                                                    <label>
                                                        <b>Answer : <?php echo $key->response; ?></b>
                                                    </label>
                                                </div>
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
                                                <div class="radio">
                                                    <label>
                                                        <b>Answer : <?php echo $key->response; ?></b>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                            <?php } ?>
                        <?php } ?>
                            <div class="ibox-content">
                                <form method="POST" enctype="multipart/form-data" id="update_appraisal" action="javascript:void(0)" >
                                    <div class="modal-body" style="padding: 20px 20px 220px 30px !important;">
                                        <div class="form-group">
                                            <input type="hidden" id="kode_grade" name="kode_grade" value="<?php echo $kode_grade; ?>" readonly="">
                                            <input type="hidden" id="id_pelajaran" name="id_pelajaran" value="<?php echo $id_pelajaran; ?>" readonly="">
                                            <input type="hidden" id="id_week" name="id_week" value="<?php echo $id_week; ?>" readonly="">
                                            <input type="hidden" id="minggu" name="minggu" value="<?php echo $minggu; ?>" readonly="">
                                            <input type="hidden" id="id_interactive" name="id_interactive" value="<?php echo $id_interactive; ?>" readonly="">
                                            <input type="hidden" id="name_interactive" name="name_interactive" value="<?php echo $name_interactive; ?>" readonly="">
                                            <input type="hidden" id="state_interactive" name="state_interactive" value="<?php echo $state_interactive; ?>" readonly="">
                                            <input type="hidden" id="type" name="type" value="<?php echo $type; ?>" readonly="">
                                            <input type="hidden" id="id_appraisal" name="id_appraisal" value="<?php echo $id_appraisal; ?>" readonly="">
                                            <input type="hidden" id="idResponse" name="idResponse" value="<?php echo $idResponse; ?>" readonly="">
                                            <input type="hidden" id="username" name="username" value="<?php echo $username; ?>" readonly="">

                                            <label class="col-sm-2 control-label">Skor Temporary (Automatically)</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control m-b" id="skor_temp" name="skor_temp" onkeypress="return event.charCode >= 48 && event.charCode <=57" readonly="" value="<?php echo $skor_temp; ?>"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Skor Final</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control m-b" id="skor_final" name="skor_final" onkeypress="return event.charCode >= 48 && event.charCode <=57" required="" value="<?php echo $skor_final; ?>"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Note</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control m-b message-input" id="note" name="note"><?php echo $note; ?></textarea>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" >Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        
                        
                    <!-- </form> -->
                </div>

            </div>
        </div>
    </div>
</div>
@include('layouts.JSFunction')


