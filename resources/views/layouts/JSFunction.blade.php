

<script>
    $(document).ready(function() {
        

        $("#sparkline1").sparkline([34, 43, 43, 35, 44, 32, 44, 48], {
            type: 'line',
            width: '100%',
            height: '50',
            lineColor: '#1ab394',
            fillColor: "transparent"
        });

        $('.summernote').summernote();

        var config = {
                '.chosen-select'           : {},
                '.chosen-select-semester'  : {width:"400%"},
                '.chosen-select'           : {width:"200%"}
                /*'.chosen-select-deselect'  : {allow_single_deselect:true},
                '.chosen-select-no-single' : {disable_search_threshold:10},
                '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
                '.chosen-select-width'     : {width:"95%"}*/
            }
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }

        // $("#tgl_awal").datepicker({"setDate": new Date()});
        $('#tgl_awal').datepicker({
            format:'dd-mm-yyyy',
        }).datepicker("setDate",'now');

        $('#tgl_awal_edit_week').datepicker({
            format:'dd-mm-yyyy',
        }).datepicker("setDate",'now');

        $('#tgl_akhir').datepicker({
            format:'dd-mm-yyyy',
        }).datepicker("setDate",'now');

        $('#tgl_akhir_edit_week').datepicker({
            format:'dd-mm-yyyy',
        }).datepicker("setDate",'now');


        $('#data_5 .input-daterange').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            changeMonth: true,
            changeYear: true,
            beforeShow: function() { 
                $('#ui-datepicker-div').addClass('datepicker');
            }
        });

        $('#date_close_discuss .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format:'dd-mm-yyyy',
        });

        $('#mdl_edit_date_topic_date_from').datepicker({
            format:'dd-mm-yyyy',
        });

        $('#mdl_edit_date_topic_date_to').datepicker({
            format:'dd-mm-yyyy',
        });

        // $('input[name="daterange"]').daterangepicker()

        $.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#save_bukom').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/save_bukom') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                
                    $('#submit-modal_add_bukom').hide();
                    $('#spinner-modal_add_bukom').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){

                        $('#modal_add_bukom').modal('hide');
                        $("#mdl_add_bukom_penerima").val('');
                        $("#mdl_add_bukom_subyek").val('');
                        $("#mdl_add_bukom_isi").val('');
                        $("#mdl_add_bukom_lampiran1").val('');
                        $("#mdl_add_bukom_lampiran2").val('');
                        $("#mdl_add_bukom_lampiran3").val('');
                        show_bukom() 
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add bukom', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_bukom').show();
                    $('#spinner-modal_add_bukom').hide();

                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#reply_bukom').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/reply_bukom') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                
                    $('#submit-modal_reply_bukom').hide();
                    $('#spinner-modal_reply_bukom').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){

                        $('#modal_reply_bukom').modal('hide');
                        $("#mdl_reply_bukom_reply").val('');
                        id_bukom = $("#mdl_reply_bukom_id_bukom").val();
                        // alert(id_bukom)
                        detail_bukom(id_bukom)
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes reply', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_reply_bukom').show();
                    $('#spinner-modal_reply_bukom').hide();

                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#save_tlm_lmp').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            kode_grade = $("#mdl_tlm_add_lmp_kode_grade").val();
            id_pelajaran = $("#mdl_tlm_add_lmp_id_pelajaran").val();
            id_week = $("#mdl_tlm_add_lmp_id_week").val();
            week = $("#mdl_tlm_add_lmp_week").val();
            id_tlm = $("#mdl_tlm_add_lmp_id_tlm").val();

            $.ajax({
                type:'POST',
                url: "{{ url('/add_tlm_lmp') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){

                    /*jika file tidak kosong*/
                    if ($('#mdl_add_file_tlm_slide').val() != ''){
                        var mdl_add_file = document.getElementById("mdl_add_file_tlm_slide").files[0].name;
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
                    }else{
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('File is empty', 'ERROR');
                        }, 1000);
                        return false;
                    }
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        $('#modal_tlm_add_lmp').modal('hide');
                        menu_tlm_detail(kode_grade,id_pelajaran,id_week,week,id_tlm)
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

        $('#update_icon_subject').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/update_icon_subject') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){

                    /*jika file tidak kosong*/
                    if ($('#id_icon_subject').val() != ''){
                        var mdl_add_file = document.getElementById("id_icon_subject").files[0].name;
                        var ext = mdl_add_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['png']) == -1) 
                        {
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('File must be PNG!', 'ERROR');
                            }, 1000);
                            return false;
                        }
                    }else{
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('File is empty', 'ERROR');
                        }, 1000);
                        return false;
                    }
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        // menu_tlm_detail(kode_grade,id_pelajaran,id_week,week)
                        location.reload(true);
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

        $('#simpan_outcomes').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/simpan_outcomes') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_ot_kode_grade").val();
                        id_pelajaran = $("#mdl_ot_id_pelajaran").val();
                        id_week = $("#mdl_ot_id_week").val();
                        week = $("#mdl_ot_week").val();
                        kolom = $("#mdl_ot_kolom").val();

                        $('#modal_edit_ot').modal('hide');

                        matpel_week(kode_grade,id_pelajaran,id_week,week)
                        
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

        $('#simpan_rubrik').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/simpan_rubrik') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    
                    var id_mst_rubrik = $('#id_mst_rubrik').val();
                    if (id_mst_rubrik=='' || id_mst_rubrik==0){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Rubrik is empty!', 'ERROR');
                        }, 1000);
                        return false;
                    }
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_tpc_kode_grade_rb").val();
                        id_pelajaran = $("#mdl_tpc_id_pelajaran_rb").val();
                        id_week = $("#mdl_tpc_id_week_rb").val();
                        week = $("#mdl_tpc_week_rb").val();
                        kolom = $("#mdl_tpc_kolom_rb").val();

                        $('#modal_edit_topic_rb').modal('hide');

                        matpel_week(kode_grade,id_pelajaran,id_week,week)
                        
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

        $('#simpan_upd_rubrik').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/simpan_upd_rubrik') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_tpc_upd_kode_grade_rb").val();
                        id_pelajaran = $("#mdl_tpc_upd_id_pelajaran_rb").val();
                        id_week = $("#mdl_tpc_upd_id_week_rb").val();
                        week = $("#mdl_tpc_upd_week_rb").val();

                        $('#modal_edit_upd_topic_rb').modal('hide');

                        matpel_week(kode_grade,id_pelajaran,id_week,week)
                        
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

        $('#save_interactive').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_interactive') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    

                    /*jika file tidak kosong*/
                    if ($('#mdl_add_int_file').val() != ''){
                        var mdl_add_int_file = document.getElementById("mdl_add_int_file").files[0].name;
                        var ext = mdl_add_int_file.split('.').pop().toLowerCase();
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

                    if ($('#mdl_add_int_type').val() == 'Canvas' && $('#mdl_add_int_canvas').val() == ''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Link canvas is empty', 'ERROR');
                        }, 1000);
                        return false;
                    }

                    $('#submit-modal_add_int').hide();
                    $('#spinner-modal_add_int').show();
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_add_int_kode_grade").val();
                        id_pelajaran = $("#mdl_add_int_id_pelajaran").val();
                        id_week = $("#mdl_add_int_id_week").val();
                        week = $("#mdl_add_int_week").val();

                        $('#modal_add_int').modal('hide');
                        interactive(kode_grade,id_pelajaran,id_week,week)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add interactive', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_int').show();
                    $('#spinner-modal_add_int').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#save_edit_interactive').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/edit_interactive') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    

                    /*jika file tidak kosong*/
                    if ($('#mdl_edit_int_file').val() != ''){
                        var mdl_edit_int_file = document.getElementById("mdl_edit_int_file").files[0].name;
                        var ext = mdl_edit_int_file.split('.').pop().toLowerCase();
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

                    if ($('#mdl_edit_int_type').val() == 'Canvas' && $('#mdl_edit_int_canvas').val() == ''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Link canvas is empty', 'ERROR');
                        }, 1000);
                        return false;
                    }
                    
                    $('#submit-modal_edit_int').hide();
                    $('#spinner-modal_edit_int').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_edit_int_kode_grade").val();
                        id_pelajaran = $("#mdl_edit_int_id_pelajaran").val();
                        id_week = $("#mdl_edit_int_id_week").val();
                        week = $("#mdl_edit_int_week").val();

                        $('#modal_edit_int').modal('hide');
                        interactive(kode_grade,id_pelajaran,id_week,week)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes edit interactive', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_edit_int').show();
                    $('#spinner-modal_edit_int').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });


        $('#save_qt_interactive').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_question') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    if ($('#mdl_add_qt_int_type').val() == ''){
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.error('Invalid type', 'ERROR');
                        }, 1000);
                        return false;
                    }

                    /*jika file tidak kosong*/
                    if ($('#mdl_add_qt_int_file').val() != ''){
                        var mdl_add_qt_int_file = document.getElementById("mdl_add_qt_int_file").files[0].name;
                        var ext = mdl_add_qt_int_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['jpeg','jpg','png']) == -1) 
                        {
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('Invalid Image', 'ERROR');
                            }, 1000);
                            return false;
                        }
                    }
                    $('#submit-modal_add_qt_int').hide();
                    $('#spinner-modal_add_qt_int').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_add_qt_int_kode_grade").val();
                        id_pelajaran = $("#mdl_add_qt_int_id_pelajaran").val();
                        id_week = $("#mdl_add_qt_int_id_week").val();
                        week = $("#mdl_add_qt_int_week").val();
                        id_interactive = $("#mdl_add_qt_int_id_interactive").val();
                        name_interactive = $("#mdl_add_qt_int_name_interactive").val();
                        state_interactive = $("#mdl_add_qt_int_state_interactive").val();

                        $('#modal_add_qt_int').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add question', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_qt_int').show();
                    $('#spinner-modal_add_qt_int').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#update_qt_interactive').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/update_question') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){

                    /*jika file tidak kosong*/
                    if ($('#mdl_edit_qt_int_file').val() != ''){
                        var mdl_edit_qt_int_file = document.getElementById("mdl_edit_qt_int_file").files[0].name;
                        var ext = mdl_edit_qt_int_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['jpeg','jpg','png']) == -1) 
                        {
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('Invalid Image', 'ERROR');
                            }, 1000);
                            return false;
                        }
                    }
                    $('#submit-modal_edit_qt_int').hide();
                    $('#spinner-modal_edit_qt_int').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_edit_qt_int_kode_grade").val();
                        id_pelajaran = $("#mdl_edit_qt_int_id_pelajaran").val();
                        id_week = $("#mdl_edit_qt_int_id_week").val();
                        week = $("#mdl_edit_qt_int_week").val();
                        id_interactive = $("#mdl_edit_qt_int_id_interactive").val();
                        name_interactive = $("#mdl_edit_qt_int_name_interactive").val();
                        state_interactive = $("#mdl_edit_qt_int_state_interactive").val();

                        $('#modal_edit_qt_int').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes Edit question', 'SUCCESS');
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
                },complete: function() {
                    $('#submit-modal_edit_qt_int').show();
                    $('#spinner-modal_edit_qt_int').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#save_answer').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_answer') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_add_ans').hide();
                    $('#spinner-modal_add_ans').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_add_ans_kode_grade").val();
                        id_pelajaran = $("#mdl_add_ans_id_pelajaran").val();
                        id_week = $("#mdl_add_ans_id_week").val();
                        week = $("#mdl_add_ans_week").val();
                        id_interactive = $("#mdl_add_ans_id_interactive").val();
                        name_interactive = $("#mdl_add_ans_name_interactive").val();
                        state_interactive = $("#mdl_add_ans_state_interactive").val();

                        $('#modal_add_ans').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_ans').show();
                    $('#spinner-modal_add_ans').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#edit_answer_question').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/edit_answer') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_edit_ans').hide();
                    $('#spinner-modal_edit_ans').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_edit_ans_kode_grade").val();
                        id_pelajaran = $("#mdl_edit_ans_id_pelajaran").val();
                        id_week = $("#mdl_edit_ans_id_week").val();
                        week = $("#mdl_edit_ans_week").val();
                        id_interactive = $("#mdl_edit_ans_id_interactive").val();
                        name_interactive = $("#mdl_edit_ans_name_interactive").val();
                        state_interactive = $("#mdl_edit_ans_state_interactive").val();

                        $('#modal_edit_ans').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_edit_ans').show();
                    $('#spinner-modal_edit_ans').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });


        $('#save_answer_text').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_answer_text') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_add_text_ans').hide();
                    $('#spinner-modal_add_text_ans').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_add_text_ans_kode_grade").val();
                        id_pelajaran = $("#mdl_add_text_ans_id_pelajaran").val();
                        id_week = $("#mdl_add_text_ans_id_week").val();
                        week = $("#mdl_add_text_ans_week").val();
                        id_interactive = $("#mdl_add_text_ans_id_interactive").val();
                        name_interactive = $("#mdl_add_text_ans_name_interactive").val();
                        state_interactive = $("#mdl_add_text_ans_state_interactive").val();

                        $('#modal_add_text_ans').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_text_ans').show();
                    $('#spinner-modal_add_text_ans').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });


        $('#edit_answer_text_question').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/edit_answer_text') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_edit_ans_text').hide();
                    $('#spinner-modal_edit_ans_text').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_edit_ans_text_kode_grade").val();
                        id_pelajaran = $("#mdl_edit_ans_text_id_pelajaran").val();
                        id_week = $("#mdl_edit_ans_text_id_week").val();
                        week = $("#mdl_edit_ans_text_week").val();
                        id_interactive = $("#mdl_edit_ans_text_id_interactive").val();
                        name_interactive = $("#mdl_edit_ans_text_name_interactive").val();
                        state_interactive = $("#mdl_edit_ans_text_state_interactive").val();

                        $('#modal_edit_ans_text').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_edit_ans_text').show();
                    $('#spinner-modal_edit_ans_text').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#save_answer_matching').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/add_answer_matching') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_add_matching_ans').hide();
                    $('#spinner-modal_add_matching_ans').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_add_matching_ans_kode_grade").val();
                        id_pelajaran = $("#mdl_add_matching_ans_id_pelajaran").val();
                        id_week = $("#mdl_add_matching_ans_id_week").val();
                        week = $("#mdl_add_matching_ans_week").val();
                        id_interactive = $("#mdl_add_matching_ans_id_interactive").val();
                        name_interactive = $("#mdl_add_matching_ans_name_interactive").val();
                        state_interactive = $("#mdl_add_matching_ans_state_interactive").val();

                        $('#modal_add_matching_ans').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_add_matching_ans').show();
                    $('#spinner-modal_add_matching_ans').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#edit_answer_matching').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/edit_answer_matching') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    $('#submit-modal_edit_matching_ans').hide();
                    $('#spinner-modal_edit_matching_ans').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        kode_grade = $("#mdl_edit_matching_ans_kode_grade").val();
                        id_pelajaran = $("#mdl_edit_matching_ans_id_pelajaran").val();
                        id_week = $("#mdl_edit_matching_ans_id_week").val();
                        week = $("#mdl_edit_matching_ans_week").val();
                        id_interactive = $("#mdl_edit_matching_ans_id_interactive").val();
                        name_interactive = $("#mdl_edit_matching_ans_name_interactive").val();
                        state_interactive = $("#mdl_edit_matching_ans_state_interactive").val();

                        $('#modal_edit_matching_ans').modal('hide');
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive)
                        // div_info();  
                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes add answer', 'SUCCESS');
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
                complete: function() {
                    $('#submit-modal_edit_matching_ans').show();
                    $('#spinner-modal_edit_matching_ans').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });


        $('#saveResponse_upload').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/save_response_upload') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){

                    /*jika file tidak kosong*/
                    if ($('#file_upload_response').val() != ''){
                        var mdl_add_file = document.getElementById("file_upload_response").files[0].name;
                        var ext = mdl_add_file.split('.').pop().toLowerCase();
                        if(jQuery.inArray(ext, ['pdf', 'jpg', 'jpeg', 'png']) == -1) 
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
                    }else{
                        // swal("Cancelled", "File is empty", "error");
                        setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.error('File is empty', 'ERROR');
                            }, 1000);
                            return false;
                    }
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        // $('#modal_tlm_add_lmp').modal('hide');
                        kode_grade = $("#kode_grade").val();
                        id_pelajaran = $("#id_pelajaran").val();
                        id_week = $("#id_week").val();
                        week = $("#minggu").val();
                        name_interactive = $("#name_interactive").val();
                        state_interactive = $("#state_interactive").val();

                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes upload file', 'SUCCESS');
                        }, 1000);

                        interactive(kode_grade,id_pelajaran,id_week,week);
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

        $('#saveResponse_canvas').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/save_response_canvas') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                    
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        // $('#modal_tlm_add_lmp').modal('hide');
                        kode_grade = $("#kode_grade").val();
                        id_pelajaran = $("#id_pelajaran").val();
                        id_week = $("#id_week").val();
                        week = $("#minggu").val();
                        name_interactive = $("#name_interactive").val();
                        state_interactive = $("#state_interactive").val();

                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes Save', 'SUCCESS');
                        }, 1000);

                        interactive(kode_grade,id_pelajaran,id_week,week);
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

        $('#saveResponse').submit(function(e) {
            e.preventDefault();
            var dataString = $("#saveResponse").serialize();
            var data_form = JSON.stringify(dataString);

            $.ajax({
                type:'POST',
                url: "{{ url('/save_response') }}",
                data: {data:data_form},
                dataType  : "JSON",
                beforeSend: function(){
                    $('#submit-saveResponse').hide();
                    $('#spinner-saveResponse').show();
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        // $('#modal_tlm_add_lmp').modal('hide');
                        kode_grade = $("#kode_grade").val();
                        id_pelajaran = $("#id_pelajaran").val();
                        id_week = $("#id_week").val();
                        week = $("#minggu").val();
                        name_interactive = $("#name_interactive").val();
                        state_interactive = $("#state_interactive").val();

                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes save your answers', 'SUCCESS');
                        }, 1000);

                        interactive(kode_grade,id_pelajaran,id_week,week);
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
                complete: function() {
                    $('#submit-saveResponse').show();
                    $('#spinner-saveResponse').hide();                      
                },
                error: function(data){
                    console.log(data);
                }
            });
        });

        $('#update_appraisal').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ url('/update_appraisal') }}",
                data: formData,
                dataType: 'json',
                cache:false,
                contentType: false,
                processData: false,
                beforeSend: function(){
                },
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        // $('#modal_tlm_add_lmp').modal('hide');
                        kode_grade = $("#kode_grade").val();
                        id_pelajaran = $("#id_pelajaran").val();
                        id_week = $("#id_week").val();
                        minggu = $("#minggu").val();
                        id_interactive = $("#id_interactive").val();
                        name_interactive = $("#name_interactive").val();
                        state_interactive = $("#state_interactive").val();
                        type = $("#type").val();
                        id_appraisal = $("#id_appraisal").val();
                        idResponse = $("#idResponse").val();
                        username = $("#username").val();

                        setTimeout(function() {
                            toastr.options = {
                                closeButton: true,
                                progressBar: true,
                                showMethod: 'slideDown',
                                timeOut: 4000
                            };
                            toastr.info('Succes update appraisal', 'SUCCESS');
                        }, 1000);

                        if(type=='General'){
                            show_appraisal_general(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username);
                        }else if(type=='Upload'){
                            show_appraisal_upload(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username);
                        }else if(type=='Canvas'){
                            show_appraisal_canvas(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username);
                        }
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






    function show_mdl_semester(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/ganti_smt') }}",
            data: {_token:_token},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    // console.log(data.option)
                    $('#id_ganti_smt').html(data.option);
                    $('#modal_ganti_semester').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
        
    }

    function ganti_semester(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var kd_smt_active = $('#id_ganti_smt').val();

        var sel = document.getElementById("id_ganti_smt");
        var smt_active= sel.options[sel.selectedIndex].text;

        $.ajax({
            type:'POST',
            url: "{{ url('/ganti_smt2') }}",
            data: {_token:_token,kd_smt_active:kd_smt_active,smt_active:smt_active},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    // location.reload();
                    window.location = "{{ url('/dashboard') }}";
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
        
    }

    function add_week(kode_grade,pelajaran){
        $('#pelajaran_week').val(pelajaran);
        $('#kode_grade_week').val(kode_grade);
        $('#modal_add_week').modal('show');
    }

    function insert_week(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var pelajaran = $('#pelajaran_week').val();
        var kode_grade = $('#kode_grade_week').val();
        var minggu = $('#id_minggu').val();
        var tgl_awal = $('#tgl_awal').val();
        var tgl_akhir = $('#tgl_akhir').val();
        $.ajax({
            type:'POST',
            url: "{{ url('/insert_week') }}",
            data: {_token:_token,pelajaran:pelajaran,minggu:minggu,tgl_awal:tgl_awal,tgl_akhir:tgl_akhir},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    show_week(kode_grade,pelajaran)
                    $('#modal_add_week').modal('hide');
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.info('Succes add week', 'SUCCESS');
                    }, 1000);
                    // location.reload();
                    // window.location = "{{ url('/dashboard') }}";
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
    }

    function save_edit_week(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var pelajaran = $('#pelajaran_edit_week').val();
        var kode_grade = $('#kode_grade_edit_week').val();
        var id_week = $('#id_week_edit_week').val();
        var tgl_awal = $('#tgl_awal_edit_week').val();
        var tgl_akhir = $('#tgl_akhir_edit_week').val();
        $.ajax({
            type:'POST',
            url: "{{ url('/save_edit_week') }}",
            data: {_token:_token,id_week:id_week,tgl_awal:tgl_awal,tgl_akhir:tgl_akhir},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    show_week(kode_grade,pelajaran)
                    $('#modal_edit_week').modal('hide');
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.info('Succes edit date', 'SUCCESS');
                    }, 1000);
                    // location.reload();
                    // window.location = "{{ url('/dashboard') }}";
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
    }

    function show_week(kode_grade,id_pelajaran){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_week') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                    $('#div_discuss').remove();
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function change_state_week(kode_grade,id_pelajaran,id_week,state){
        swal({
            title: "Are want to "+state+"?",
            // text: "Your will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, "+state+"!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: true,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/change_state_week') }}",
                    data: {_token:_token,id_week:id_week,state:state},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            show_week(kode_grade,id_pelajaran)
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.info('Succes change state', 'SUCCESS');
                            }, 1000);
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your Interactive is safe :)", "error");
            }
        });
    }

    function edit_date_week(kode_grade,pelajaran,id_week,tgl_awal,tgl_akhir){
        $('#pelajaran_edit_week').val(pelajaran);
        $('#kode_grade_edit_week').val(kode_grade);
        $('#id_week_edit_week').val(id_week);
        $('#tgl_awal_edit_week').val(tgl_awal);
        $('#tgl_akhir_edit_week').val(tgl_akhir);
        $('#modal_edit_week').modal('show');
    }

    function matpel_week(kode_grade,id_pelajaran,id_week,minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/matpel_week') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                    $('#div_discuss').remove();
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function matpel_week_tlm(kode_grade,id_pelajaran,id_week,minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/matpel_week_tlm') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                    $('#div_discuss').remove();
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function interactive(kode_grade,id_pelajaran,id_week,minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                    $('#div_discuss').remove();
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function menu_tlm_detail(kode_grade,id_pelajaran,id_week,minggu,id_detail){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/matpel_tlm_detail') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_detail:id_detail},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function edit_topic(kode_grade,id_pelajaran,id_week,week,kolom){
        if(kolom=='activities'){
            title = 'Activities Week '+week;
        }else if (kolom=='assignment'){
            title = 'Assignment / Project Week '+week;
        }else if (kolom=='homework'){
            title = 'Homework Week '+week;
        }else if (kolom=='formative'){
            title = 'Formative Week '+week;
        }else if (kolom=='memo'){
            title = 'Edit Approval Week '+week;
        }else if (kolom=='topic'){
            title = 'Topik Pembelajaran Week '+week;
        }else if (kolom=='alokasi_waktu'){
            title = 'Alokasi Waktu Week '+week;
        }else if (kolom=='kompetensi_inti'){
            title = 'Kompetensi Inti Week '+week;
        }else if (kolom=='teknik_pembelajaran'){
            title = 'Teknik Pembelajaran Week '+week;
        }else if (kolom=='refleksi'){
            title = 'Refleksi Week '+week;
        }else if (kolom=='sumber_alat'){
            title = 'Sumber Belajar dan Alat Bantu Pengajaran Week '+week;
        }else if (kolom=='aims'){
            title = 'Aims Week '+week;
        }
        
        $("#title_topic").html(title);
        data = $('#'+kolom).html();
        $("#mdl_edit_topic").code(data);
        $("#mdl_tpc_kode_grade").val(kode_grade);
        $("#mdl_tpc_id_pelajaran").val(id_pelajaran);
        $("#mdl_tpc_id_week").val(id_week);
        $("#mdl_tpc_week").val(week);
        $("#mdl_tpc_kolom").val(kolom);
        $('#modal_edit_topic').modal('show');
    }

    function edit_topic_alokasi_waktu(kode_grade,id_pelajaran,id_week,week,kolom,data){
        if(kolom=='activities'){
            title = 'Activities Week '+week;
        }else if (kolom=='assignment'){
            title = 'Assignment / Project Week '+week;
        }else if (kolom=='homework'){
            title = 'Homework Week '+week;
        }else if (kolom=='formative'){
            title = 'Formative Week '+week;
        }else if (kolom=='memo'){
            title = 'Edit Approval Week '+week;
        }else if (kolom=='topic'){
            title = 'Topik Pembelajaran Week '+week;
        }else if (kolom=='alokasi_waktu'){
            title = 'Alokasi Waktu Week '+week;
        }else if (kolom=='kompetensi_inti'){
            title = 'Kompetensi Inti Week '+week;
        }else if (kolom=='teknik_pembelajaran'){
            title = 'Teknik Pembelajaran Week '+week;
        }else if (kolom=='refleksi'){
            title = 'Refleksi Week '+week;
        }else if (kolom=='sumber_alat'){
            title = 'Sumber Belajar dan Alat Bantu Pengajaran Week '+week;
        }else if (kolom=='aims'){
            title = 'Aims Week '+week;
        }
        
        $("#title_topic_aw").html(title);
        // data = $('#'+kolom).html();
        $("#mdl_edit_topic_aw").val(data);
        $("#mdl_tpc_aw_kode_grade").val(kode_grade);
        $("#mdl_tpc_aw_id_pelajaran").val(id_pelajaran);
        $("#mdl_tpc_aw_id_week").val(id_week);
        $("#mdl_tpc_aw_week").val(week);
        $("#mdl_tpc_aw_kolom").val(kolom);
        $('#modal_edit_topic_aw').modal('show');
    }

    function edit_topic_selection(kode_grade,id_pelajaran,id_week,week,kolom,id_selection){
        
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/week_topic_selection') }}",
            data: {_token:_token,kolom:kolom,id_selection:id_selection},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    // console.log(data.option)
                    // $('#id_ganti_smt').html(data.option);
                    // $('#modal_ganti_semester').modal('show');

                    if(kolom=='mode_delivery'){
                        title = 'Mode of delivery Week '+week;
                    }else if (kolom=='outcomes'){
                        title = 'Outcomes Week '+week;
                    }else if (kolom=='learning_type'){
                        title = 'Learning Type Week '+week;
                    }
                    
                    $("#title_topic_selection").html(title);
                    $('#id_topic_selection').html(data.option);
                    $("#mdl_tpc_selection_kode_grade").val(kode_grade);
                    $("#mdl_tpc_selection_id_pelajaran").val(id_pelajaran);
                    $("#mdl_tpc_selection_id_week").val(id_week);
                    $("#mdl_tpc_selection_week").val(week);
                    $("#mdl_tpc_selection_kolom").val(kolom);
                    $('#modal_edit_topic_selection').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });

        
    }


    function edit_topic2(kode_grade,id_pelajaran,id_week,week,kolom){
        if(kolom=='activities'){
            title = 'Activities Week '+week;
        }else if (kolom=='assignment'){
            title = 'Assignment / Project Week '+week;
        }else if (kolom=='homework'){
            title = 'Homework Week '+week;
        }else if (kolom=='formative'){
            title = 'Formative Week '+week;
        }else if (kolom=='memo'){
            title = 'Edit Approval Week '+week;
        }else if (kolom=='kompetensi_indikator'){
            title = 'Kompetensi Dasar dan Indikator Week '+week;
        }
        // alert(title);
        $("#title_topic2").html(title);
        data = $('#'+kolom).html();
        $("#mdl_edit_topic2").code(data);
        $("#mdl_tpc2_kode_grade").val(kode_grade);
        $("#mdl_tpc2_id_pelajaran").val(id_pelajaran);
        $("#mdl_tpc2_id_week").val(id_week);
        $("#mdl_tpc2_week").val(week);
        $("#mdl_tpc2_kolom").val(kolom);
        $('#modal_edit_topic2').modal('show');
    }

    function update_topic(){
        data_topic = $("#mdl_edit_topic").code();
        kode_grade = $("#mdl_tpc_kode_grade").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran").val();
        id_week = $("#mdl_tpc_id_week").val();
        week = $("#mdl_tpc_week").val();
        kolom = $("#mdl_tpc_kolom").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic') }}",
            data: {_token:_token,id_week:id_week,kolom:kolom,data_topic:data_topic},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function update_topic_aw(){
        data_topic = $("#mdl_edit_topic_aw").val();
        kode_grade = $("#mdl_tpc_aw_kode_grade").val();
        id_pelajaran = $("#mdl_tpc_aw_id_pelajaran").val();
        id_week = $("#mdl_tpc_aw_id_week").val();
        week = $("#mdl_tpc_aw_week").val();
        kolom = $("#mdl_tpc_aw_kolom").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic') }}",
            data: {_token:_token,id_week:id_week,kolom:kolom,data_topic:data_topic},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_aw').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function update_topic_selection(){
        data_topic = $("#id_topic_selection").val();
        kode_grade = $("#mdl_tpc_selection_kode_grade").val();
        id_pelajaran = $("#mdl_tpc_selection_id_pelajaran").val();
        id_week = $("#mdl_tpc_selection_id_week").val();
        week = $("#mdl_tpc_selection_week").val();
        kolom = $("#mdl_tpc_selection_kolom").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic') }}",
            data: {_token:_token,id_week:id_week,kolom:kolom,data_topic:data_topic},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_selection').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function topic_kd_indikator(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Kompetensi Dasar dan Indikator Week '+week;
        $("#title_topic_kd_indikator").html(title);

        $("#mdl_topic_id_kd_indikator").val('');
        $("#mdl_topic_kompetensi_dasar").code('');
        $("#mdl_topic_indikator").code('');
        
        $("#mdl_tpc_kode_grade_kd_indikator").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_kd_indikator").val(id_pelajaran);
        $("#mdl_tpc_id_week_kd_indikator").val(id_week);
        $("#mdl_tpc_week_kd_indikator").val(week);
        $("#mdl_tpc_kolom_kd_indikator").val(kolom);
        $("#mdl_tpc_act_kd_indikator").val('tambah');
        $('#modal_edit_topic_kd_indikator').modal('show');
    }

    function upd_kd_indikator(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_kd_indikator') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Kompetensi Dasar dan Indikator Week '+week;
                    $("#title_topic_kd_indikator").html(title);
                    $("#mdl_topic_id_kd_indikator").val(id);

                    $("#mdl_topic_kompetensi_dasar").code(data.kompetensi_dasar);
                    $("#mdl_topic_indikator").code(data.indikator);
                        
                    $("#mdl_tpc_kode_grade_kd_indikator").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_kd_indikator").val(id_pelajaran);
                    $("#mdl_tpc_id_week_kd_indikator").val(id_week);
                    $("#mdl_tpc_week_kd_indikator").val(week);
                    $("#mdl_tpc_kolom_kd_indikator").val(kolom);
                    $("#mdl_tpc_act_kd_indikator").val('update');
                    $('#modal_edit_topic_kd_indikator').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function save_topic_kd_indikator(){
        kode_grade = $("#mdl_tpc_kode_grade_kd_indikator").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_kd_indikator").val();
        id_week = $("#mdl_tpc_id_week_kd_indikator").val();
        week = $("#mdl_tpc_week_kd_indikator").val();
        kolom = $("#mdl_tpc_kolom_kd_indikator").val();

        act = $("#mdl_tpc_act_kd_indikator").val();
        id = $("#mdl_topic_id_kd_indikator").val();
        kompetensi_dasar = $("#mdl_topic_kompetensi_dasar").code();
        indikator = $("#mdl_topic_indikator").code();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/save_topic_kd_indikator') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,kompetensi_dasar:kompetensi_dasar,indikator:indikator,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_kd_indikator').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_kd_indikator(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_kd_indikator') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function save_materi_pelajaran(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Materi Pelajaran Week '+week;
        $("#title_topic_mapel").html(title);
        
        $("#mdl_tpc_kode_grade_mapel").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_mapel").val(id_pelajaran);
        $("#mdl_tpc_id_week_mapel").val(id_week);
        $("#mdl_tpc_week_mapel").val(week);
        $("#mdl_tpc_kolom_mapel").val(kolom);
        $("#mdl_tpc_act_mapel").val('tambah');
        $("#mdl_topic_id_mapel").val('');
        $("#mdl_topic_materi_mapel").val('');
        $('#modal_edit_topic_mapel').modal('show');
    }

    function upd_materi_pelajaran(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_materi_pelajaran') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Materi Pelajaran Week '+week;
                    $("#title_topic_mapel").html(title);
        
                    $("#mdl_tpc_kode_grade_mapel").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_mapel").val(id_pelajaran);
                    $("#mdl_tpc_id_week_mapel").val(id_week);
                    $("#mdl_tpc_week_mapel").val(week);
                    $("#mdl_tpc_kolom_mapel").val(kolom);
                    $("#mdl_tpc_act_mapel").val('update');
                    $("#mdl_topic_id_mapel").val(id);
                    $("#mdl_topic_materi_mapel").val(data.materi);
                    $('#modal_edit_topic_mapel').modal('show');;
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function simpan_materi_pelajaran(){
        kode_grade = $("#mdl_tpc_kode_grade_mapel").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_mapel").val();
        console.log(id_pelajaran)
        id_week = $("#mdl_tpc_id_week_mapel").val();
        week = $("#mdl_tpc_week_mapel").val();
        kolom = $("#mdl_tpc_kolom_mapel").val();

        act = $("#mdl_tpc_act_mapel").val();
        id = $("#mdl_topic_id_mapel").val();
        materi = $("#mdl_topic_materi_mapel").val();
        if(materi==''){
            setTimeout(function() {
                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    showMethod: 'slideDown',
                    timeOut: 4000
                };
                toastr.error('Materi kosong', 'ERROR');
            }, 1000);
            return false;
        }

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/simpan_materi_pelajaran') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,materi:materi,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_mapel').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_materi_pelajaran(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_materi_pelajaran') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function save_langkah_pembelajaran(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Langkah Pembelajaran Week '+week;
        $("#title_topic_lb").html(title);
        
        $("#mdl_tpc_kode_grade_lb").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_lb").val(id_pelajaran);
        $("#mdl_tpc_id_week_lb").val(id_week);
        $("#mdl_tpc_week_lb").val(week);
        $("#mdl_tpc_kolom_lb").val(kolom);
        $("#mdl_tpc_act_lb").val('tambah');
        $("#mdl_topic_id_lb").val('');
        $("#mdl_topic_kegiatan_lb").code('');
        $("#mdl_topic_durasi_lb").val('');
        $("#mdl_topic_muatan_lb").code('');
        $('#modal_edit_topic_lb').modal('show');
    }

    function upd_langkah_pembelajaran(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_langkah_pembelajaran') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Langkah Pembelajaran Week '+week;
                    $("#title_topic_lb").html(title);
                    
                    $("#mdl_tpc_kode_grade_lb").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_lb").val(id_pelajaran);
                    $("#mdl_tpc_id_week_lb").val(id_week);
                    $("#mdl_tpc_week_lb").val(week);
                    $("#mdl_tpc_kolom_lb").val(kolom);
                    $("#mdl_tpc_act_lb").val('update');
                    $("#mdl_topic_id_lb").val(id);
                    $("#mdl_topic_kegiatan_lb").code(data.kegiatan);
                    $("#mdl_topic_durasi_lb").val(data.durasi);
                    $("#mdl_topic_muatan_lb").code(data.muatan);
                    $('#modal_edit_topic_lb').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function simpan_langkah_pembelajaran(){
        kode_grade = $("#mdl_tpc_kode_grade_lb").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_lb").val();
        id_week = $("#mdl_tpc_id_week_lb").val();
        week = $("#mdl_tpc_week_lb").val();
        kolom = $("#mdl_tpc_kolom_lb").val();

        act = $("#mdl_tpc_act_lb").val();
        id = $("#mdl_topic_id_lb").val();
        kegiatan = $("#mdl_topic_kegiatan_lb").code();
        durasi = $("#mdl_topic_durasi_lb").val();
        muatan = $("#mdl_topic_muatan_lb").code();
        // if(materi==''){
        //     setTimeout(function() {
        //         toastr.options = {
        //             closeButton: true,
        //             progressBar: true,
        //             showMethod: 'slideDown',
        //             timeOut: 4000
        //         };
        //         toastr.error('Materi kosong', 'ERROR');
        //     }, 1000);
        //     return false;
        // }

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/simpan_langkah_pembelajaran') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,kegiatan:kegiatan,durasi:durasi,muatan:muatan,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_lb').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_langkah_pembelajaran(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_langkah_pembelajaran') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function save_hasil_pembelajaran(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Panilaian Hasil Pembelajaran Week '+week;
        $("#title_topic_hp").html(title);
        
        $("#mdl_tpc_kode_grade_hp").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_hp").val(id_pelajaran);
        $("#mdl_tpc_id_week_hp").val(id_week);
        $("#mdl_tpc_week_hp").val(week);
        $("#mdl_tpc_kolom_hp").val(kolom);
        $("#mdl_tpc_act_hp").val('tambah');
        $("#mdl_topic_id_hp").val('');
        $("#mdl_topic_indikator_hp").code('');
        $("#mdl_topic_tehnik_hp").code('');
        $("#mdl_topic_bi_hp").code('');
        $("#mdl_topic_si_hp").code('');
        $('#modal_edit_topic_hp').modal('show');
    }

    function upd_hasil_pembelajaran(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_hasil_pembelajaran') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Panilaian Hasil Pembelajaran Week '+week;
                    $("#title_topic_hp").html(title);
                    
                    $("#mdl_tpc_kode_grade_hp").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_hp").val(id_pelajaran);
                    $("#mdl_tpc_id_week_hp").val(id_week);
                    $("#mdl_tpc_week_hp").val(week);
                    $("#mdl_tpc_kolom_hp").val(kolom);
                    $("#mdl_tpc_act_hp").val('update');
                    $("#mdl_topic_id_hp").val(id);

                    $("#mdl_topic_indikator_hp").code(data.indikator);
                    $("#mdl_topic_tehnik_hp").code(data.tehnik);
                    $("#mdl_topic_bi_hp").code(data.bentuk_instrumen);
                    $("#mdl_topic_si_hp").code(data.sampel_instrumen);
                    $('#modal_edit_topic_hp').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function simpan_hasil_pembelajaran(){
        kode_grade = $("#mdl_tpc_kode_grade_hp").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_hp").val();
        id_week = $("#mdl_tpc_id_week_hp").val();
        week = $("#mdl_tpc_week_hp").val();
        kolom = $("#mdl_tpc_kolom_hp").val();

        act = $("#mdl_tpc_act_hp").val();
        id = $("#mdl_topic_id_hp").val();
        indikator = $("#mdl_topic_indikator_hp").code();
        tehnik = $("#mdl_topic_tehnik_hp").code();
        bentuk_instrumen = $("#mdl_topic_bi_hp").code();
        sampel_instrumen = $("#mdl_topic_si_hp").code();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/simpan_hasil_pembelajaran') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,indikator:indikator,tehnik:tehnik,bentuk_instrumen:bentuk_instrumen,sampel_instrumen:sampel_instrumen,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_hp').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_hasil_pembelajaran(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_hasil_pembelajaran') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function save_rubrik_diskusi(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Rubrik Panilaian Penilaian Diskusi Week '+week;
        $("#title_topic_rd").html(title);
        
        $("#mdl_tpc_kode_grade_rd").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_rd").val(id_pelajaran);
        $("#mdl_tpc_id_week_rd").val(id_week);
        $("#mdl_tpc_week_rd").val(week);
        $("#mdl_tpc_kolom_rd").val(kolom);
        $("#mdl_tpc_act_rd").val('tambah');
        $("#mdl_topic_id_rd").val('');

        $("#mdl_topic_nm_siswa_rd").val('');
        $("#mdl_topic_keaktifan_rd").val('');
        $("#mdl_topic_kerjasama_rd").val('');
        $("#mdl_topic_presentasi_rd").val('');
        $("#mdl_topic_bertanya_rd").val('');
        $("#mdl_topic_menjawab_rd").val('');
        $("#mdl_topic_jml_skor_rd").val('');

        $('#modal_edit_topic_rd').modal('show');
    }

    function upd_rubrik_diskusi(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_rubrik_diskusi') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Rubrik Panilaian Penilaian Diskusi Week '+week;
                    $("#title_topic_rd").html(title);
                    
                    $("#mdl_tpc_kode_grade_rd").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_rd").val(id_pelajaran);
                    $("#mdl_tpc_id_week_rd").val(id_week);
                    $("#mdl_tpc_week_rd").val(week);
                    $("#mdl_tpc_kolom_rd").val(kolom);
                    $("#mdl_tpc_act_rd").val('update');
                    $("#mdl_topic_id_rd").val(id);

                    $("#mdl_topic_nm_siswa_rd").val(data.nm_siswa);
                    $("#mdl_topic_keaktifan_rd").val(data.keaktifan);
                    $("#mdl_topic_kerjasama_rd").val(data.kerjasama);
                    $("#mdl_topic_presentasi_rd").val(data.presentasi);
                    $("#mdl_topic_bertanya_rd").val(data.bertanya);
                    $("#mdl_topic_menjawab_rd").val(data.menjawab);
                    $("#mdl_topic_jml_skor_rd").val(data.jml_skor);

                    $('#modal_edit_topic_rd').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function simpan_rubrik_diskusi(){
        kode_grade = $("#mdl_tpc_kode_grade_rd").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_rd").val();
        id_week = $("#mdl_tpc_id_week_rd").val();
        week = $("#mdl_tpc_week_rd").val();
        kolom = $("#mdl_tpc_kolom_rd").val();

        act = $("#mdl_tpc_act_rd").val();
        id = $("#mdl_topic_id_rd").val();

        nm_siswa = $("#mdl_topic_nm_siswa_rd").val();
        keaktifan = $("#mdl_topic_keaktifan_rd").val();
        kerjasama = $("#mdl_topic_kerjasama_rd").val();
        presentasi = $("#mdl_topic_presentasi_rd").val();
        bertanya = $("#mdl_topic_bertanya_rd").val();
        menjawab = $("#mdl_topic_menjawab_rd").val();
        jml_skor = $("#mdl_topic_jml_skor_rd").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/simpan_rubrik_diskusi') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,nm_siswa:nm_siswa,keaktifan:keaktifan,kerjasama:kerjasama,presentasi:presentasi,bertanya:bertanya,menjawab:menjawab,jml_skor:jml_skor,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_rd').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_rubrik_diskusi(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_rubrik_diskusi') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function save_rubrik_tugas(kode_grade,id_pelajaran,id_week,week,kolom){
        
        title = 'Rubrik Panilaian Penilaian Tugas Week '+week;
        $("#title_topic_rt").html(title);
        
        $("#mdl_tpc_kode_grade_rt").val(kode_grade);
        $("#mdl_tpc_id_pelajaran_rt").val(id_pelajaran);
        $("#mdl_tpc_id_week_rt").val(id_week);
        $("#mdl_tpc_week_rt").val(week);
        $("#mdl_tpc_kolom_rt").val(kolom);
        $("#mdl_tpc_act_rt").val('tambah');
        $("#mdl_topic_id_rt").val('');

        $("#mdl_topic_nm_siswa_rt").val('');
        $("#mdl_topic_ketepatan_rt").val('');
        $("#mdl_topic_skala_rt").val('');
        $("#mdl_topic_kerapihan_rt").val('');
        $("#mdl_topic_simbol_rt").val('');
        $("#mdl_topic_jml_skor_rt").val('');

        $('#modal_edit_topic_rt').modal('show');
    }

    function upd_rubrik_tugas(kode_grade,id_pelajaran,id_week,week,kolom,id){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_rubrik_tugas') }}",
            data: {_token:_token,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Rubrik Panilaian Penilaian Tugas Week '+week;
                    $("#title_topic_rd").html(title);
                    
                    $("#mdl_tpc_kode_grade_rt").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_rt").val(id_pelajaran);
                    $("#mdl_tpc_id_week_rt").val(id_week);
                    $("#mdl_tpc_week_rt").val(week);
                    $("#mdl_tpc_kolom_rt").val(kolom);
                    $("#mdl_tpc_act_rt").val('update');
                    $("#mdl_topic_id_rt").val(id);

                    $("#mdl_topic_nm_siswa_rt").val(data.nm_siswa);
                    $("#mdl_topic_ketepatan_rt").val(data.ketepatan);
                    $("#mdl_topic_skala_rt").val(data.skala);
                    $("#mdl_topic_kerapihan_rt").val(data.kerapihan);
                    $("#mdl_topic_simbol_rt").val(data.simbol);
                    $("#mdl_topic_jml_skor_rt").val(data.jml_skor);

                    $('#modal_edit_topic_rt').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function simpan_rubrik_tugas(){
        kode_grade = $("#mdl_tpc_kode_grade_rt").val();
        id_pelajaran = $("#mdl_tpc_id_pelajaran_rt").val();
        id_week = $("#mdl_tpc_id_week_rt").val();
        week = $("#mdl_tpc_week_rt").val();
        kolom = $("#mdl_tpc_kolom_rt").val();

        act = $("#mdl_tpc_act_rt").val();
        id = $("#mdl_topic_id_rt").val();

        nm_siswa = $("#mdl_topic_nm_siswa_rt").val();
        ketepatan = $("#mdl_topic_ketepatan_rt").val();
        skala = $("#mdl_topic_skala_rt").val();
        kerapihan = $("#mdl_topic_kerapihan_rt").val();
        simbol = $("#mdl_topic_simbol_rt").val();
        jml_skor = $("#mdl_topic_jml_skor_rt").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/simpan_rubrik_tugas') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id:id,nm_siswa:nm_siswa,ketepatan:ketepatan,skala:skala,kerapihan:kerapihan,simbol:simbol,jml_skor:jml_skor,act:act},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_rt').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_rubrik_tugas(kode_grade,id_pelajaran,id_week,week,id){
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_rubrik_tugas') }}",
                    data: {_token:_token,id:id},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function delete_outcomes(kode_grade,id_pelajaran,id_week,week,week_outcomes){
        var _token  = $('meta[name="csrf-token"]').attr('content');
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_outcomes') }}",
                    data: {_token:_token,id_pelajaran:id_pelajaran,id_week:id_week,week_outcomes:week_outcomes},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });  
    }

    function save_outcomes(kode_grade,id_pelajaran,id_week,week,kolom){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_mst_outcomes') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    // matpel_week(kode_grade,id_pelajaran,id_week,week)
                    title = 'Outcomes Week '+week;
                    $("#title_ot").html(title);
                    
                    $("#mdl_ot_kode_grade").val(kode_grade);
                    $("#mdl_ot_id_pelajaran").val(id_pelajaran);
                    $("#mdl_ot_id_week").val(id_week);
                    $("#mdl_ot_week").val(week);
                    $("#mdl_ot_kolom").val(kolom);
                    $("#id_parent_outcomes").html(data.option);

                    $('#modal_edit_ot').modal('show');
                }
            },
            error: function(data){
                console.log(data);
            }
        });   
    }

    function get_child_outcomes(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var id_parent_outcomes = $("#id_parent_outcomes").val()
        $.ajax({
            type:'POST',
            url: "{{ url('/get_mst_child_outcomes') }}",
            data: {_token:_token,id_parent_outcomes:id_parent_outcomes},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    $('#child_outcomes').html(data.option);
                }
            },
            error: function(data){
                console.log(data);
            }
        });   
    }


    function save_rubrik(kode_grade,id_pelajaran,id_week,week,kolom){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $('#id_mst_rubrik').html('');
        $('#child_rubrik').html('');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_mst_rubrik') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    // matpel_week(kode_grade,id_pelajaran,id_week,week)
                    title = 'Rubrik Penilaian Week '+week;
                    $("#title_topic_rb").html(title);
                    
                    $("#mdl_tpc_kode_grade_rb").val(kode_grade);
                    $("#mdl_tpc_id_pelajaran_rb").val(id_pelajaran);
                    $("#mdl_tpc_id_week_rb").val(id_week);
                    $("#mdl_tpc_week_rb").val(week);
                    $("#mdl_tpc_kolom_rb").val(kolom);
                    $("#mdl_tpc_act_rb").val('tambah');
                    $("#mdl_topic_id_rb").val('');

                    $('#id_mst_rubrik').html(data.option);

                    $('#modal_edit_topic_rb').modal('show');
                }
            },
            error: function(data){
                console.log(data);
            }
        });   
    }

    function get_child_rubrik(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var id_mst_rubrik = $("#id_mst_rubrik").val()
        $.ajax({
            type:'POST',
            url: "{{ url('/get_mst_child_rubrik') }}",
            data: {_token:_token,id_mst_rubrik:id_mst_rubrik},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    $('#child_rubrik').html(data.input);
                }
            },
            error: function(data){
                console.log(data);
            }
        });   
    }

    function delete_rubrik(kode_grade,id_pelajaran,id_week,week,week_rubrik){
        var _token  = $('meta[name="csrf-token"]').attr('content');
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
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/delete_rubrik') }}",
                    data: {_token:_token,id_pelajaran:id_pelajaran,id_week:id_week,week_rubrik:week_rubrik},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            matpel_week(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });  
    }

    function upd_rubrik(kode_grade,id_pelajaran,id_week,week,id,id_mwb,nm_rb){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_upd_rubrik') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,id_mwb:id_mwb,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){

                    title = 'Ubah Rubrik Penilaian '+nm_rb+' Week '+week;
                    $("#title_topic_upd_rd").html(title);
                    
                    $("#mdl_tpc_upd_kode_grade_rb").val(kode_grade);
                    $("#mdl_tpc_upd_id_pelajaran_rb").val(id_pelajaran);
                    $("#mdl_tpc_upd_id_week_rb").val(id_week);
                    $("#mdl_tpc_upd_week_rb").val(week);
                    $("#mdl_tpc_upd_act_rb").val('update');
                    $("#mdl_topic_upd_id_rb").val(id_mwb);

                    $('#child_upd_rb').html(data.input);

                    $('#modal_edit_upd_topic_rb').modal('show');
                }
                
            },
            error: function(data){
                console.log(data);
            }
        });
    }

























    function update_topic2(){
        data_topic = $("#mdl_edit_topic2").code();
        kode_grade = $("#mdl_tpc2_kode_grade").val();
        id_pelajaran = $("#mdl_tpc2_id_pelajaran").val();
        id_week = $("#mdl_tpc2_id_week").val();
        week = $("#mdl_tpc2_week").val();
        kolom = $("#mdl_tpc2_kolom").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic') }}",
            data: {_token:_token,id_week:id_week,kolom:kolom,data_topic:data_topic},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic2').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });

        // $('#modal_edit_topic').modal('show');
    }

    function edit_topic_approve(kode_grade,id_pelajaran,id_week,week,cek_approve,kolom){
        // alert('dddd')
        if(kolom=='activities'){
            title = 'Activities Week '+week;
        }else if (kolom=='assignment'){
            title = 'Assignment / Project Week '+week;
        }else if (kolom=='homework'){
            title = 'Homework Week '+week;
        }else if (kolom=='formative'){
            title = 'Formative Week '+week;
        }else if (kolom=='memo'){
            title = 'Edit Approval Week '+week;
        }
        
        $("#title_topic_approve").html(title);
        data = $('#'+kolom).html();
        $("#mdl_edit_approve_topic").code(data);
        $("#mdl_tpc_approve_kode_grade").val(kode_grade);
        $("#mdl_tpc_approve_id_pelajaran").val(id_pelajaran);
        $("#mdl_tpc_approve_id_week").val(id_week);
        $("#mdl_tpc_approve_week").val(week);
        $("#mdl_tpc_approve_kolom").val(kolom);

        if(cek_approve == 'checked'){
            $("#topic_check_approve").prop("checked", true);
        }else{
            $("#topic_check_approve").prop("checked", false);
        }

        $('#modal_edit_topic_approve').modal('show');
    }

    function update_topic_approve(){
        data_topic = $("#mdl_edit_approve_topic").code();
        kode_grade = $("#mdl_tpc_approve_kode_grade").val();
        id_pelajaran = $("#mdl_tpc_approve_id_pelajaran").val();
        id_week = $("#mdl_tpc_approve_id_week").val();
        week = $("#mdl_tpc_approve_week").val();
        kolom = $("#mdl_tpc_approve_kolom").val();
        check = document.getElementById("topic_check_approve");
        if (check.checked == true){
            approve = true;
        } else {
            approve = false;
        }

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic_approve') }}",
            data: {_token:_token,id_week:id_week,kolom:kolom,data_topic:data_topic,approve:approve},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_approve').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function edit_topic_date(kode_grade,id_pelajaran,id_week,week,date_from,date_to){
        title = 'Timeline Week '+week;
        
        $("#title_topic_date").html(title);
        // data = $('#'+kolom).html();
        $("#mdl_edit_date_topic_date_from").val(date_from);
        $("#mdl_edit_date_topic_date_to").val(date_to);
        $("#mdl_tpc_date_kode_grade").val(kode_grade);
        $("#mdl_tpc_date_id_pelajaran").val(id_pelajaran);
        $("#mdl_tpc_date_id_week").val(id_week);
        $("#mdl_tpc_date_week").val(week);
        $('#modal_edit_topic_date').modal('show');
    }

    function update_topic_date(){
        date_from = $("#mdl_edit_date_topic_date_from").val();
        date_to = $("#mdl_edit_date_topic_date_to").val();
        kode_grade = $("#mdl_tpc_date_kode_grade").val();
        id_pelajaran = $("#mdl_tpc_date_id_pelajaran").val();
        id_week = $("#mdl_tpc_date_id_week").val();
        week = $("#mdl_tpc_date_week").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_topic_date') }}",
            data: {_token:_token,id_week:id_week,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_topic_date').modal('hide');
                    matpel_week(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });

        // $('#modal_edit_topic').modal('show');
    }

    function add_tlm(kode_grade,id_pelajaran,id_week,week){
        title = 'Teaching Learning Material Week '+week;
        
        $("#title_add_tlm").html(title);
        // data = $('#'+kolom).html();
        $("#mdl_add_tlm_kode_grade").val(kode_grade);
        $("#mdl_add_tlm_id_pelajaran").val(id_pelajaran);
        $("#mdl_add_tlm_id_week").val(id_week);
        $("#mdl_add_tlm_week").val(week);
        $('#modal_add_tlm').modal('show');
    }

    function insert_tlm(){
        judul = $("#mdl_add_tlm_judul").val();
        isi = $("#mdl_add_tlm_isi").code();
        kode_grade = $("#mdl_add_tlm_kode_grade").val();
        id_pelajaran = $("#mdl_add_tlm_id_pelajaran").val();
        id_week = $("#mdl_add_tlm_id_week").val();
        week = $("#mdl_add_tlm_week").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/insert_tlm') }}",
            data: {_token:_token,id_week:id_week,id_pelajaran:id_pelajaran,judul:judul,isi:isi},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_add_tlm').modal('hide');
                    matpel_week_tlm(kode_grade,id_pelajaran,id_week,week)
                }
            },
            error: function(data){
                console.log(data);
            }
        });

        // $('#modal_edit_topic').modal('show');
    }

    function edit_tlm_isi(kode_grade,id_pelajaran,id_week,week,id_tlm){
        title = $("#judul").html();
        $("#title_tlm_isi").html(title);

        data = $('#isi').html();
        $("#mdl_tlm_isi_isi").code(data);

        $("#mdl_tlm_isi_kode_grade").val(kode_grade);
        $("#mdl_tlm_isi_id_pelajaran").val(id_pelajaran);
        $("#mdl_tlm_isi_id_week").val(id_week);
        $("#mdl_tlm_isi_week").val(week);
        $("#mdl_tlm_isi_id_tlm").val(id_tlm);
        $('#modal_edit_tlm_isi').modal('show');
    }

    function update_tlm_isi(){
        isi = $("#mdl_tlm_isi_isi").code();
        kode_grade = $("#mdl_tlm_isi_kode_grade").val();
        id_pelajaran = $("#mdl_tlm_isi_id_pelajaran").val();
        id_week = $("#mdl_tlm_isi_id_week").val();
        week = $("#mdl_tlm_isi_week").val();
        id_tlm = $("#mdl_tlm_isi_id_tlm").val();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_tlm_isi') }}",
            data: {_token:_token,id_tlm:id_tlm,isi:isi},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_tlm_isi').modal('hide');
                    menu_tlm_detail(kode_grade,id_pelajaran,id_week,week,id_tlm)
                }
            },
            error: function(data){
                console.log(data);
            }
        });

    }

    function edit_approve_tlm(kode_grade,id_pelajaran,id_week,week,cek_approve,id_tlm){
        // alert('dddd')
        title = $("#judul").html();
        $("#title_tlm_approve").html(title);

        data = $('#memo').html();
        $("#mdl_tlm_approve_memo").code(data);

        $("#mdl_tlm_approve_kode_grade").val(kode_grade);
        $("#mdl_tlm_approve_id_pelajaran").val(id_pelajaran);
        $("#mdl_tlm_approve_id_week").val(id_week);
        $("#mdl_tlm_approve_week").val(week);
        $("#mdl_tlm_approve_id_tlm").val(id_tlm);

        if(cek_approve == 'checked'){
            $("#topic_check_tlm_approve").prop("checked", true);
        }else{
            $("#topic_check_tlm_approve").prop("checked", false);
        }

        $('#modal_edit_tlm_approve').modal('show');
    }

    function update_tlm_approve(){
        memo = $("#mdl_tlm_approve_memo").code();
        kode_grade = $("#mdl_tlm_approve_kode_grade").val();
        id_pelajaran = $("#mdl_tlm_approve_id_pelajaran").val();
        id_week = $("#mdl_tlm_approve_id_week").val();
        week = $("#mdl_tlm_approve_week").val();
        id_tlm = $("#mdl_tlm_approve_id_tlm").val();
        check = document.getElementById("topic_check_tlm_approve");
        if (check.checked == true){
            approve = true;
        } else {
            approve = false;
        }

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/update_tlm_approve') }}",
            data: {_token:_token,id_tlm:id_tlm,memo:memo,approve:approve},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_tlm_approve').modal('hide');
                    menu_tlm_detail(kode_grade,id_pelajaran,id_week,week,id_tlm)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_tlm_slide_lmp(kode_grade,id_pelajaran,id_week,week,id_tlm){
        // alert('dddd')

        $("#mdl_add_file_tlm_slide").val('');
        title = $("#judul").html();
        $("#title_tlm_add_lmp").html(title);

        $("#mdl_tlm_add_lmp_kode_grade").val(kode_grade);
        $("#mdl_tlm_add_lmp_id_pelajaran").val(id_pelajaran);
        $("#mdl_tlm_add_lmp_id_week").val(id_week);
        $("#mdl_tlm_add_lmp_week").val(week);
        $("#mdl_tlm_add_lmp_id_tlm").val(id_tlm);

        $('#modal_tlm_add_lmp').modal('show');
    }

    function show_tlm_slide_lmp(kode_grade,id_pelajaran,id_week,minggu,id_detail,id_lmp){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_tlm_slide_lmp') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_detail:id_detail,id_lmp:id_lmp},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function delete_tlm_slide(kode_grade,id_pelajaran,id_week,minggu,id_tlm,id_lmp,tipe){
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
                delete_tlm_slide2(kode_grade,id_pelajaran,id_week,minggu,id_tlm,id_lmp,tipe)
            } else {
                swal("Cancelled", "Your file is safe :)", "error");
            }
        });
    }

    function delete_tlm_slide2(kode_grade,id_pelajaran,id_week,minggu,id_tlm,id_lmp,tipe){

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/delete_tlm_slide') }}",
            data: {_token:_token,id_lmp:id_lmp,tipe:tipe},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    menu_tlm_detail(kode_grade,id_pelajaran,id_week,minggu,id_tlm)
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_interactive(kode_grade,id_pelajaran,id_week,week){
        $("#mdl_add_int_name").val('');
        $("#mdl_add_int_type").val('');
        $("#mdl_add_int_file").val('');
        $("#mdl_add_int_category").val('');
        $("#mdl_add_int_date_from").val('');
        $("#mdl_add_int_date_to").val('');
        $('#id_mdl_add_int_file').hide();

        title = 'Interactive Week '+week;
        
        $("#title_add_int").html(title);
        // data = $('#'+kolom).html();
        $("#mdl_add_int_kode_grade").val(kode_grade);
        $("#mdl_add_int_id_pelajaran").val(id_pelajaran);
        $("#mdl_add_int_id_week").val(id_week);
        $("#mdl_add_int_week").val(week);
        $('#modal_add_int').modal('show');
    }

    function show_file_int(){
        var type_int = $('#mdl_add_int_type').val()
        if(type_int=='Upload'){
            $('#id_mdl_add_int_file').show();
            $('#id_mdl_add_int_canvas').hide();
        }else if(type_int=='Canvas'){
            $('#id_mdl_add_int_file').hide();
            $('#id_mdl_add_int_canvas').show();
        }else if(type_int=='General'){
            $('#id_mdl_add_int_file').hide();
             $('#id_mdl_add_int_canvas').hide();
        }
    }

    function unpublish_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive){
        swal({
            title: "Are want to Unpublish?",
            // text: "Your will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, Unpublish!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: true,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
                var _token  = $('meta[name="csrf-token"]').attr('content');
                var state = 'Draft';
                $.ajax({
                    type:'POST',
                    url: "{{ url('/interactive_ubah_state') }}",
                    data: {_token:_token,id_interactive:id_interactive,state:state},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            interactive(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your Interactive is safe :)", "error");
            }
        });
    }

    function publish_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive){
        swal({
            title: "Are want to Publish?",
            // text: "Your will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, Publish!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: true,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
                var _token  = $('meta[name="csrf-token"]').attr('content');
                var state = 'Publish';
                $.ajax({
                    type:'POST',
                    url: "{{ url('/interactive_ubah_state') }}",
                    data: {_token:_token,id_interactive:id_interactive,state:state},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            interactive(kode_grade,id_pelajaran,id_week,week)
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your Interactive is safe :)", "error");
            }
        });
    }

    function edit_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,state,interactive_name,type,category,date_form,date_to){
        // console.log('ssss')
        // console.log(state)
        if(state=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            $("#mdl_edit_int_name").val(interactive_name);
            $('#mdl_edit_int_type [value='+type+']').attr('selected', 'true');
            $("#mdl_edit_int_file").val('');
            $('#mdl_edit_int_category [value='+category+']').attr('selected', 'true');
            $("#mdl_edit_int_date_from").val(date_form);
            $("#mdl_edit_int_date_to").val(date_to);
            $("#mdl_edit_int_id").val(id_interactive);
            // $('#id_mdl_edit_int_file').hide();

            title = 'Edit : '+interactive_name;
            
            $("#title_edit_int").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_edit_int_kode_grade").val(kode_grade);
            $("#mdl_edit_int_id_pelajaran").val(id_pelajaran);
            $("#mdl_edit_int_id_week").val(id_week);
            $("#mdl_edit_int_week").val(week);
            $('#modal_edit_int').modal('show');
        }
        
    }

    function show_file_edit_int(){
        var type_int = $('#mdl_edit_int_type').val()
        if(type_int=='Upload'){
            $('#id_mdl_edit_int_file').show();
            $('#id_mdl_edit_int_canvas').hide();
        }else if(type_int=='Canvas'){
            $('#id_mdl_edit_int_file').hide();
            $('#id_mdl_edit_int_canvas').show();
        }else if(type_int=='General'){
            $('#id_mdl_edit_int_file').hide();
             $('#id_mdl_edit_int_canvas').hide();
        }
    }

    function delete_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name,state){
        if(state=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            swal({
                title: "Are want to Delete "+name+" ?",
                // text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: true,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    var _token  = $('meta[name="csrf-token"]').attr('content');
                    $.ajax({
                        type:'POST',
                        url: "{{ url('/del_interactive') }}",
                        data: {_token:_token,id_interactive:id_interactive},
                        dataType: 'json',
                        success: (data) => {
                            if(data.respon == 'SUKSES'){
                                interactive(kode_grade,id_pelajaran,id_week,week)
                                setTimeout(function() {
                                    toastr.options = {
                                        closeButton: true,
                                        progressBar: true,
                                        showMethod: 'slideDown',
                                        timeOut: 4000
                                    };
                                    toastr.info('Succes Delete interactive', 'SUCCESS');
                                }, 1000);
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                } else {
                    swal("Cancelled", "Your Interactive is safe :)", "error");
                }
            });
        }
    }

    function show_file_interactive(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,file_upload){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_file_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,file_upload:file_upload},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_canvas_interactive(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,file_upload){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_canvas_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,file_upload:file_upload},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_question_interactive(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_question_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_appraisal(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_appraisal') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,type:type},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_appraisal_general(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_response_appraisal_general') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,type:type,idResponse:idResponse,username:username,id_appraisal:id_appraisal},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_appraisal_upload(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_response_appraisal_upload') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,type:type,idResponse:idResponse,username:username,id_appraisal:id_appraisal},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_appraisal_canvas(kode_grade,id_pelajaran,id_week,minggu,id_interactive,name_interactive,state_interactive,type,id_appraisal,idResponse,username){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_response_appraisal_canvas') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,type:type,idResponse:idResponse,username:username,id_appraisal:id_appraisal},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            $("#mdl_add_qt_int_name_question").val('');

            title = name_interactive;
            
            $("#title_add_qt_int").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_add_qt_int_kode_grade").val(kode_grade);
            $("#mdl_add_qt_int_id_pelajaran").val(id_pelajaran);
            $("#mdl_add_qt_int_id_week").val(id_week);
            $("#mdl_add_qt_int_week").val(week);
            $("#mdl_add_qt_int_id_interactive").val(id_interactive);
            $("#mdl_add_qt_int_name_interactive").val(name_interactive);
            $("#mdl_add_qt_int_state_interactive").val(state_interactive);
            $('#modal_add_qt_int').modal('show');
        }
    }

    function edit_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id,name_question,type,required){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            $("#mdl_edit_qt_int_name_question").val(name_question);
            $('#mdl_edit_qt_int_type [value='+type+']').attr('selected', 'true');
            $('#mdl_edit_qt_int_required [value='+required+']').attr('selected', 'true');

            title = name_interactive;
            
            $("#title_edit_qt_int").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_edit_qt_int_kode_grade").val(kode_grade);
            $("#mdl_edit_qt_int_id_pelajaran").val(id_pelajaran);
            $("#mdl_edit_qt_int_id_week").val(id_week);
            $("#mdl_edit_qt_int_week").val(week);
            $("#mdl_edit_qt_int_id_interactive").val(id_interactive);
            $("#mdl_edit_qt_int_name_interactive").val(name_interactive);
            $("#mdl_edit_qt_int_state_interactive").val(state_interactive);
            $("#mdl_edit_qt_int_id").val(id);
            $('#modal_edit_qt_int').modal('show');
        }
    }

    function up_sort_question(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,sort){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{ 
            var _token  = $('meta[name="csrf-token"]').attr('content');
            var new_sort = (parseInt(sort)+parseInt(1));
            $.ajax({
                type:'POST',
                url: "{{ url('/update_sort_question') }}",
                data: {_token:_token,id_question:id_question,new_sort:new_sort},
                dataType: 'json',
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        }
    }

    function down_sort_question(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,sort){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{ 
            var _token  = $('meta[name="csrf-token"]').attr('content');
            var new_sort = (parseInt(sort)-parseInt(1));
            if(new_sort<=1){
                new_sort=1;
            }
            $.ajax({
                type:'POST',
                url: "{{ url('/update_sort_question') }}",
                data: {_token:_token,id_question:id_question,new_sort:new_sort},
                dataType: 'json',
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        }
    }

    function hide_state_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{ 
            var _token  = $('meta[name="csrf-token"]').attr('content');
            var state = 'Hide';
            $.ajax({
                type:'POST',
                url: "{{ url('/update_state_question') }}",
                data: {_token:_token,id_question:id_question,state:state},
                dataType: 'json',
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        }
    }

    function show_state_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{ 
            var _token  = $('meta[name="csrf-token"]').attr('content');
            var state = 'Show';
            $.ajax({
                type:'POST',
                url: "{{ url('/update_state_question') }}",
                data: {_token:_token,id_question:id_question,state:state},
                dataType: 'json',
                success: (data) => {
                    if(data.respon == 'SUKSES'){
                        show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            });
        }
    }

    function delete_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{ 
            swal({
                title: "Are want to Delete?",
                // text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: true,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    var _token  = $('meta[name="csrf-token"]').attr('content');
                    $.ajax({
                        type:'POST',
                        url: "{{ url('/delete_question') }}",
                        data: {_token:_token,id_question:id_question},
                        dataType: 'json',
                        success: (data) => {
                            if(data.respon == 'SUKSES'){
                                show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                                setTimeout(function() {
                                    toastr.options = {
                                        closeButton: true,
                                        progressBar: true,
                                        showMethod: 'slideDown',
                                        timeOut: 4000
                                    };
                                    toastr.info('Succes Delete Question', 'SUCCESS');
                                }, 1000);
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                } else {
                    swal("Cancelled", "Your Interactive is safe :)", "error");
                }
            });
        }
    }


    function add_answers(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            // $("#mdl_add_ans_name_answer").val('');

            title = 'Add answer';
            
            $("#title_add_ans").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_add_ans_kode_grade").val(kode_grade);
            $("#mdl_add_ans_id_pelajaran").val(id_pelajaran);
            $("#mdl_add_ans_id_week").val(id_week);
            $("#mdl_add_ans_week").val(week);
            $("#mdl_add_ans_id_interactive").val(id_interactive);
            $("#mdl_add_ans_name_interactive").val(name_interactive);
            $("#mdl_add_ans_state_interactive").val(state_interactive);
            $("#mdl_add_ans_id_question").val(id_question);
            $('#modal_add_ans').modal('show');
        }
    }

    function edit_answers(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,id_answer,name_answer,true_answer,skor){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            $("#mdl_edit_ans_name_answer").val(name_answer);
            $('#mdl_edit_ans_true [value='+true_answer+']').attr('selected', 'true');
            $("#mdl_edit_ans_skor").val(skor);

            title = 'Edit answer';
            
            $("#title_edit_ans").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_edit_ans_kode_grade").val(kode_grade);
            $("#mdl_edit_ans_id_pelajaran").val(id_pelajaran);
            $("#mdl_edit_ans_id_week").val(id_week);
            $("#mdl_edit_ans_week").val(week);
            $("#mdl_edit_ans_id_interactive").val(id_interactive);
            $("#mdl_edit_ans_name_interactive").val(name_interactive);
            $("#mdl_edit_ans_state_interactive").val(state_interactive);
            $("#mdl_edit_ans_id_question").val(id_question);
            $("#mdl_edit_ans_id_answer").val(id_answer);
            $('#modal_edit_ans').modal('show');
        }
    }

    function del_answers(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,id_answer){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            swal({
                title: "Are want to Delete?",
                // text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: true,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    var _token  = $('meta[name="csrf-token"]').attr('content');
                    $.ajax({
                        type:'POST',
                        url: "{{ url('/delete_answer') }}",
                        data: {_token:_token,id_answer:id_answer},
                        dataType: 'json',
                        success: (data) => {
                            if(data.respon == 'SUKSES'){
                                show_question_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive);
                                setTimeout(function() {
                                    toastr.options = {
                                        closeButton: true,
                                        progressBar: true,
                                        showMethod: 'slideDown',
                                        timeOut: 4000
                                    };
                                    toastr.info('Succes Delete Answer', 'SUCCESS');
                                }, 1000);
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                } else {
                    swal("Cancelled", "Your Answer is safe :)", "error");
                }
            });
        }
    }

    function response_interactive_upload(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/response_interactive_upload') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function response_interactive_canvas(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/response_interactive_canvas') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function response_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/response_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_answers_text(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            // $("#mdl_add_ans_name_answer").val('');

            title = 'Add answer';
            
            $("#title_add_text_ans").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_add_text_ans_kode_grade").val(kode_grade);
            $("#mdl_add_text_ans_id_pelajaran").val(id_pelajaran);
            $("#mdl_add_text_ans_id_week").val(id_week);
            $("#mdl_add_text_ans_week").val(week);
            $("#mdl_add_text_ans_id_interactive").val(id_interactive);
            $("#mdl_add_text_ans_name_interactive").val(name_interactive);
            $("#mdl_add_text_ans_state_interactive").val(state_interactive);
            $("#mdl_add_text_ans_id_question").val(id_question);
            $('#modal_add_text_ans').modal('show');
        }
    }

    function edit_answers_text(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,id_answer,name_answer,true_answer,skor){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            $("#mdl_edit_ans_text_name_answer").val(name_answer);
            $("#mdl_edit_ans_text_skor").val(skor);

            title = 'Edit answer';
            
            $("#title_edit_ans_text").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_edit_ans_text_kode_grade").val(kode_grade);
            $("#mdl_edit_ans_text_id_pelajaran").val(id_pelajaran);
            $("#mdl_edit_ans_text_id_week").val(id_week);
            $("#mdl_edit_ans_text_week").val(week);
            $("#mdl_edit_ans_text_id_interactive").val(id_interactive);
            $("#mdl_edit_ans_text_name_interactive").val(name_interactive);
            $("#mdl_edit_ans_text_state_interactive").val(state_interactive);
            $("#mdl_edit_ans_text_id_question").val(id_question);
            $("#mdl_edit_ans_text_id_answer").val(id_answer);
            $('#modal_edit_ans_text').modal('show');
        }
    }

    function add_answers_matching(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{
            // $("#mdl_add_ans_name_answer").val('');

            title = 'Add question and answer matching';
            
            $("#title_add_matching_ans").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_add_matching_ans_kode_grade").val(kode_grade);
            $("#mdl_add_matching_ans_id_pelajaran").val(id_pelajaran);
            $("#mdl_add_matching_ans_id_week").val(id_week);
            $("#mdl_add_matching_ans_week").val(week);
            $("#mdl_add_matching_ans_id_interactive").val(id_interactive);
            $("#mdl_add_matching_ans_name_interactive").val(name_interactive);
            $("#mdl_add_matching_ans_state_interactive").val(state_interactive);
            $("#mdl_add_matching_ans_id_question").val(id_question);
            $('#modal_add_matching_ans').modal('show');
        }
    }

    function edit_answers_matching(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,id_question,id_answer,question_matching,name_answer,true_answer,skor){
        if(state_interactive=='Publish'){
            swal("Cancelled", "Interactive is publish", "error");
        }else{

            title = 'Edit answer matching';
            
            $("#title_edit_matching_ans").html(title);
            // data = $('#'+kolom).html();
            $("#mdl_edit_matching_ans_kode_grade").val(kode_grade);
            $("#mdl_edit_matching_ans_id_pelajaran").val(id_pelajaran);
            $("#mdl_edit_matching_ans_id_week").val(id_week);
            $("#mdl_edit_matching_ans_week").val(week);
            $("#mdl_edit_matching_ans_id_interactive").val(id_interactive);
            $("#mdl_edit_matching_ans_name_interactive").val(name_interactive);
            $("#mdl_edit_matching_ans_state_interactive").val(state_interactive);
            $("#mdl_edit_matching_ans_id_question").val(id_question);
            $("#mdl_edit_matching_ans_id_answer").val(id_answer);
            $("#mdl_edit_matching_ans_question_matching").val(question_matching);
            $("#mdl_edit_matching_ans_name_answer").val(name_answer);
            $("#mdl_edit_matching_ans_skor").val(skor);
            $('#modal_edit_matching_ans').modal('show');
        }
    }

    function show_file_response_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_file_response_interactive_upload') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_canvas_response_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_canvas_response_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_response_interactive(kode_grade,id_pelajaran,id_week,week,id_interactive,name_interactive,state_interactive,date_from,
        date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_response_interactive') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran,id_week:id_week,week:week,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_tlm_int(minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_tlm_int') }}",
            data: {_token:_token,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_tlm(minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_tlm') }}",
            data: {_token:_token,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_tlm_detail(minggu,id){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_tlm_Detail') }}",
            data: {_token:_token,minggu:minggu,id:id},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_show_tlm_slide_lmp(id_detail,id_lmp,minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_Show_tlm_slide_lmp') }}",
            data: {_token:_token,id_detail:id_detail,id_lmp:id_lmp,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_int(minggu){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_int') }}",
            data: {_token:_token,minggu:minggu},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_show_file_interactive(minggu,id,file_upload,name){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_show_file_interactive') }}",
            data: {_token:_token,minggu:minggu,id:id,file_upload:file_upload,name:name},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_show_file_response_interactive(minggu,id,state,name){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_show_file_response_interactive') }}",
            data: {_token:_token,minggu:minggu,id:id,state:state,name:name},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_response_interactive_canvas(minggu,id_interactive,name_interactive,state_interactive){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_response_interactive_canvas') }}",
            data: {_token:_token,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_show_canvas_response_interactive(minggu,id_interactive,name_interactive,state_interactive){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_show_canvas_response_interactive') }}",
            data: {_token:_token,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_response_interactive(minggu,id_interactive,name_interactive,state_interactive,date_from,date_to){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_response_interactive') }}",
            data: {_token:_token,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive,date_from:date_from,date_to:date_to},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function parent_show_response_interactive(minggu,id_interactive,name_interactive,state_interactive){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/parent_show_response_interactive') }}",
            data: {_token:_token,minggu:minggu,id_interactive:id_interactive,name_interactive:name_interactive,state_interactive:state_interactive},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_tlm").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function get_discuss(kode_grade,id_pelajaran){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_list_discuss') }}",
            data: {_token:_token,kode_grade:kode_grade,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_discuss").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_discuss(kode_grade,id_pelajaran){
        $("#mdl_add_discuss_kode_grade").val(kode_grade);
        $("#mdl_add_discuss_id_pelajaran").val(id_pelajaran);
        $("#mdl_add_discuss_judul").val('');
        $('#modal_add_discuss').modal('show');
    }

    function save_discuss(){
        kode_grade = $("#mdl_add_discuss_kode_grade").val();
        id_pelajaran = $("#mdl_add_discuss_id_pelajaran").val();
        judul = $("#mdl_add_discuss_judul").val();
        ditutup = $('#mdl_add_discuss_ditutup').val();
        isi = $("#mdl_add_discuss_isi").code();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/save_discuss') }}",
            data: {_token:_token,id_pelajaran:id_pelajaran,judul:judul,ditutup:ditutup,isi:isi},
            dataType: 'json',
            beforeSend: function(){
                if (judul=='' || judul==null){
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.error('Topic Title is empty!', 'ERROR');
                    }, 1000);
                    return false;
                }
                $('#submit-modal_add_discuss').hide();
                $('#spinner-modal_add_discuss').show();
            },
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_add_discuss').modal('hide');
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.info('Succes Add Topic Discuss', 'SUCCESS');
                    }, 1000);
                    get_discuss(kode_grade,id_pelajaran)
                }
            },
            complete: function() {
                $('#submit-modal_add_discuss').show();
                $('#spinner-modal_add_discuss').hide();                      
            },
            error: function(data){
                console.log(data);
            }
        });

        // $('#modal_edit_topic').modal('show');
    }

    function edit_discuss(kode_grade,id_pelajaran,id,judul,isi,ditutup){
        // console.log(isi)
        // console.log(state)
        $("#mdl_edit_discuss_id").val(id);
        $("#mdl_edit_discuss_kode_grade").val(kode_grade);
        $("#mdl_edit_discuss_id_pelajaran").val(id_pelajaran);
        $("#mdl_edit_discuss_judul").val(judul);
        $("#mdl_edit_discuss_isi").code(isi);
        $("#mdl_edit_discuss_ditutup").val(ditutup);
        $('#modal_edit_discuss').modal('show');
        
    }

    function save_edit_discuss(){
        id = $("#mdl_edit_discuss_id").val();
        kode_grade = $("#mdl_edit_discuss_kode_grade").val();
        id_pelajaran = $("#mdl_edit_discuss_id_pelajaran").val();
        judul = $("#mdl_edit_discuss_judul").val();
        ditutup = $('#mdl_edit_discuss_ditutup').val();
        isi = $("#mdl_edit_discuss_isi").code();

        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/save_edit_discuss') }}",
            data: {_token:_token,id:id,judul:judul,ditutup:ditutup,isi:isi},
            dataType: 'json',
            beforeSend: function(){
                if (judul=='' || judul==null){
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.error('Topic Title is empty!', 'ERROR');
                    }, 1000);
                    return false;
                }
                $('#submit-modal_edit_discuss').hide();
                $('#spinner-modal_edit_discuss').show();
            },
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $('#modal_edit_discuss').modal('hide');
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.info('Succes Edit Topic Discuss', 'SUCCESS');
                    }, 1000);
                    get_discuss(kode_grade,id_pelajaran)
                }
            },
            complete: function() {
                $('#submit-modal_edit_discuss').show();
                $('#spinner-modal_edit_discuss').hide();                      
            },
            error: function(data){
                console.log(data);
            }
        });

        // $('#modal_edit_topic').modal('show');
    }

    function delete_discuss(kode_grade,id_pelajaran,id,judul){
        swal({
                title: "Are want to Delete "+judul+" ?",
                // text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: true,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    var _token  = $('meta[name="csrf-token"]').attr('content');
                    $.ajax({
                        type:'POST',
                        url: "{{ url('/del_discuss') }}",
                        data: {_token:_token,id:id},
                        dataType: 'json',
                        success: (data) => {
                            if(data.respon == 'SUKSES'){
                                get_discuss(kode_grade,id_pelajaran)
                                setTimeout(function() {
                                    toastr.options = {
                                        closeButton: true,
                                        progressBar: true,
                                        showMethod: 'slideDown',
                                        timeOut: 4000
                                    };
                                    toastr.info('Succes Delete Discuss', 'SUCCESS');
                                }, 1000);
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                } else {
                    swal("Cancelled", "Your Discuss is safe :)", "error");
                }
            });
    }

    function comment_discuss(kode_grade,id_pelajaran,id){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_comment_discuss') }}",
            data: {_token:_token,id:id,kode_grade:kode_grade,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_discuss").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function send_comment(kode_grade,id_pelajaran,id){
        c_discuss = $("#comment_discuss").val();
        if (event.keyCode === 13 && comment_discuss != '') {
                // $("#GFG_Button").click();
                // alert(comment_discuss)
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/send_comment') }}",
                    data: {_token:_token,id:id,c_discuss:c_discuss},
                    dataType: 'json',
                    success: (data) => {
                        // alert(data.respon)
                        if(data.respon == 'SUKSES'){
                            comment_discuss(kode_grade,id_pelajaran,id)
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.info('Succes Add Comment', 'SUCCESS');
                            }, 1000);
                            $("#comment_discuss").val(null);
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
                
        }
    }

    function reply_comment(kode_grade,id_pelajaran,id_discuss,id_comment){
        reply_comment_discuss = $("#reply_comment_discuss_"+id_comment).val();
        if (event.keyCode === 13 && comment_discuss != '') {
                // $("#GFG_Button").click();
                // alert(reply_comment_discuss+' vvvv')
                
                var _token  = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    type:'POST',
                    url: "{{ url('/reply_comment') }}",
                    data: {_token:_token,id_discuss:id_discuss,id_comment:id_comment,reply_comment_discuss:reply_comment_discuss},
                    dataType: 'json',
                    success: (data) => {
                        // alert(data.respon)
                        if(data.respon == 'SUKSES'){
                            comment_discuss(kode_grade,id_pelajaran,id_discuss)
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.info('Succes Add Comment', 'SUCCESS');
                            }, 1000);
                            $("#reply_comment_discuss_"+id_comment).val(null);
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
                
        }
    }

    function delete_comment(kode_grade,id_pelajaran,id_discuss,id_comment){
        swal({
                title: "Are want to Delete ?",
                // text: "Your will not be able to recover this imaginary file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Delete!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: true,
                closeOnCancel: false },
            function (isConfirm) {
                if (isConfirm) {
                    var _token  = $('meta[name="csrf-token"]').attr('content');
                    $.ajax({
                        type:'POST',
                        url: "{{ url('/del_comment') }}",
                        data: {_token:_token,id_comment:id_comment},
                        dataType: 'json',
                        success: (data) => {
                            if(data.respon == 'SUKSES'){
                                comment_discuss(kode_grade,id_pelajaran,id_discuss)
                                setTimeout(function() {
                                    toastr.options = {
                                        closeButton: true,
                                        progressBar: true,
                                        showMethod: 'slideDown',
                                        timeOut: 4000
                                    };
                                    toastr.info('Succes Delete Comment', 'SUCCESS');
                                }, 1000);
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                } else {
                    swal("Cancelled", "Your Comment is safe :)", "error");
                }
            });
    }

    function get_discuss_parent(){
        id_pelajaran = $("#subject_discuss").val();
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_list_discuss_parent') }}",
            data: {_token:_token,id_pelajaran:id_pelajaran},
            dataType: 'json',
            beforeSend: function(){
                if (id_pelajaran=='' || id_pelajaran==null){
                    setTimeout(function() {
                        toastr.options = {
                            closeButton: true,
                            progressBar: true,
                            showMethod: 'slideDown',
                            timeOut: 4000
                        };
                        toastr.error('Subjects must be selected!', 'ERROR');
                    }, 1000);
                    return false;
                }
            },
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_discuss_parent").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function comment_discuss_parent(id_pelajaran,id){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/get_comment_discuss_parent') }}",
            data: {_token:_token,id:id,id_pelajaran:id_pelajaran},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#div_discuss_parent").html(data.div);
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function show_bukom(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_bukom') }}",
            data: {_token:_token},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#wrapper_div").html(data.div);
                    $('#button_div').remove();
                    $('body>.tooltip').remove();
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function add_bukom(){
        $('#modal_add_bukom').modal('show');
    }

    function detail_bukom(id_bukom){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type:'POST',
            url: "{{ url('/show_detail_bukom') }}",
            data: {_token:_token,id_bukom:id_bukom},
            dataType: 'json',
            success: (data) => {
                if(data.respon == 'SUKSES'){
                    $("#wrapper_div").html(data.div);
                    $('#button_div').remove();
                    $('body>.tooltip').remove();
                }else{
                    swal("Cancelled", data.msg, "error");
                }
            },
            error: function(data){
                console.log(data);
            }
        });
    }

    function send_bukom(id_bukom){
        swal({
            title: "Are want to send?",
            // text: "Your will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, Send!",
            cancelButtonText: "No, cancel!",
            closeOnConfirm: true,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
                var _token  = $('meta[name="csrf-token"]').attr('content');
                var status = 'Send';
                $.ajax({
                    type:'POST',
                    url: "{{ url('/send_bukom') }}",
                    data: {_token:_token,id_bukom:id_bukom,status:status},
                    dataType: 'json',
                    success: (data) => {
                        if(data.respon == 'SUKSES'){
                            detail_bukom(id_bukom)
                            setTimeout(function() {
                                toastr.options = {
                                    closeButton: true,
                                    progressBar: true,
                                    showMethod: 'slideDown',
                                    timeOut: 4000
                                };
                                toastr.info('Succes Send Bukom', 'SUCCESS');
                            }, 1000);
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            } else {
                swal("Cancelled", "Your Bukom is safe :)", "error");
            }
        });
    }

    function reply_bukom($id_bukom,$subyek){
        $('#mdl_reply_bukom_id_bukom').val($id_bukom);
        $('#mdl_reply_bukom_subyek').html('Subject : '+$subyek);
        $('#modal_reply_bukom').modal('show');
    }
</script>


