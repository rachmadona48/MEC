<div class="ibox-title">
    <h5>Discuss</h5>
    <div class="ibox-tools">
        <?php if (Session::get('tipe') == 'sdm'){ ?>
            <button class="btn btn-success btn-xs" onclick="add_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>')">Add Discuss</button>
        <?php } ?>
    </div>
</div>
<div class="ibox-content">
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr style="background-color: skyblue;">
                    <th><center>No</center></th>
                    <th>Topic Title</th>
                    <th><center>Moderator</center></th>
                    <th><center>Started</center></th>
                    <th><center>Closed</center></th>
                    <th><center>Action</center></th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $no = 1;
                foreach ($list_discuss as $key) { ?>
                <tr>
                    <td>
                        <center><?php echo $no;?></center>
                    </td>
                    <td class="issue-info">
                        <a onclick="comment_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>')">
                            <?php echo $key->judul;?>
                        </a>
                    </td>
                    <td>
                        <center><?php echo $key->nama;?></center>
                    </td>
                    <td>
                        <center><?php echo $key->t1;?></center>
                    </td>
                    <td>
                        <center><?php echo $key->t2;?></center>
                    </td>
                    <td>
                        <center>
                            <button class="btn btn-outline btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit" onclick="edit_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>','<?php echo $key->judul; ?>','<?php echo $key->isi; ?>','<?php echo $key->t2;?>')"><i class="fa fa-edit"></i></button>

                            <button class="btn btn-outline btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Delete" onclick="delete_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>','<?php echo $key->judul; ?>')"><i class="fa fa-trash"></i></button>
                        </center>
                    </td>
                </tr>
                <?php 
                $no++;
                } ?>
            </tbody>
        </table>
    </div>
</div>
