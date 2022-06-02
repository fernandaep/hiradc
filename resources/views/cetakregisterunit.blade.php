<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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
  <h2> <img height="100" width="75" src="img/download.png">  IDENTIFIKASI & PENETAPAN PROGRAM MITIGASI RESIKO K3, KO DAN ASPEK LINGKUNGAN</h2>
</div>

<table id="customers">
  <tr>
    <th>Unit</th>
    <th>Category</th>
    <th>Kegiatan</th>
    <th>Lokasi</th>
    <th>Kondisi</th>
    <th>Threat</th>
    <th>Dampak</th>
    <th>Pengendalian</th>
    <th>Kemungkinan</th>
    <th>Konsekuensi</th>
    <th>Tingkat Resiko</th>
    <th>status_regulasi</th>
    <th>Aspek Lingkungan</th>
    <th>Peluang</th>
    <th>Resiko</th>
    <th>Resiko Ditoleransi</th>
    <th>Cakupan Resiko</th>
    <th>Status Program</th>
  </tr>
@php
    $no=1;
  @endphp
@foreach ( $data['dataUnit'] as $row )
  <tr>
    <td>{{ $row->unit->unit_kerja }}</td>
    <td>{{ $row->category->nama }}</td>
    <td>{{ $row->activity }}</td>
    <td>{{ $row->lokasi }}</td>
    <td>{{ $row->condition->nama }}</td>
    <td>{{ $row->threat->nama }}</td>
    <td>{{ $row->vulnerability->nama }}</td>
    <td>{{ $row->pengendalian }}</td>
    <td>{{ $row->possibility_id }}</td>
    <td>{{ $row->consequence_id }}</td>
    <td>{{ $row->tingkat_resiko }}</td>
    <td>{{ $row->status_regulasi }}</td>
    <td>{{ $row->aspek_lingkungan }}</td>
    <td>{{ $row->peluang }}</td>
    <td>{{ $row->resiko }}</td>
    <td>{{ $row->resiko_ditoleransi }}</td>
    <td>{{ $row->cakupan_resiko }}</td>
    <td>{{ $row->status_program }}</td>

  </tr>
@endforeach
</table>
</body>
</html>


