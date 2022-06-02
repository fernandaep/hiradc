<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
  <div class = "col-md-4">
    <h2> <img height="100" width="75" src="img/download.png">  
      IDENTIFIKASI & PENETAPAN PROGRAM MITIGASI RESIKO K3, KO DAN ASPEK LINGKUNGAN</h2>
  </div>

  Periode : {{ $data['tglawal'] }} s/d {{ $data['tglakhir'] }}

<table id="customers">
  <tr>
    <th>Kegiatan</th>
    <th>Program Mitigasi</th>
    <th>Kemungkinan</th>
    <th>Konsekuensi</th>
    <th>Tingkat Resiko</th>
    <th>Aspek Lingkungan</th>
    <th>keterangan</th>
    
  </tr>
  @php
    $no=1;
  @endphp
@foreach ( $data['dataRegister'] as $row )
  <tr>
    <td>{{ $row->register->activity }}</td>
    <td>{{ $row->program_mitigasi }}</td>
    <td>{{ $row->possibility_id }}</td>
    <td>{{ $row->consequence_id }}</td>
    <td>{{ $row->tingkat_resiko }}</td>
    <td>{{ $row->aspek_lingkungan }}</td>
    <td>{{ $row->keterangan }}</td>


  </tr>
@endforeach
</table>
</body>
</html>


