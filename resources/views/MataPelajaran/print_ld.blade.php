<!DOCTYPE html>
<html>
<head>
	<link rel="shorcut icon" href="{!! asset('image/logo.jpg') !!}">
	<title>Learning Designer</title>
	<!-- <link href="{!! asset('inspinia/css/bootstrap.min.css') !!}" rel="stylesheet"> -->
	<style type="text/css"> 
		table tr td, table tr th{ font-size: 9pt; } 
		table{
		    width:100%;
		}
		footer {
                position: fixed; 
                bottom: 0cm; 
                left: 0cm; 
                right: 0cm;
                height: 2cm;
            }
	</style>
</head>
<body style="font-family: sans-serif !important;">
	
	<center>
		<img alt="image" class="img-circle" src="{!! asset('image/logo_madania.png') !!}" width="350" height="100"/>
		<h3 style="margin-top: -10px !important;">Learning Designer</h3>
		<h3 style="margin-top: -20px !important;"><?php echo $nama_pelajaran; ?></h3>
		<h3 style="margin-top: -20px !important;">Kelas <?php echo $kode_grade; ?> - <?php echo Session::get('smt_active'); ?></h3>
		<h3 style="margin-top: -20px !important;">Minggu ke - <?php echo $minggu; ?></h3>
	</center>

	<table border="1" style="border-collapse: collapse;">
		<thead>
			<tr>
				<th width="50%">Topik Pembelajaran:</th>
				<th width="50%">Alokasi Waktu (Menit):</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><center><?php echo $data->topic; ?></center></td>
				<td><center><?php echo $data->alokasi_waktu; ?> Menit</center></td>
			</tr>
		</tbody>
	</table>

	<br/>

	<table border="1" style="border-collapse: collapse;">
		<thead>
			<tr>
				<th width="35%">Mode of delivery:</th>
				<th width="30%">Aims:</th>
				<th width="35%">Learning Type:</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><center><?php echo $data->md_deskripsi; ?></center></td>
				<td><center><?php echo $data->aims; ?></center></td>
				<td><center><?php echo $data->lt_deskripsi; ?></center></td>
			</tr>
		</tbody>
	</table>

	<br/>

	<!-- <div style="margin-top: -10px !important;"><h5><b>Outcomes:</b></h5></div> -->
	<table border="1" style="border-collapse: collapse;">
		<thead>
			<tr>
				<th><center>Outcomes</center></th>
                <th><center>Detail<center/></th>
			</tr>
		</thead>
		<tbody>
			<?php echo $outcomes; ?>
		</tbody>
	</table>
	
	<center><h5><b>Hasil Yang Diharapkan</b></h5></center>
	<div style="margin-top: -35px !important;"><h5><b>Kompetensi Inti:</b></h5></div>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<tbody>
			<tr>
				<td>
					<?php echo $data->kompetensi_inti; ?>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="margin-top: -15px !important;"><h5><b>Kompetensi Dasar dan Indikator:</b></h5></div>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<thead>
			<tr>
				<th width="40%">Kompetensi Dasar</th>
                <th width="60%">Indikator</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($kd_indikator as $kd_indikator) { ?>
            <tr>
                <td><?php echo $kd_indikator->kompetensi_dasar; ?></td>
                <td><?php echo $kd_indikator->indikator; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<table border="1" style="margin-top: 10px !important;border-collapse: collapse;">
		<thead>
			<tr>
				<th width="5%"><center>No</center></th>
                <th width="95%">Materi Pembelajaran</th>
			</tr>
		</thead>
		<tbody>
			<?php 
            $no = 1;
            foreach ($mapel as $mapel) { 
            ?>
			<tr>
				<td><center><?php echo $no; ?></center></td>
        		<td><?php echo $mapel->materi; ?></td>
			</tr>
			<?php $no++; } ?>
		</tbody>
	</table>
	<div style="margin-top: -15px !important;"><h5><b>Teknik Pembelajaran:</b></h5></div>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<tbody>
			<tr>
				<td>
					<?php echo $data->teknik_pembelajaran; ?>
				</td>
			</tr>
		</tbody>
	</table>
	
	<center><h5><b>Langkah-Langkah Pembelajaran</b></h5></center>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<thead>
			<tr>
				<th width="50%">Kegiatan Pembelajaran</th>
				<th width="20%"><center>Durasi</center></th>
                <th width="30%">Muatan PPK-MLP/HOTS/4C/Literasi</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($langkah_pembelajaran as $lb) { ?>
			<tr>
				<td><?php echo $lb->kegiatan; ?></td>
                <td><center><?php echo $lb->durasi; ?></center></td>
                <td><?php echo $lb->muatan; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<div style="margin-top: -15px !important;"><h5><b>Refleksi:</b></h5></div>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<tbody>
			<tr>
				<td>
					<?php echo $data->refleksi; ?>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="margin-top: -15px !important;"><h5><b>Sumber Belajar dan Alat Bantu Pengajaran:</b></h5></div>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<tbody>
			<tr>
				<td>
					<?php echo $data->sumber_alat; ?>
				</td>
			</tr>
		</tbody>
	</table>

	<center><h5><b>Penilaian Hasil Pembelajaran</b></h5></center>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<thead>
            <tr>
                <th rowspan="2" style="vertical-align: middle;"><center>Indikator</center></th>
                <th colspan="3"><center>Penilaian</center></th>
            </tr>
            <tr>
                <th><center>Teknik</center></th>
                <th><center>Bentuk Instrumen</center></th>
                <th><center>Sampel Instrumen</center></th>
            </tr>
        </thead>
		<tbody>
			<?php foreach ($hasil_pembelajaran as $hp) { ?>
            <tr>
                <td><?php echo $hp->indikator; ?></td>
                <td><?php echo $hp->tehnik; ?></td>
                <td><?php echo $hp->bentuk_instrumen; ?></td>
                <td><?php echo $hp->sampel_instrumen; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>

	<center><h5><b>Rubrik Penilaian</b></h5></center>
	<table border="1" style="margin-top: -20px !important;border-collapse: collapse;">
		<thead>
            <tr>
                <th><center>Rubrik</center></th>
                <th><center>Aspek Yang Dinilai<center/></th>
                <th><center>Maksimal Skor</center></th>
            </tr>
        </thead>
		<tbody>
			<?php echo $rubrik; ?>
		</tbody>
	</table>

	<table border="0" style="margin-top: 10px !important;border-collapse: collapse;">
		<tbody>
			<tr>
				<td width="50%">
					<center>
						
						<?php if ($tgl_approve){ ?>
							<p style="margin-top: 5px !important;">Telah Diperiksa dan Disetujui</p>
							<p style="margin-top: -10px !important;">Melalui MEC System Tanggal <?php echo $tgl_approve; ?></p>
						<?php }else{ ?>
							<p style="margin-top: 5px !important;">Belum Diperiksa dan Disetujui</p>
							<p style="margin-top: -10px !important;">Oleh</p>
						<?php } ?>
						
						<br/>
						<p>Ttd,</p>
						<?php if($spv){ ?>
						<br/>
						<p><?php 
							$nama_spv ='';
				    			if($spv->gelar_depan){
				    				$nama_spv = $spv->gelar_depan.' '.$spv->nama.' '.$spv->gelar_belakang;
				    			}else{
				    				$nama_spv = $spv->nama.' '.$spv->gelar_belakang;
				    			}

							echo $nama_spv; ?></p>
						<p style="margin-top: -10px !important;">(<?php echo $spv->profesi; ?>)</p>
						<?php } ?>
					</center>
					
				</td>
	            <td width="50%">
	            	<center>
	            		<p style="margin-top: 5px !important;">Bogor, <?php echo $tgl_2; ?></p>
						<p style="margin-top: -10px !important;">Dibuat Oleh</p>
						<br/>
						<p>Ttd,</p>
						<br/>
						<p><?php 
							$nama ='';
				    			if($priv_pelajaran->gelar_depan){
				    				$nama = $priv_pelajaran->gelar_depan.' '.$priv_pelajaran->nama.' '.$priv_pelajaran->gelar_belakang;
				    			}else{
				    				$nama = $priv_pelajaran->nama.' '.$priv_pelajaran->gelar_belakang;
				    			}
							echo $nama; ?></p>
							<p style="margin-top: -10px !important;">(<?php echo $priv_pelajaran->profesi; ?>)</p>
					</center>
	            </td>
	        </tr>
	        <tr>
				<td width="100%" colspan="2">
					<center>
					</center>
				</td>
	        </tr>
	        <tr>
				<td width="100%" colspan="2">
					<br/><br/>
					<center>
						<img src="data:image/png;base64, {!! $qrcode !!}">
						<p style="margin-top: -15px !important;">(Scan disini)</p>
					</center>
				</td>
	        </tr>
		</tbody>
	</table>

</body>
</html>