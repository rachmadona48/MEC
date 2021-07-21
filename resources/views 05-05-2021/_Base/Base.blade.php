@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>Base Class</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/base_class')}}">Base Class</a>
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

                    <h2><span>Base Class</span></h2>


                </div>
            </div>
        </div>
    </div>
</div>

@include('layouts.Footer')
<script type="text/javascript">
    $(document).ready(function(){
        $('#menu_25').addClass('active');    
    });
</script>