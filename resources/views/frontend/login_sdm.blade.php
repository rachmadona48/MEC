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

<!-- <body class="gray-bg"> -->
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

                <!-- <div class="col-md-6">
                    <div class="item active">
                        <center><img alt="image" style="width: 80%" class="img-responsive" src="{!! asset('image/logo.jpg') !!}"></center>
                    </div>
                </div> -->

                <div class="col-md-12">
                    <div class="item active">
                        <center><img alt="image" style="width: 10%" class="img-responsive" src="{!! asset('image/logo.jpg') !!}"></center>
                        <center><h3 class="font-bold">Teacher Login</h3></center>
                    </div>
                </div>

                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div role="form">
                        <!-- <div class="form-group" style="font-family: system-ui;font-size: x-large;">
                            <center>Teacher Login</center>
                        </div> -->
                        <div class="form-group">
                            <input type="text" id="username" class="form-control required" placeholder="Finger print" style="border-radius: 10px;">
                            <input type="hidden" id="_token" value="{{Session::token()}}">
                        </div>
                        
                        <div class="form-group">
                            <input type="password" id="password" class="form-control required" placeholder="Password" style="border-radius: 10px;">
                        </div>
                        <div id="id_alert" class="alert alert-warning" style="padding: 7px !important;display: none;"></div>
                        <button class="btn btn-success block full-width m-b" style="border-radius: 10px;" onclick="login()">Login</button>
                        <!-- <button class="btn btn-danger block full-width m-b" onclick="login()">Login With Google</button> -->
                        <!-- <a href="{{ url('google') }}" class="btn btn-danger block full-width m-b">
                            Login with @madania.sch.id
                        </a> -->
                    </div>
                    
                    <p class="m-t">
                        <small class="pull-right"><a href="{{ url('/awal') }}"> Madania-Extended-Class &copy; 2021<a/></small>
                    </p>
                </div>
                <div class="col-md-3"></div>
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
    </script>

</body>

</html>
