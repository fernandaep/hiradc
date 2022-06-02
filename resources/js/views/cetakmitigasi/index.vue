<template>
    <div>
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Cetak Mitigasi Per-Tanggal</h1>
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
                               <!--   <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Unit Kerja</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="unitsgroup"
                                        label-for="unit_id"
                                    >
                                        <v-select
                                            v-model="selectedunitkerja"
                                            :options="units"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedunitkerja
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="unitsReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div> -->
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
                                        Cetak Mitigasi Per-Tanggal
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
                unit_id: "",
               
                }
        },
        mounted() {
        //this.getUnitkerja();
        },
        methods : {
       
        downloadPDF(){
            //console.log(this.tglakhir)
            axios({
                url: "api/mitigasi/"+this.tglawal+"/"+this.tglakhir+"/exportmitigasi",
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
        getUnitkerja() {
            axios.get("api/unit").then(response => {
                this.units = Object.values(response.data);
                //console.log(this.units);
                let cat = $.map(this.units, function(t) {
                    return { label: t.unit_kerja, value: t.id };
                });
                this.units = cat;
                //console.log(this.karyawans);
            });
        },
        }
       
    }
</script>