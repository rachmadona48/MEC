@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>MEC Elearning Portal</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/dashboard')}}">MEC Elearning Portal</a>
            </li>
            <!-- <li class="active">
                <strong>Layouts</strong>
            </li> -->
        </ol>
    </div>
    <div class="col-lg-2" id="button_div">
        
            <div class="tooltip-demo">
                <?php if(Session::get('tipe') == 'ortu') { ?> 
                <button class="btn btn-warning dim" style="margin: 18px !important; left:-30px;" data-toggle="tooltip" data-placement="top" title data-original-title="Message from teacher (bukom)" onclick="show_bukom()"><i class="fa fa-envelope-o"></i></button>
                <?php } ?>
            </div>
        
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight" id="wrapper_div">
    <div class="row" id="div_tlm">
    
    <?php if(Session::get('tipe') == 'ortu') { ?> 
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne_discuss">Discuss</a>
                        </h5>
                    </div>
                    <div id="collapseOne_discuss" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                    <select data-placeholder="Choose a Subject..." id="subject_discuss" class="chosen-select" style="width:350px;" tabindex="2">
                                        <option value="">Choose Subject</option>
                                        <?php foreach ($subject as $key) { ?>
                                            <option value="<?php echo $key->kode;?>"><?php echo $key->english;?></option>
                                        <?php } ?>
                                    </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-outline btn-success" onclick="get_discuss_parent()">Show Discuss</button>
                            </div>
                        </div>
                        <div class="ibox"  id="div_discuss_parent">
                            <!-- <div class="ibox-content">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr style="background-color: skyblue;">
                                                <th><center>No</center></th>
                                                <th>Topic Title</th>
                                                <th><center>Moderator</center></th>
                                                <th><center>Started</center></th>
                                                <th><center>Closed</center></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>  
                                </div> 
                            </div>  -->
                        </div>
                    </div>
                </div>
                
            </div>

            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne_student">Kelas <?php echo $kelas_siswa; ?></a>
                        </h5>
                    </div>
                    <div id="collapseOne_student" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <?php foreach ($weekly as $weekly) { ?>
                                <div class="col-lg-3">

                                    <!-- <a href="parent_tlm/<?php echo $weekly->minggu ?>"> -->
                                    <a onclick="parent_tlm_int(<?php echo $weekly->minggu ?>)">
                                        <div class="widget-head-color-box text-center">
                                            <img src="{!! asset('image/subject/img_subject.jpg') !!}" alt="" style="height: 57.5px;width: 100%;">
                                            <p style="color: #fbf9f9;
                                                        margin: 5px;
                                                        bottom: 102px;
                                                        position: absolute;
                                                        font-size: large;
                                                        font-family: sans-serif;">Week <?php echo $weekly->minggu; ?></p>
                                        </div>
                                        <div class="widget-text-box" style="height: 90px; padding: 11px;">
                                            <?php
                                                $sql_count_int = '
                                                    SELECT COUNT(*) as jml_d
                                                    FROM '.Session::get('kd_smt_active').'.mec_interactive
                                                    WHERE id_week in (
                                                        SELECT id
                                                        FROM '.Session::get('kd_smt_active').'.weeklyguide
                                                        WHERE pelajaran in (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY p.kode
                                                        )
                                                        AND minggu = "'.$weekly->minggu.'" 
                                                    )
                                                    AND state = "Publish"
                                                ';   
                                                // echo $sql_count_int;exit();
                                                $query_count_int=collect(\DB::select($sql_count_int))->first();
                                            ?>
                                            <p style="color: black; margin: 0 0 0 0;">Interactive : <?php echo $query_count_int->jml_d; ?></p>


                                            <?php
                                                $sql_count_hm = '
                                                    SELECT COUNT(*) as jml_d
                                                    FROM '.Session::get('kd_smt_active').'.mec_interactive
                                                    WHERE id_week in (
                                                        SELECT id
                                                        FROM '.Session::get('kd_smt_active').'.weeklyguide
                                                        WHERE pelajaran in (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY p.kode
                                                        )
                                                        AND minggu = "'.$weekly->minggu.'" 
                                                    )
                                                    AND category = "Homework"
                                                    AND state = "Publish"
                                                ';   
                                                // echo $sql_count_int;exit();
                                                $query_count_hm=collect(\DB::select($sql_count_hm))->first();

                                                $sql_count_hm_done = '
                                                    SELECT
                                                        COUNT(*) as jml_done
                                                    FROM
                                                        '.Session::get('kd_smt_active').'.mec_interactive it
                                                    INNER JOIN '.Session::get('kd_smt_active').'.mec_interactive_appraisal ap on it.id = ap.id_interactive AND ap.username = "'.Session::get('username').'"
                                                    WHERE
                                                        id_week IN (
                                                        SELECT
                                                            id 
                                                        FROM
                                                            '.Session::get('kd_smt_active').'.weeklyguide 
                                                        WHERE
                                                            pelajaran IN (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY
                                                                p.kode 
                                                            ) 
                                                            AND minggu = "'.$weekly->minggu.'" 
                                                        ) 
                                                        AND it.category = "Homework"
                                                        AND it.state = "Publish"
                                                ';   
                                                // echo $sql_count_hm_done;exit();
                                                $query_count_hm_done=collect(\DB::select($sql_count_hm_done))->first();
                                            ?>
                                            <p style="color: black; margin: 0 0 0 0;">Homework : <?php echo $query_count_hm->jml_d; ?>, Done : <?php echo $query_count_hm_done->jml_done; ?></p>

                                            <?php
                                                $sql_count_as = '
                                                    SELECT COUNT(*) as jml_d
                                                    FROM '.Session::get('kd_smt_active').'.mec_interactive
                                                    WHERE id_week in (
                                                        SELECT id
                                                        FROM '.Session::get('kd_smt_active').'.weeklyguide
                                                        WHERE pelajaran in (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY p.kode
                                                        )
                                                        AND minggu = "'.$weekly->minggu.'" 
                                                    )
                                                    AND category = "Assignment"
                                                    AND state = "Publish"
                                                ';   
                                                // echo $sql_count_int;exit();
                                                $query_count_as=collect(\DB::select($sql_count_as))->first();

                                                $sql_count_as_done = '
                                                    SELECT
                                                        COUNT(*) as jml_done
                                                    FROM
                                                        '.Session::get('kd_smt_active').'.mec_interactive it
                                                    INNER JOIN '.Session::get('kd_smt_active').'.mec_interactive_appraisal ap on it.id = ap.id_interactive AND ap.username = "'.Session::get('username').'"
                                                    WHERE
                                                        id_week IN (
                                                        SELECT
                                                            id 
                                                        FROM
                                                            '.Session::get('kd_smt_active').'.weeklyguide 
                                                        WHERE
                                                            pelajaran IN (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY
                                                                p.kode 
                                                            ) 
                                                            AND minggu = "'.$weekly->minggu.'" 
                                                        ) 
                                                        AND it.category = "Assignment"
                                                        AND it.state = "Publish"
                                                ';   
                                                // echo $sql_count_hm_done;exit();
                                                $query_count_as_done=collect(\DB::select($sql_count_as_done))->first();
                                            ?>
                                            <p style="color: black; margin: 0 0 0 0;">Assignment : <?php echo $query_count_as->jml_d; ?>, Done : <?php echo $query_count_as_done->jml_done; ?></p>

                                            <?php
                                                $sql_count_tlm = '
                                                    SELECT COUNT(*) as jml_d
                                                    FROM '.Session::get('kd_smt_active').'.slides_item
                                                    WHERE id_week in (
                                                        SELECT id
                                                        FROM '.Session::get('kd_smt_active').'.weeklyguide
                                                        WHERE pelajaran in (
                                                            SELECT
                                                                p.kode 
                                                            FROM
                                                                '.Session::get('kd_smt_active').'.pelajaran p,
                                                                '.Session::get('kd_smt_active').'.nilai_diknas n 
                                                            WHERE
                                                                ( p.kode = n.pelajaran ) 
                                                                AND ( n.nim = "'.Session::get('username').'" ) 
                                                                AND ( p.english IS NOT NULL ) 
                                                                AND ( p.is_elearning IS NOT NULL ) 
                                                            GROUP BY p.kode
                                                        )
                                                        AND minggu = "'.$weekly->minggu.'" 
                                                    )
                                                    AND approve is not NULL
                                                ';   
                                                // echo $sql_count;exit();
                                                $query_count_tlm=collect(\DB::select($sql_count_tlm))->first();
                                            ?>
                                            <p style="color: black; margin: 0 0 0 0;">Teaching Learning Material : <?php echo $query_count_tlm->jml_d; ?></p>
                                        </div>
                                    </a>

                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <?php } ?>

    </div>
</div>



@include('layouts.Footer')

<script type="text/javascript">
    $(document).ready(function(){
        $('#menu_dashboard').addClass('active');  
        div_info();  
    });

    function div_info(){
        var _token  = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            type:'POST',
            url: "{{ url('/div_info') }}",
            data: {_token:_token},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_info").html(data.div);
                }
                else{
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.error('Something is wrong!', 'ERROR');
                    }, 1000);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }











    

</script>