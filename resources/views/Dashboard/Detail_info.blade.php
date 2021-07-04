@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>MEC Portal</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/dashboard')}}">MEC Portal</a>
            </li>
            <li class="active">
                <strong><?php echo $detail_info->title; ?></strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">
        
    </div>
</div>
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                    
                    <div class="text-center article-title">
                    <span class="text-muted"><i class="fa fa-clock-o"></i> <?php echo $detail_info->datetime; ?></span>
                        <h1>
                            <?php echo $detail_info->title; ?>
                        </h1>
                    </div>
                    <?php echo $detail_info->description; ?>
                    
                    <hr>
                    <?php
                        if(!empty($detail_info->file)){
                    ?>
                        <object data="{!! asset('upload/info') !!}/<?php echo $detail_info->file; ?>" type="application/pdf" width="100%" height="800px">  
                    </object>
                    <?php
                        }
                    ?>
                    


                </div>
            </div>
        </div>
    </div>


</div>

@include('layouts.Footer')

