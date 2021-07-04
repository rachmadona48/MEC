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

    <link href="{!! asset('inspinia/css/plugins/summernote/summernote.css') !!}" rel="stylesheet">
    <link href="{!! asset('inspinia/css/plugins/summernote/summernote-bs3.css') !!}" rel="stylesheet">

    <!-- Toastr style -->
    <link href="{!! asset('inspinia/css/plugins/toastr/toastr.min.css') !!}" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="{!! asset('inspinia/css/plugins/sweetalert/sweetalert.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/chosen/chosen.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/datapicker/datepicker3.css') !!}" rel="stylesheet">

    <link href="{!! asset('inspinia/css/plugins/daterangepicker/daterangepicker-bs3.css') !!}" rel="stylesheet">

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

        .datepicker {
            z-index: 100000 !important;
            display: block;
        }

        @media (min-width: 992px){
            .modal-lg {
                width: 1100px !important;
            }
        }
        

    </style>


</head>

<body>

