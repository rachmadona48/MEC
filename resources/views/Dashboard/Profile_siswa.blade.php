@include('layouts.Header')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>Profile</h2>
        <ol class="breadcrumb">
            <li>
                <a href="{{url('/dashboard')}}">MEC Portal</a>
            </li>
            <li class="active">
                <strong>Profile</strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">


    <div class="row m-b-lg m-t-lg">
        <div class="col-md-6">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="profile-image">
                        <img src="{!! asset('image/user.jpg') !!}" width="85" height="85" class="img-circle circle-border m-b-md" alt="profile">
                    </div>
                    <div class="profile-info">
                        <div class="">
                            <div>
                                <h2 class="no-margins">
                                    <?php echo $nama; ?>
                                </h2>
                                <h4><?php echo Session::get('nm_level'); ?></h4>
                                <small>
                                    <table class="table small m-b-xs" style="max-width: 90%;">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <strong>Agama</strong>
                                            </td>
                                            <td>
                                                <strong><?php echo $agama; ?></strong>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>Tempat / Tgl Lahir</strong>
                                            </td>
                                            <td>
                                                <strong><?php echo $tempat_lahir; ?> / <?php echo $tgl_lahir; ?></strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>Gol Darah</strong>
                                            </td>
                                            <td>
                                                <strong><?php echo $gol_darah; ?></strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <?php echo $alamat; ?>.
                                                <br/>
                                                Kode Pos : <?php echo $kode_pos; ?>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </small></br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="ibox">
                <div class="ibox-content">
                    <table class="table small m-b-xs" style="max-width: 95%;">
                        <tbody>
                        <tr>
                            <td>
                                <strong>Profesi</strong>
                            </td>
                            <td>
                                <strong><?php echo $profesi; ?></strong>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <strong>No Telp</strong>
                            </td>
                            <td>
                                <strong><?php echo $no_telp; ?></strong>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <strong>Email</strong>
                            </td>
                            <td>
                                <strong><?php echo $email; ?></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Tgl Gabung</strong>
                            </td>
                            <td>
                                <strong><?php echo $tgl_gabung; ?></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>NISN</strong>
                            </td>
                            <td>
                                <strong><?php echo $nisn; ?></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Kelas</strong>
                            </td>
                            <td>
                                <strong><?php echo $kelas; ?></strong>
                            </td>
                        </tr>

                        <?php if(!empty($jurusan)){ ?>
                            <tr>
                                <td>
                                    <strong>Jurusan</strong>
                                </td>
                                <td>
                                    <strong><?php echo $jurusan; ?></strong>
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


@include('layouts.Footer')

<script type="text/javascript">
    $(document).ready(function(){
        $('#menu_dashboard').addClass('active');  
    });
</script>