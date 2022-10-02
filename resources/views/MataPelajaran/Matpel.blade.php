@include('layouts.Header_matpel')
<div class="row wrapper border-bottom white-bg page-heading">
<input type="hidden" id="id_pelajaran" value="<?php echo $id_pelajaran; ?>" readonly="">
<input type="hidden" id="kode_grade" value="<?php echo $kode_grade; ?>" readonly="">
    <div class="col-lg-12">
        <center><h2>Subject : <?php echo $judul; ?></h2></center>
    </div>
    <?php if($count_week>0){ ?>
        <div class='row'> 
            <div class="col-md-1 col-xs-4">
                <h3>Timeline</h3>
            </div>
            <div class="col-md-11 col-xs-8">
                <div class="cd-horizontal-timeline loaded" style="height: 0px;" id="cd-horizontal-timeline">
                    <div class="timeline">
                        <div class="events-wrapper">
                            <div class="events" style="width: 1800px;">
                                <ol>
                                    <?php 
                                    $left = 70;
                                    $m = 1;
                                    foreach ($week as $key) { 
                                        $leftpx=$left.'px';
                                        $class = 'class="selected"';
                                        if(!empty($key->tgl_awal)){
                                            if($key->tgl_awal <= date('Y-m-d') and $key->tgl_akhir >= date('Y-m-d')){
                                                // $class = 'class="older-event"';
                                                $class = 'class="selected"';
                                            }else if($key->tgl_awal > date('Y-m-d')){
                                                // $class = '';
                                                $class = 'class="selected"';
                                            }else if($key->tgl_akhir < date('Y-m-d')){
                                                // $class = 'class="older-event"';
                                                $class = 'class="selected"';
                                            }
                                        }
                                    ?>
                                        <li>
                                            <a href="#0" data-date="" <?php echo $class; ?> style="left: <?php echo $leftpx; ?> ;"> 
                                                <?php 
                                                    $persen = ($m/$count_week)*100;
                                                    echo number_format($persen).'%';
                                                ?>
                                            </a>
                                        </li>
                                    <?php 
                                        $left=$left+70;
                                        $m++;
                                    } ?>
                                    

                                    <!-- <li><a href="#0" data-date="28/02/2017" style="left: 100px;" class="older-event"></a></li>
                                    <li><a href="#0" data-date="20/04/2017" style="left: 150px;" class="selected"></a></li>
                                    <li><a href="#0" data-date="20/05/2017" style="left: 200px;"></a></li> -->
                                </ol>
                                <span class="filling-line" aria-hidden="true" style="transform: scaleX(1.281506);"></span>
                            </div>
                        </div>
                        <ul class="cd-timeline-navigation">
                            <li><a href="#0" class="prev inactive">Prev</a></li>
                            <li><a href="#0" class="next">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class='row'> 
            <div class="col-md-1 col-xs-4">
            	<h3>Week</h3>
            </div>
            <div class="col-md-11 col-xs-8">
    			<div class="cd-horizontal-timeline loaded" style="height: 0px;" id="cd-horizontal-timeline">
                    <div class="timeline">
                        <div class="events-wrapper">
                            <div class="events" style="width: 1800px;">
                                <ol>
                                    <?php 
                                	$left = 70;
                                	foreach ($week as $key) { 
                                		$leftpx=$left.'px';
                                		$class = 'class="selected"';
                                		if(!empty($key->tgl_awal)){
                                			if($key->tgl_awal <= date('Y-m-d') and $key->tgl_akhir >= date('Y-m-d')){
                                				// $class = 'class="older-event"';
                                                $class = 'class="selected"';
                                			}else if($key->tgl_awal > date('Y-m-d')){
                                				// $class = '';
                                                $class = 'class="selected"';
                                			}else if($key->tgl_akhir < date('Y-m-d')){
                                				// $class = 'class="older-event"';
                                                $class = 'class="selected"';
                                			}
                                		}
                                	?>
                                		<li>
                                			<a href="#0" data-date="" <?php echo $class; ?> style="left: <?php echo $leftpx; ?> ;"> 
                                				<?php if(!empty($key->tgl_awal)){ 
                                					echo date("d/m/Y", strtotime($key->tgl_awal));
                                				}?>
                                			</a>
                                		</li>
                                	<?php 
                                		$left=$left+70;
                                	} ?>
                                </ol>
                                <span class="filling-line" aria-hidden="true" style="transform: scaleX(1.281506);"></span>
                            </div>
                        </div>
                        <ul class="cd-timeline-navigation">
                            <li><a href="#0" class="prev inactive">Prev</a></li>
                            <li><a href="#0" class="next">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>

</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row" id="div_tlm">

        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">Topic</span>
                    <h5>Discussion</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">50</h1>
                    <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div>
                    <small>Topic</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">Annual</span>
                    <h5>Assignment</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">Submit : 15</h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                    <small>Assignment : 30</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right">Today</span>
                    <h5>Learning</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">Approve : 35</h1>
                    <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i></div>
                    <small>Submit : 40</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-danger pull-right">Low value</span>
                    <h5>Student Number</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins">70</h1>
                    <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div>
                    <small>Year</small>
                </div>
            </div>
        </div>

        <?php if(Session::get('tipe') == 'sdm') { ?>
        <div class="col-lg-8">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Subject Icon</h5>
                    <div class="ibox-tools">
                    </div>
                </div>
                <div class="ibox-content">
                    <form role="form" class="form-inline" method="POST" enctype="multipart/form-data" id="update_icon_subject" action="javascript:void(0)">
                        <div class="form-group">
                            <input type="hidden" id="id_icon_subject_id" name="id_icon_subject_id" value="<?php echo $id_pelajaran; ?>" readonly="">
                            <input type="file" id="id_icon_subject" name="id_icon_subject" class="form-control" accept=".png">
                        </div>
                        <button class="btn btn-white" type="submit">Update</button>
                        <div class="form-group">
                            <img src="{!! asset('upload/'.Session::get('kd_smt_active').'/icon_subject/'.$id_pelajaran.'.png') !!}" alt="" style="height: 57.5px;width: 10;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Learning Type </h5>

                    <div ibox-tools></div>
                </div>
                <div class="ibox-content">
                    <div class="flot-chart">
                        <div class="flot-chart-pie-content" id="pie_learning_type"></div>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        

    </div>

    <!-- discuss -->
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox"  id="div_discuss">
                
            </div>
        </div>
    </div>
</div>




@include('layouts.Footer')

<!-- <script type="text/javascript">
    $(document).ready(function(){
        var menu_id = "<?php Print($id_menu); ?>";
        $(menu_id).addClass('active');  
    });
    
</script> -->
<script type="text/javascript">
    $(document).ready(function(){
        const id_pelajaran = $('#id_pelajaran').val();
        const kode_grade = $('#kode_grade').val();
        // console.log(kd_pelajaran)
        // console.log(kd_pelajaran2)
        // console.log(kode_grade)
        f_pie_learning_type(id_pelajaran);  
        get_discuss(kode_grade,id_pelajaran)
    });
    
</script>