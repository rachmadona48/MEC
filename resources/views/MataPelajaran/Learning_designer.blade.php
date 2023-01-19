<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>List Session</h5>
                    <div class="ibox-tools">
                            <button class="btn btn-success btn-xs" onclick="add_learning_designer('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>')">Add Learning Designer</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr style="background-color: skyblue;">
                                <th><center>Judul</center></th>
                                <th><center>Action</center></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($data as $key) { 
                        ?>
                            <tr>
                                
                                <td>
                                    <center>
                                        <?php echo $key->judul;?>
                                    </center>
                                </td>
                                <td>
                                    <center>
                                        <button class="btn btn-outline btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Edit Learning Designer" onclick="edit_ld('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>')"><i class="fa fa-indent"></i></button>
                                    </center>
                                </td>
                            </tr>
                        <?php } ?>
                    
                        </tbody>
                    </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
