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
                                 <div class="form-group row">
                                <label
                                    for="tglawal"
                                    class="col-sm-2 col-form-label"
                                    >Tanggal Awal</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="date"
                                        v-model="tglawal"
                                        class="form-control"
                                        id="tglawal"
                                    />
                                </div>
                            </div>
                         
                            <div class="form-group row">
                                <label
                                    for="tglakhir"
                                    class="col-sm-2 col-form-label"
                                    >Tanggal Akhir</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="date"
                                        v-model="tglakhir"
                                        class="form-control"
                                        id="tglakhir"
                                    />
                                </div>
                            </div>
                                
                                <div class="col-5">
                                    <button @click="downloadPDF" class="btn btn-primary btn-block">
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

<script>
    export default {
        data() {
            return {
                tglawal : "",
                tglakhir : "",
                }
        },
        mounted() {
        // 
        },
        methods : {
       
        downloadPDF(){
            //console.log(this.tglakhir)
            axios({
                url: "api/register/"+this.tglawal+"/"+this.tglakhir+"/export",
                method: 'GET',
                responseType: 'blob',
                }).then((response) => {
                   //console.log(response.data);
                    var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                    var fileLink = document.createElement('a');
                    fileLink.href = fileURL;
                    fileLink.setAttribute('download', "Dokumen "+this.tglawal+"/"+this.tglakhir+".pdf");
                    document.body.appendChild(fileLink);
                    fileLink.click();

            });


        },
        }
       
    }
</script>