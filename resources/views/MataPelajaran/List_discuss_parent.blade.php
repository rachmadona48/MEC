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
                        <a onclick="comment_discuss_parent('<?php echo $id_pelajaran; ?>','<?php echo $key->id; ?>')">
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
                </tr>
                <?php 
                $no++;
                } ?>
            </tbody>
        </table>
    </div>
</div>
