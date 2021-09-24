<div class="wrapper wrapper-content animated fadeInRight" id="wrapper_div">
    <div class="ibox-title">
        <h5>Bukom</h5>
        <div class="ibox-tools">
            <button class="btn btn-success btn-xs" onclick="add_bukom()">Add Bukom</button>
            <a href="{{url('/dashboard')}}">
                <button class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title data-original-title="Back to home"><< Back</button>
            </a>
        </div>
    </div>
    <div class="ibox-content">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover" id="table_bukom">
            <thead>
                <tr>
                    <th width="10%"><center>Status</center></th>
                    <th width="20%">From</th>
                    <th width="50%">Subject</th>
                    <th width="20%"><center>Date</center></th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>
</div>


<script>
    $(document).ready(function() {
        table_bukom()
    });

    function table_bukom(){
        var _token  = $('meta[name="csrf-token"]').attr('content');
        var dataTable = $('#table_bukom').DataTable({
            "scrollX": false,
            "responsive": false,
            // "processing": true,
            "serverSide": false,
            "PaginationType": "full_numbers",
            "language": {
              "processing": "<div></div><div></div><div></div><div></div><div></div>"
            },
            "ajax":{
                    url: "{{ url('/list_bukom') }}",
                    type: "post",  // method  , by default get
                    // drawCallback: function( settings ) {
                      
                    // },
                    data : function(d){
                        // d.bulan = bulan;
                        d._token = _token;
                    },
                    beforeSend: function(){
                        // $("#editable_processing").css("display","none");
                    },
                    error: function(){  // error handling
                        $(".table_bukom-error").html("");
                        $("#table_bukom").append('<tbody class="table_bukom-error"><tr><th colspan="4"><center>Tidak Ada Data</center></th></tr></tbody>');
                        $("#table_bukom_processing").css("display","none");
                    }

            }
            
        });
    }

    
</script>