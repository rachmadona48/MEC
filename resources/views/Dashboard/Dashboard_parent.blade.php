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
    <div class="col-lg-2">
        
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row" id="div_tlm">
    
    <?php if(Session::get('tipe') == 'ortu') { ?> 
        <div class="row">
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
                                        <div class="widget-text-box" style="height: 90px;">
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
                                                // echo $sql_count;exit();
                                                $query_count_int=collect(\DB::select($sql_count_int))->first();
                                            ?>
                                            <p style="color: black;">Interactive : <?php echo $query_count_int->jml_d; ?></p>

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
                                            <p style="color: black;">Teaching Learning : <?php echo $query_count_tlm->jml_d; ?></p>
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