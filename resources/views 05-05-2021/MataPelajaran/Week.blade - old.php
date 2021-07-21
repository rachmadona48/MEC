<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Week <?php echo $minggu; ?></h5>
                    <span class="label label-primary pull-right">Approve</span>
                </div>

                <div class="ibox-content inspinia-timeline">

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase"></i>
                            </div>
                            <div class="col-xs-10 content no-top-border">
                                <p class="m-b-xs"><strong>Activities</strong></p>

                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
                                    sale.</p>
                                <button class="btn btn-white btn-bitbucket btn-xs">Edit</button>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase"></i>
                            </div>
                            <div class="col-xs-10 content no-top-border">
                                <p class="m-b-xs"><strong>Assignment / Project</strong></p>

                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
                                    sale.</p>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase"></i>
                            </div>
                            <div class="col-xs-10 content no-top-border">
                                <p class="m-b-xs"><strong>Homework</strong></p>

                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
                                    sale.</p>
                            </div>
                        </div>
                    </div>

                    <div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-2">
                                <i class="fa fa-briefcase"></i>
                            </div>
                            <div class="col-xs-10 content no-top-border">
                                <p class="m-b-xs"><strong>Formative</strong></p>

                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
                                    sale.</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



        <div class="col-lg-8">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Teaching Learning Material</h5>
                    <div class="ibox-tools">
                        <a href="#" class="btn btn-primary btn-xs">Add new Material</a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-hover issue-tracker">
                        <tbody>
                        <tr>
                            <td>
                                <span class="label label-primary">Approve</span>
                            </td>
                            <td class="issue-info">
                                <a href="#">
                                    ISSUE-23
                                </a>

                                <small>
                                    This is issue with the coresponding note
                                </small>
                            </td>
                            <td>
                                Adrian Novak
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="label label-warning">Waiting</span>
                            </td>
                            <td class="issue-info">
                                <a href="#">
                                    ISSUE-07
                                </a>

                                <small>
                                    Always free from repetition, injected humour, or non-characteristic words etc.
                                </small>
                            </td>
                            <td>
                                Alex Ferguson
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="label label-danger">Cancel</span>
                            </td>
                            <td class="issue-info">
                                <a href="#">
                                    ISSUE-44
                                </a>

                                <small>
                                    This is issue with the coresponding note
                                </small>
                            </td>
                            <td>
                                Adrian Novak
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('.active').removeClass('active');

        var menu_id = "<?php Print($id_menu_week); ?>";
        $('#'+menu_id).addClass('active');  
    });
    
</script>