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

    <link href="{!! asset('inspinia/css/plugins/blueimp/css/blueimp-gallery.min.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/summernote/summernote.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/css/plugins/summernote/summernote-bs3.css') !!}" rel="stylesheet">

    <!-- Toastr style -->
    <link href="{!! asset('inspinia/css/plugins/toastr/toastr.min.css') !!}" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="{!! asset('inspinia/css/plugins/sweetalert/sweetalert.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/chosen/chosen.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/datapicker/datepicker3.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/daterangepicker/daterangepicker-bs3.css') !!}" rel="stylesheet">

    <!-- Data Tables -->
    <link href="{!! asset('inspinia/css/plugins/dataTables/dataTables.bootstrap.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/css/plugins/dataTables/dataTables.responsive.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/css/plugins/dataTables/dataTables.tableTools.min.css') !!}" rel="stylesheet">

    <!-- timeline -->
    <link href="{!! asset('other/css/timeline.css') !!}" rel="stylesheet">

    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <style type="text/css">
        .nav > li.active {
            border-left: 4px solid #1f1d8c !important;
        }
        .nav-header {
            background: url("{{ asset('inspinia/css/patterns/header-profile-skin-1.png') }}") !important;
        }

        .note-editor {
            background-color: white !important;
        }

        .inmodal .modal-icon {
            font-size: 52px !important;
        }
    </style>


</head>

<body>

<div id="wrapper">
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> 
                    <span>
                        <img alt="image" class="img-circle" src="{!! asset('image/user.jpg') !!}" width="75" height="75"/>
                    </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><?php echo Session::get('nm_level'); ?></strong>
                            </span> <span class="text-muted text-xs block" style="color: aliceblue;"><?php echo Session::get('nama_lengkap'); ?><b class="caret"></b>
                            </span> 
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="{{ url('/Profile') }}">Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="{{ url('/logout') }}">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    MEC
                </div>
            </li>
            <!-- <li class="active"> -->
            <li id="menu_dashboard">
                <a href="{{ url('/dashboard') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Home</span></a>
            </li>
            <?php echo $menu2; ?>

            <!-- sdm -->
            <!-- admin -->
            <!-- <li>
                <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">Graphs</span><span class="fa arrow"></span></a>
            </li> -->

            <!-- <li>
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">Graphs</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="graph_flot.html">Flot Charts</a></li>
                    <li><a href="graph_morris.html">Morris.js Charts</a></li>
                    <li><a href="graph_rickshaw.html">Rickshaw Charts</a></li>
                    <li><a href="graph_chartjs.html">Chart.js</a></li>
                    <li><a href="graph_chartist.html">Chartist</a></li>
                    <li><a href="graph_peity.html">Peity Charts</a></li>
                    <li><a href="graph_sparkline.html">Sparkline Charts</a></li>
                </ul>
            </li> -->
        </ul>

    </div>
</nav>

<div id="page-wrapper" class="gray-bg">
<div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-success " href="#"><i class="fa fa-bars"></i> </a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <!-- <li>
                <span class="m-r-sm text-muted welcome-message"><?php echo Session::get('smt_active'); ?></span>
            </li> -->
            <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <?php echo Session::get('smt_active'); ?>
                    </a>
                    <ul class="dropdown-menu dropdown-messages" style="width: 117px !important;">
                        <li>
                            <!-- <div class="dropdown-messages-box">
                                <div class="media-body">
                                    Ganti Semester 
                                </div>
                            </div> -->
                            <button class="btn btn-success btn-xs dropdown-toggle" onclick="show_mdl_semester()">Ganti Semester</button>
                        </li>
                    </ul>
                </li>
            <li>
                <a href="{{ url('/logout') }}">
                    <i class="fa fa-sign-out"></i> Log out
                </a>
            </li>
        </ul>

    </nav>
</div>

