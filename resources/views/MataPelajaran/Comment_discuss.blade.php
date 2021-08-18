<div class="ibox-title">
    <h5><?php echo $discuss->judul; ?></h5>
    <div class="ibox-tools">
        <button class="btn btn-danger btn-xs" onclick="get_discuss('<?php echo $kode_grade; ?>','<?php echo $id_pelajaran; ?>')"><< Back</button>
    </div>
</div>
<div class="ibox-content">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                    <strong><?php echo $discuss->nama; ?>, <?php echo $discuss->t1; ?></strong><br/>
                    <?php echo $discuss->isi; ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-12">
            <div class="chat-discussion">

                <div class="chat-message left">
                    <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                    <div class="message">
                        <a class="message-author" href="#"> Michael Smith </a>
                        <span class="message-date"> Mon Jan 26 2015 - 18:39:23 </span>
                        <span class="message-content">
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                        </span>
                        <input type="text" class="form-control" placeholder="Reply..."> 
                        <!-- <div class="input-group">
                            <input type="text" class="form-control" placeholder="Reply..."> 
                            <span class="input-group-btn"> 
                                <button type="button" class="btn btn-primary">Send!</button>
                            </span>
                        </div> -->
                    </div>
                </div>
                    <div class="chat-message right">
                        <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                        <div class="message">
                            <a class="message-author" href="#"> Karl Jordan </a>
                            <span class="message-date">  Fri Jan 25 2015 - 11:12:36 </span>
                            <span class="message-content">
                            Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover.
                            </span>
                        </div>
                    </div>
                    <div class="chat-message right">
                        <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                        <div class="message">
                            <a class="message-author" href="#"> Michael Smith </a>
                            <span class="message-date">  Fri Jan 25 2015 - 11:12:36 </span>
                            <span class="message-content">
                            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.
                            </span>
                        </div>
                    </div>


                <div class="chat-message left">
                    <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                    <div class="message">
                        <a class="message-author" href="#"> Alice Jordan </a>
                        <span class="message-date">  Fri Jan 25 2015 - 11:12:36 </span>
                        <span class="message-content">
                        All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.
                            It uses a dictionary of over 200 Latin words.
                        </span>
                        <input type="text" class="form-control" placeholder="Reply..."> 
                        <!-- <div class="input-group">
                            <input type="text" class="form-control" placeholder="Reply..."> 
                            <span class="input-group-btn"> 
                                <button type="button" class="btn btn-primary">Send!</button>
                            </span>
                        </div> -->
                    </div>
                </div>
                    <div class="chat-message right">
                        <img class="message-avatar" src="{!! asset('image/user.jpg') !!}" alt="" >
                        <div class="message">
                            <a class="message-author" href="#"> Mark Smith </a>
                            <span class="message-date">  Fri Jan 25 2015 - 11:12:36 </span>
                            <span class="message-content">
                            All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.
                                It uses a dictionary of over 200 Latin words.
                            </span>
                        </div>
                    </div>

            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="chat-message-form">
                <div class="form-group">
                    <textarea class="form-control message-input" btn-lg nam="message" placeholder="Comment (Enter to send comment)" onclick="send_comment('<?php echo $id; ?>')"></textarea>
                </div>
                <!-- <div class="input-group">
                    <textarea class="form-control message-input" name="message" placeholder="Enter message text"></textarea>
                    <span class="input-group-btn"> 
                        <button type="button" class="btn btn-primary btn-lg dim">Comment!</button>
                    </span>
                </div> -->

            </div>
        </div>
    </div>
</div>
