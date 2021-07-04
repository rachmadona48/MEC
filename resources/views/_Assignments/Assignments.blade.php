@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>Assignments</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/assign')}}">Assignments</a>
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
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content text-center p-md">

                    <h2><span>Assignments</span></h2>


                </div>
            </div>
        </div>
    </div>
</div>

@include('layouts.Footer')
<script type="text/javascript">
    $(document).ready(function(){
        $('#menu_24').addClass('active');    
    });
</script>