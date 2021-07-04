@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>Learning Designer</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/learning_designer')}}">Learning Designer</a>
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

                    <h2><span>Learning Designer</span></h2>


                </div>
            </div>
        </div>
    </div>
</div>

@include('layouts.Footer')
<script type="text/javascript">
    $(document).ready(function(){
        $('#menu_22').addClass('active');    
    });
</script>