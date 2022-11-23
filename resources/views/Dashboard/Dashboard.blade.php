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
                <?php if($walas>=1){ ?> <!-- jika user merupakan wali kelas -->
                <button class="btn btn-success dim" style="margin: 18px !important;" data-toggle="tooltip" data-placement="top" title data-original-title="Add Information" onclick="add_info()"><i class="fa fa-plus"></i></button>
                <?php } ?>
                <?php if(Session::get('tipe') == 'sdm') { ?> 
                <button class="btn btn-warning dim" style="margin: 18px !important; left:-30px;" data-toggle="tooltip" data-placement="top" title data-original-title="Send message to parent (bukom)" onclick="show_bukom()"><i class="fa fa-envelope-o"></i></button>
                <?php } ?>
            </div>
        
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight" id="wrapper_div">
    <div class="row" id="div_info">
    </div>

    <?php if(Session::get('tipe') != 'sdm') { ?> 
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default" style="border-top-right-radius:10px !important;border-top-left-radius:10px !important">
                    <div class="panel-heading" style="border-top-right-radius:10px !important;border-top-left-radius:10px !important">
                        <h5 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne_student">Kelas <?php echo $kelas_siswa; ?></a>
                        </h5>
                    </div>
                    <div id="collapseOne_student" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <?php foreach ($matpel as $subject) { ?>
                                <div class="col-lg-3">
                                    <!-- <a href="matpel/<?php echo $subject->kode_grade ?>/<?php echo $subject->id_pelajaran ?>">
                                    <div class="widget style1 lazur-bg" style="background-color: #1b61c1 !important;">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-bookmark-o fa-3x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <span><?php echo $subject->english; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                    </a> -->

                                    <a href="matpel/<?php echo $subject->kode_grade ?>/<?php echo $subject->id_pelajaran ?>">
                                    <!-- <div class="widget-head-color-box navy-bg p-lg text-center"> -->
                                    <div class="widget-head-color-box text-center">

                                        <?php 
                                        if (file_exists( public_path() . '/upload/'.Session::get('kd_smt_active').'/icon_subject/' .$subject->id_pelajaran. '.png')){ ?>
                                            <img src="{!! asset('upload/'.Session::get('kd_smt_active').'/icon_subject/'.$subject->id_pelajaran.'.png') !!}" alt="" style="height: 57.5px;width: 100%;border-top-right-radius:10px !important;border-top-left-radius:10px !important;border: 1px solid darkgray !important;">
                                        <?php }else{ ?>
                                            <img src="{!! asset('image/subject/img_subject.jpg') !!}" alt="" style="height: 57.5px;width: 100%;border-top-right-radius:10px !important;border-top-left-radius:10px !important;border: 1px solid darkgray !important;">
                                        <?php }
                                        ?>

                                        <!-- <div style="color: #fff;position: absolute;bottom: 125px;left: 20px;"><?php echo $subject->english; ?></div> -->
                                    </div>
                                    <div class="widget-text-box" style="height: 90px;border-bottom-right-radius:10px !important;border-bottom-left-radius:10px !important">
                                        <p style="color: black;"><?php echo $subject->english; ?></p>
                                    </div>
                                </a>

                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <?php }else{ 
        foreach ($grade_sdm as $key_sdm) {
    ?>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default" style="border-radius:10px !important">
                    <div class="panel-heading" style="border-top-right-radius:10px !important;border-top-left-radius:10px !important">
                        <h5 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne_sdm_<?php echo $key_sdm->kode; ?>">Grade <?php echo $key_sdm->kode; ?></a>
                        </h5>
                    </div>
                    <div id="collapseOne_sdm_<?php echo $key_sdm->kode; ?>" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <?php
                            // if(Session::get('username') == 'admin'){
                            if(Session::get('level') == '1'){
                                // $and_mp = 'AND ( g.guru = "'.Session::get('username').'" )';
                                // $and_mp = 'AND (
                                //                     guru_kelas.finger = "'.Session::get('username').'"
                                //                     OR guru_kelas.kode_grade in (
                                //                         SELECT
                                //                             kode_grade 
                                //                         FROM
                                //                         '.Session::get('db_active').'.priv_sdm_akses 
                                //                         WHERE
                                //                             finger = "'.Session::get('username').'"
                                //                     )
                                //                 ) 
                                // ';
                                $and_mp = '';
                            }else{
                                // $and_mp = 'AND ( g.guru = "'.Session::get('username').'" )'; 
                                $and_mp = 'AND (
                                                guru_kelas.finger = "'.Session::get('username').'"
                                                OR guru_kelas.kode_grade in (
                                                    SELECT
                                                        kode_grade 
                                                    FROM
                                                    '.Session::get('db_active').'.priv_sdm_akses 
                                                    WHERE
                                                        finger = "'.Session::get('username').'"
                                                )
                                            ) 
                                ';
                            }
                            // $sql_mp = 'SELECT p.kode as id_pelajaran, p.nama, p.english 
                            //     FROM
                            //         '.Session::get('kd_smt_active').'.priv_grade g,
                            //         '.Session::get('kd_smt_active').'.pelajaran p 
                            //     WHERE
                            //         ( g.pelajaran = p.kode ) 
                            //         '.$and_mp.'
                            //         AND ( p.english IS NOT NULL ) 
                            //         AND ( p.grade = "'.$key_sdm->kode.'"  ) 
                            //         AND p.is_elearning = "Y"
                            //         AND (p.kode is not null AND p.kode <> "")
                            //     ORDER BY
                            //         p.english
                            // ';

                            $sql_mp = 'SELECT
                                    mpg.kode AS id_pelajaran,
                                    pel.pelajaran_ktsp AS nama,
                                    pel.pelajaran_eng AS english 
                                FROM
                                    db_madania_bogor.tbl_pelajaran AS pel
                                    INNER JOIN '.Session::get('db_active').'.mapping_pelajaran_grade AS mpg ON pel.id = mpg.id_pelajaran
                                    INNER JOIN '.Session::get('db_active').'.priv_guru_kelas AS guru_kelas ON mpg.kode = guru_kelas.kode_pelajaran 
                                WHERE
                                    guru_kelas.kode_grade = "'.$key_sdm->kode.'"
                                    '.$and_mp.'
                                    AND mpg.is_elearning = "Y" 
                                    AND guru_kelas.kode_pelajaran <> "" 
                                     
                                GROUP BY
                                    guru_kelas.kode_pelajaran 
                                ORDER BY
                                    english
                            ';
                            // echo $sql_mp;exit();
                            $query_mp=DB::select($sql_mp);
                            foreach ($query_mp as $key_mp) {                            
                            ?>
                            <div class="col-lg-3">
                                <!-- <a href="matpel/<?php echo $key_sdm->kode ?>/<?php echo $key_mp->id_pelajaran ?>">
                                    <div class="widget style1 lazur-bg" style="background-color: #1b61c1 !important;">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <i class="fa fa-bookmark-o fa-5x"></i>
                                            </div>
                                            <div class="col-xs-8 text-right">
                                                <span><?php echo $key_mp->english; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                </a> -->

                                <a href="matpel/<?php echo $key_sdm->kode ?>/<?php echo $key_mp->id_pelajaran ?>">
                                    <div class="widget-head-color-box text-center">
                                        <?php 
                                        if (file_exists( public_path() . '/upload/'.Session::get('kd_smt_active').'/icon_subject/' .$key_mp->id_pelajaran. '.png')){ ?>
                                            <img src="{!! asset('upload/'.Session::get('kd_smt_active').'/icon_subject/'.$key_mp->id_pelajaran.'.png') !!}" alt="" style="height: 57.5px;width: 100%;border-top-right-radius:10px !important;border-top-left-radius:10px !important;border: 1px solid darkgray !important;">
                                        <?php }else{ ?>
                                            <img src="{!! asset('image/subject/img_subject.jpg') !!}" alt="" style="height: 57.5px;width: 100%;border-top-right-radius:10px !important;border-top-left-radius:10px !important;border: 1px solid darkgray !important;">
                                        <?php }
                                        ?>
                                        
                                        <!-- <div style="color: #fff;position: absolute;bottom: 125px;left: 20px;"><?php echo $key_mp->english; ?></div> -->
                                    </div>
                                    <div class="widget-text-box" style="height: 90px;border-bottom-right-radius:10px !important;border-bottom-left-radius:10px !important">
                                        <p style="color: black;"><?php echo $key_mp->english; ?></p>
                                    </div>
                                </a>
                            </div>
                        <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php }
    } ?>
</div>


<?php if($walas>=1){ ?> 
<div class="modal inmodal" id="modal_add_info" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title">Add Information</h4>
                <small class="font-bold">Grade <?php echo $grade_kelas->kode_grade; ?>, Class <?php echo $grade_kelas->kode_kelas; ?></small>
            </div>
            <form method="POST" enctype="multipart/form-data" id="save_info" action="javascript:void(0)" >
                <div class="modal-body">
                    <div class="form-group">
                        <label>Title</label> 
                        <input type="text" id="mdl_add_title" name="mdl_add_title" placeholder="Title" class="form-control">
                        <input type="hidden" id="mdl_add_kelas" name="mdl_add_kelas" class="form-control" value="<?php echo $grade_kelas->id_kelas; ?>" readonly >
                        <input type="hidden" id="mdl_add_grade" name="mdl_add_grade" class="form-control" value="<?php echo $grade_kelas->kode_grade; ?>" readonly >
                        <div id="title_alert" class="alert alert-warning" style="padding: 7px !important;display: none;">
                            </div>
                    </div>

                    <div class="form-group">
                        <label>Description</label> 
                        <textarea id="summernote" name="mdl_add_description" class="summernote"></textarea>
                    </div>

                    <div class="form-group">
                        <label>File (.pdf)</label> 
                        <input type="file" id="mdl_add_file" name="mdl_add_file" class="form-control" accept=".pdf">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal inmodal" id="modal_edit_info" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <i class="fa fa-laptop modal-icon"></i>
                <h4 class="modal-title">Edit Information</h4>
                <small class="font-bold" id="info_edit"></small>
            </div>
            <form method="POST" enctype="multipart/form-data" id="update_info" action="javascript:void(0)" >
                <div class="modal-body">
                    <div class="form-group">
                        <label>Title</label> 
                        <input type="text" id="mdl_edit_title" name="mdl_edit_title" placeholder="Title" class="form-control">
                        <input type="hidden" id="mdl_edit_id" name="mdl_edit_id" class="form-control" readonly>
                    </div>

                    <div class="form-group">
                        <label>Description</label> 
                        <textarea id="mdl_edit_description" name="mdl_edit_description" class="summernote"></textarea>
                        <!-- <textarea id="mdl_edit_description" name="mdl_edit_description"></textarea> -->
                    </div>

                    <div class="form-group">
                        <label>File (.pdf)</label> 
                        <input type="file" id="mdl_edit_file" name="mdl_edit_file" class="form-control" accept=".pdf">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" >Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php } ?>

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

    function add_info(){
        $('#modal_add_info').modal('show');
        $('#title_alert').hide();
        $('#mdl_add_title').val('');
        $('#mdl_add_file').val('');
    }

    function del_info(id){
        
        swal({
            title: "Are you sure?",
            // text: "Your will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: true,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
                // alert(id)
                // swal("Deleted!", "Your information has been deleted.", "success");
                del_info2(id)
            } else {
                swal("Cancelled", "Your information is safe :)", "error");
            }
        });
    }

    function del_info2(id){
        var _token  = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            type:'POST',
            url: "{{ url('/del_info') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    div_info();
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.info('Succes delete information', 'SUCCESS');
                    }, 1000);
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

    function edit_info(id){
        // $('#modal_edit_info').modal('show');
        // $('#mdl_edit_id').val(id);
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/edit_info') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#mdl_edit_id').val(id);
                    $('#info_edit').html(data.info_edit);
                    $('#mdl_edit_title').val(data.title);
                    $("#mdl_edit_description").code(data.description);
                    $('#modal_edit_info').modal('show');
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    $(document).ready(function (e) {
        $.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#save_info').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_info') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    var title = $('#mdl_add_title').val();
                    if (title==''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Title is empty!', 'ERROR');
                        }, 1000);
                        return false;
                    }
                    var id_kelas = $('#mdl_add_kelas').val();
                    var grade = $('#mdl_add_grade').val();
                    if (id_kelas=='' || grade==''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Something is wrong!', 'ERROR');
                        }, 1000);
                        return false;
                    }

                    /*jika file tidak kosong*/
                    if ($('#mdl_add_file').val() != ''){
                        var mdl_add_file = document.getElementById("mdl_add_file").files[0].name;
                        var ext = mdl_add_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['pdf']) == -1) 
                        {
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('Invalid File', 'ERROR');
                            }, 1000);
                            return false;
                        }
                    }
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        $('#modal_add_info').modal('hide');
                        div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add information', 'SUCCESS');
                        }, 1000);
                    }else{
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error(data.msg, 'ERROR');
                        }, 1000);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#update_info').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/update_info') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    var title = $('#mdl_edit_title').val();
                    if (title==''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Title is empty!', 'ERROR');
                        }, 1000);
                        return false;
                    }

                    /*jika file tidak kosong*/
                    if ($('#mdl_edit_file').val() != ''){
                        var mdl_add_file = document.getElementById("mdl_edit_file").files[0].name;
                        var ext = mdl_add_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['pdf']) == -1) 
                        {
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('Invalid File', 'ERROR');
                            }, 1000);
                            return false;
                        }
                    }
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        $('#modal_edit_info').modal('hide');
                        div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes update information', 'SUCCESS');
                        }, 1000);
                    }else{
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error(data.msg, 'ERROR');
                        }, 1000);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        });
    });









    

</script>