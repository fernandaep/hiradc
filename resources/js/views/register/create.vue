<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">New Register</div>
                    <div class="card-body">
                        <form action="#" method="post" @submit.prevent="store">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Kategori</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="categorygroup"
                                        label-for="category"
                                    >
                                        <v-select
                                            v-model="selectedcategory"
                                            :options="categories"
                                            @input="getCondition"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedcategory
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="categoryReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="activity"
                                    class="col-sm-2 col-form-label"
                                    >{{ labelactivity }}</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.activity"
                                        class="form-control"
                                        id="activity"
                                    />
                                    <div
                                        v-if="theErrors.lokasi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.lokasi[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label
                                    for="lokasi"
                                    class="col-sm-2 col-form-label"
                                    >Lokasi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.lokasi"
                                        class="form-control"
                                        id="lokasi"
                                    />
                                    <div
                                        v-if="theErrors.lokasi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.lokasi[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Kondisi</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="kondisigroup"
                                        label-for="kondisi"
                                    >
                                        <v-select
                                            v-model="selectedcondition"
                                            :options="conditions"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedcondition
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="conditionReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">
                                    {{ labelthreat }}
                                </label>

                                <div class="col-sm-10">
                                    <b-form-group
                                        id="threatgroup"
                                        label-for="threat"
                                    >
                                        <v-select
                                            v-model="selectedthreat"
                                            :options="threats"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="!selectedthreat"
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="threatReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Dampak</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="vulnerabilitygroup"
                                        label-for="vulnerability"
                                    >
                                        <v-select
                                            v-model="selectedvulnerability"
                                            :options="vulnerabilities"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedvulnerability
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="vulnerabilityReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="pengendalian"
                                    class="col-sm-2 col-form-label"
                                    >Pengendalian</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.pengendalian"
                                        class="form-control"
                                        id="pengendalian"
                                    />
                                    <div
                                        v-if="theErrors.pengendalian"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.pengendalian[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Kemungkinan</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="possibilitygroup"
                                        label-for="possibility"
                                    >
                                        <v-select
                                            v-model="selectedpossibility"
                                            :options="possibilities"
                                            @input="perkalian"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedpossibility
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="possibilityReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Konsekuensi</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="consequencegroup"
                                        label-for="consequnce"
                                    >
                                        <v-select
                                            v-model="selectedconsequence"
                                            :options="consequences"
                                            @input="perkalian"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedconsequence
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="consequenceReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="tingkat_resiko"
                                    class="col-sm-2 col-form-label"
                                    >Tingkat Resiko</label
                                >

                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="resiko"
                                        class="form-control"
                                        id="tingkat_resiko"
                                        readonly
                                        @change="perkalian"
                                    />
                                    <div
                                        v-if="theErrors.tingkat_resiko"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.resiko[0] }}
                                    </div>
                                </div>
                            </div>

                            <div v-if="showlh">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label"
                                        >Status Regulasi</label
                                    >
                                    <div class="col-sm-10">
                                        <b-form-group
                                            id="status_regulasigroup"
                                            label-for="status_regulasi"
                                        >
                                            <v-select
                                                :options="[
                                                    'Legal',
                                                    'Tidak Legal'
                                                ]"
                                                v-model="form.status_regulasi"
                                                @input="regulasi"
                                            ></v-select>
                                        </b-form-group>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label
                                        for="aspek_lingkungan"
                                        class="col-sm-2 col-form-label"
                                        >Aspek Lingkungan</label
                                    >
                                    <div class="col-sm-10">
                                        <input
                                            type="text"
                                            v-model="form.aspek_lingkungan"
                                            class="form-control"
                                            id="aspek_lingkungan"
                                            readonly
                                        />
                                        <div
                                            v-if="theErrors.aspek_lingkungan"
                                            class="mt2 text-danger"
                                        >
                                            {{ theErrors.aspek_lingkungan[0] }}
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label
                                        for="peluang"
                                        class="col-sm-2 col-form-label"
                                        >Peluang</label
                                    >
                                    <div class="col-sm-10">
                                        <input
                                            type="text"
                                            v-model="form.peluang"
                                            class="form-control"
                                            id="peluang"
                                        />
                                        <div
                                            v-if="theErrors.peluang"
                                            class="mt2 text-danger"
                                        >
                                            {{ theErrors.peluang[0] }}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label
                                        for="resiko"
                                        class="col-sm-2 col-form-label"
                                        >Resiko</label
                                    >
                                    <div class="col-sm-10">
                                        <input
                                            type="text"
                                            v-model="form.resiko"
                                            class="form-control"
                                            id="resiko"
                                        />
                                        <div
                                            v-if="theErrors.resiko"
                                            class="mt2 text-danger"
                                        >
                                            {{ theErrors.resiko[0] }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="status_program"
                                    class="col-sm-2 col-form-label"
                                    >Resiko Ditoleransi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.resiko_ditoleransi"
                                        class="form-control"
                                        id="resiko_ditoleransi"
                                        readonly
                                    />
                                    <div
                                        v-if="theErrors.resiko_ditoleransi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.resiko_ditoleransi[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="status_program"
                                    class="col-sm-2 col-form-label"
                                    >Cakupan Resiko</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.cakupan_resiko"
                                        class="form-control"
                                        id="cakupan_resiko"
                                        readonly
                                    />
                                    <div
                                        v-if="theErrors.cakupan_resiko"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.cakupan_resiko[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="status_program"
                                    class="col-sm-2 col-form-label"
                                    >Status Program</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.status_program"
                                        class="form-control"
                                        id="resiko_ditoleransi"
                                        readonly
                                    />
                                    <div
                                        v-if="theErrors.status_program"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.status_program[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 text-right">
                                    <input
                                        type="button"
                                        value="Go Back"
                                        onclick="history.back(-1)"
                                    />
                                    <button
                                        type="submit"
                                        class="btn btn-primary"
                                    >
                                        Save
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators";
export default {
    data() {
        return {
            form: {
                form: {
                    id: "",
                    /* unit_kerja: "", */
                    activity: "",
                    category_id: "",
                    activity: "",
                    lokasi: "",
                    condition_id: "",
                    threat_id: "",
                    vulnerability_id: "",
                    pengendalian: "",
                    possibility_id: "",
                    consequence_id: "",
                    tingkat_resiko: "",
                    status_regulasi: "",
                    aspek_lingkungan: "",
                    peluang: "",
                    resiko: "",
                    resiko_ditoleransi: "",
                    cakupan_resiko: "",
                    status_program: ""
                }
            },
            validations: {
                form: {
                    /*  unit_kerja: {
                        required
                    }, */
                    activity: {
                        required
                    },
                    lokasi: {
                        required
                    },
                    condition_id: {
                        required
                    },
                    threat_id: {
                        required
                    },
                    pengendalian: {
                        required
                    },
                    possibility_id: {
                        required
                    },
                    consequence_id: {
                        required
                    },
                    tingkat_resiko: {
                        required
                    },
                    status_regulasi: {
                        required
                    },
                    aspek_lingkungan: {
                        required
                    },
                    resiko_ditoleransi: "",
                    cakupan_resiko: "",
                    status_program: "",
                    product_image: ""
                }
            },
            items: [],
            theErrors: [],
            selectedcategory: "",
            selectedasset: "",
            selectedcondition: "",
            selectedthreat: "",
            selectedvulnerability: "",
            selectedpossibility: "",
            selectedconsequence: "",
            activities: [],
            assets: [],
            conditions: [],
            threats: [],
            vulnerabilities: [],
            possibilities: [],
            consequences: [],
            categories: [],
            labelthreat: "threat",
            labelactivity: "Activity",
            showlh: false,
            resiko:"",
            hasilkali:0
        };
    },
    mounted() {
        this.loadData();
        this.getCategory();
        this.getCondition();
        /* this.getThreat(); */
        /* this.getVulnerability(); */
        this.getPosibility();
        this.getConsequence();
        //this.perkalian();
    },
    methods: {
        loadData() {
            axios.get("api/register").then(response => {
                this.items = Object.values(response.data);
                console.log(Object.values(response.data));
            });
        },
        getCategory() {
            axios.get("api/category").then(response => {
                this.categories = Object.values(response.data);
                let cat = $.map(this.categories, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.categories = cat;
            });
        },
        getCondition() {
            let id = this.selectedcategory.value;

            if (id == 2) {
                this.showlh = false;
                this.labelactivity = "Kegiatan";
                this.labelthreat = "Potensi Bahaya";
            } else if (id == 6) {
                this.showlh = true;
                this.labelactivity = "Kegiatan";
                this.labelthreat = "Aspek Lingkungan";
            } else if (id == 7) {
                this.showlh = false;
                this.labelactivity = "Asset";
                this.labelthreat = "Ancaman Keamanan";
            } else {
                this.showlh = false;
                this.labelthreat = "Threat";
            }

            axios.get("api/condition/" + id + "/showkat").then(response => {
                this.conditions = Object.values(response.data);
                let cat = $.map(this.conditions, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.conditions = cat;
            });
            /* let id = this.selectedcategory.value; */
            axios.get("api/vulnerability/" + id + "/showkat").then(response => {
                this.vulnerabilities = Object.values(response.data);
                let cat = $.map(this.vulnerabilities, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.vulnerabilities = cat;
            });
            axios.get("api/consequence/" + id + "/showkat").then(response => {
                this.consequences = Object.values(response.data);
                let cat = $.map(this.consequences, function(t) {
                    return {
                        label: t.nilai + " - " + t.konsekuensi + "",
                        value: t.nilai
                    };
                });
                this.consequences = cat;
            });
            axios.get("api/threat").then(response => {
                this.threats = Object.values(response.data.data);
                let cat = $.map(this.threats, function(t) {
                    return { label: t.nama, value: t.id };
                });
                console.log(Object.values(response.data));
                this.threats = cat;
            });
        },

        getPosibility() {
            axios.get("api/possibility").then(response => {
                this.possibilities = Object.values(response.data);
                let cat = $.map(this.possibilities, function(t) {
                    return {
                        label: t.nilai + " ( " + t.nama + " )",
                        value: t.nilai
                    };
                });
                this.possibilities = cat;
            });
        },

        getConsequence() {
            let id = this.selectedcategory.value;
            axios.get("api/consequence/" + id + "/showkat").then(response => {
                this.consequences = Object.values(response.data);
                let cat = $.map(this.consequences, function(t) {
                    return {
                        label: t.nilai + " - " + t.konsekuensi + "",
                        value: t.nilai
                    };
                });
                this.consequences = cat;
            });
        },

        perkalian() {
            this.form.possibility_id = this.selectedpossibility.value;
            this.form.consequence_id = this.selectedconsequence.value;
            if (
                this.form.possibility_id == null ||
                this.form.consequence_id == null
            ) {
                this.hasilkali = 0;
            } else {
                this.hasilkali=
                    parseInt(this.form.possibility_id) *
                    parseInt(this.form.consequence_id);
            }

            if (this.hasilkali <= 4) {
                this.labelresiko = "Rendah";
               
            } else if (
                this.hasilkali >= 5 &&
                this.hasilkali <= 9
            ) {
                this.labelresiko = "Sedang";
            } else if (
                this.hasilkali >= 10 &&
                this.hasilkali <= 16
            ) {
                this.labelresiko = "Tinggi";
            } else {
               this.labelresiko = "Sangat Tinggi";
            }

            this.resiko = this.hasilkali + " - " + this.labelresiko; 
            this.form.tingkat_resiko = this.labelresiko;
            
            this.cakupan();
            this.cekresiko();
            this.status();
            this.regulasi();
        },

        cakupan() {
            if (this.labelresiko == "Sangat Tinggi") {
                this.form.cakupan_resiko = "Koorporat/Direktorat";
            } else if (
                this.labelresiko == "Tinggi" ||
                this.labelresiko == "Sedang" ||
                this.labelresiko == "Rendah"
            ) {
                this.form.cakupan_resiko = "Unit Kerja";
            } else {
                this.form.cakupan_resiko = "";
            }
        },

        cekresiko() {
            if (
                this.labelresiko == "Sangat Tinggi" ||
                this.labelresiko == "Tinggi"
                ){
                this.form.resiko_ditoleransi = "Ya";
            } else if (
                this.labelresiko == "Sedang" ||
                this.labelresiko == "Rendah"
                ){
                this.form.resiko_ditoleransi = "Tidak";
            } else {
                this.form.resiko_ditoleransi = "";
            }
        },

        status() {
            if (
                this.labelresiko == "Sangat Tinggi" &&
                this.form.cakupan_resiko == "Koorporat/Direktorat"
            ) {
                this.form.status_program = "PMK";
            } else if (
                this.labelresiko == "Tinggi" &&
                this.form.cakupan_resiko == "Unit Kerja"
            ) {
                this.form.status_program = "PUK";
            } else if (
                (this.labelresiko == "Sedang" ||
                    this.labelresiko == "Rendah") &&
                (this.form.cakupan_resiko == "Koorporat/Direktorat" ||
                this.form.cakupan_resiko == "Unit Kerja")
            ) {
                this.form.status_program = "Pengendalian Operasional";
            } else {
                this.form.status_program = "";
            }
        },

        regulasi() {
            if (this.form.status_regulasi == "Legal") {
                this.form.aspek_lingkungan = "Penting";
            }
            
            else  {
                if(this.labelresiko=="Rendah" || this.labelresiko=="Sedang")
                {
                    this.form.aspek_lingkungan = "Tidak Penting";
                }
                else if(this.labelresiko=="Tinggi" || this.labelresiko=="Sangat Tinggi")
                {
                    this.form.aspek_lingkungan = "Penting";
                }
            }
          
        },

        async store() {
            try {
                this.form.category_id = this.selectedcategory.value;
                this.form.condition_id = this.selectedcondition.value;
                this.form.threat_id = this.selectedthreat.value;
                this.form.vulnerability_id = this.selectedvulnerability.value;
                this.form.possibility_id = this.selectedpossibility.value;
                this.form.consequence_id = this.selectedconsequence.value;
                let response = await axios.post("api/register", this.form);
                // console.log(response.status);
                if (response.status == 200) {
                    this.form.category_id = "";
                    this.form.activity = "";
                    this.form.asset_id = "";
                    this.form.lokasi = "";
                    this.form.condition_id = "";
                    this.form.threat_id = "";
                    this.form.vulnerability_id = "";
                    this.form.pengendalian = "";
                    this.form.possibility_id = "";
                    this.form.consequence_id = "";
                    this.form.tingkat_resiko = "";
                    this.form.status_regulasi = "";
                    this.form.aspek_lingkungan = "";
                    this.form.peluang = "";
                    this.form.resiko = "";
                    this.form.resiko_ditoleransi = "";
                    this.form.cakupan_resiko = "";
                    this.form.status_program = "";
                    this.$swal({
                        icon: "success",
                        title: "Register Added successfully"
                    });
                }
            } catch (e) {
                console.log(e.response.data.errors);
            }
        }
    }
};
</script>

<style></style>
