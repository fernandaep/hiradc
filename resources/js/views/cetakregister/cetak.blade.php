<template>
    <div>
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Cetak Laporan Per-Tanggal</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="input-group mb-3">
                                    <label for="label">Tanggal Awal</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="tglawal"
                                    />
                                </div>
                                
                                 <div class="input-group mb-3">
                                    <label for="label">Tanggal Akhir</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="tglakhir"
                                    />
                                </div>
                                
                                <div class="col-5">
                                    <button onclick="this.href='/dataregisterpertanggal'+document.getElementById('tglawal').value+'/'+document.getElementById('tglakhir').value" target="_blank" class="btn btn-primary btn-block">
                                    <i class="fas fa-sign-in-alt"></i>
                                        Cetak Laporan Per-Tanggal
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>