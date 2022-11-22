<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shorcut icon" href="{!! asset('image/logo.jpg') !!}">
    <title>MEC</title>

    <link href="{!! asset('inspinia/css/bootstrap.min.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/font-awesome/css/font-awesome.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/animate.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/css/style.css') !!}" rel="stylesheet">


</head>

<body style="
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  opacity: 1;
  /* background-image: url({!! asset('image/background.png') !!}); */
  background-color: #ebedf7;
  background-position: 50% 0;
  background-size: cover;">

    <div class="loginColumns animated fadeInDown" style="max-width: 50%;">
        <div class="ibox-content" style="border-color: #1c5273;opacity: 0.95;border-radius: 30px;border-style: solid;">
            <div class="row">

                <!-- <div class="col-md-4">
                    <div class="item active">
                        <center><img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/logo.jpg') !!}"></center>
                    </div>
                </div> -->
                <div class="col-md-12">
                    <div class="item active">
                        <center><img alt="image" style="width: 10%" class="img-responsive" src="{!! asset('image/logo.jpg') !!}"></center>
                        <center><h3 class="font-bold">Sign in to Madania Extended Class Room</h3></center>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="m-t" role="form" style="margin-top: 40px;">
                        <center>
                            <div class="col-md-4">
                                <button class="btn btn-success dim btn-large-dim btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="Login Teacher/Staff" style="width: 130px;height: 130px;font-size: 70px;border-radius: 30px;" onclick="login_sdm()">
                                    <img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/teacher.png') !!}">
                                </button>
                                <h3 class="font-bold">Teacher</h3>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-success dim btn-large-dim btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="Login Student" style="width: 130px;height: 130px;font-size: 70px;border-radius: 30px;" onclick="login_student()">
                                    <img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/student.png') !!}">
                                </button>
                                <h3 class="font-bold">Student</h3>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-success dim btn-large-dim btn-outline" type="button" data-toggle="tooltip" data-placement="top" title="Login Parent" style="width: 130px;height: 130px;font-size: 70px;border-radius: 30px;" onclick="login_parent()">
                                    <img alt="image" style="width: 100%" class="img-responsive" src="{!! asset('image/parent.png') !!}">
                                </button>
                                <h3 class="font-bold">Parent</h3>
                            </div>
                        </center>
                    </div>
                    
                    <p class="m-t">
                        <small class="pull-right">Madania-Extended-Class &copy; 2021</small>
                    </p>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </div>
    <div class="footer" style="position: fixed;">
        <div class="pull-right">
            <strong>A True</strong> Indonesian School For The Leaders.
        </div>
        <div>
            <a href="{{ url('/awal') }}"><strong>Copyright</strong> MEC &copy; 2021<a/>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="{!! asset('inspinia/js/jquery-2.1.1.js') !!}"></script>
    <script type="text/javascript">

        function login() {
            var username = $('#username').val();
            var password = $('#password').val();
            if (username==''){
                $('#id_alert').html('Username is empty!');
                $('#id_alert').show();
            }else if (password==''){
                $('#id_alert').html('Password is empty!');
                $('#id_alert').show();
            }else{
                $('#id_alert').hide();
                var _token = $('#_token').val();
                $.ajax({
                    type: 'POST',
                    url: "{{ url('/cek_login') }}",
                    type: "post",
                    data: {_token:_token,username:username,password:password},
                    dataType: 'json',
                    beforeSend: function(){
                    },
                    success: function(data) 
                    {
                        if(data.respon == 'SUKSES'){
                            window.location = "{{ url('/dashboard') }}";
                        }else{
                            $('#id_alert').html(data.msg);
                            $('#id_alert').show();
                        }
                    }           
                });
            }

        }

        function login_sdm() {
            window.location = "{{ url('/login_sdm') }}";

        }

        function login_student() {
            window.location = "{{ url('/login_student') }}";

        }

        function login_parent() {
            window.location = "{{ url('/login_parent') }}";

        }
    </script>

</body>

</html>
