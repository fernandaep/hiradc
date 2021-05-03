<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">New Consequence</div>
                    <div class="card-body">
                        <form action="#" method="post" @submit.prevent="store">
                            <div class="form-group row">
                                <label
                                    for="unit_kerja"
                                    class="col-sm-2 col-form-label"
                                    >unit kerja</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.unit_kerja"
                                        class="form-control"
                                        id="unit_kerja"
                                    />
                                    <div
                                        v-if="theErrors.unit_kerja"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.unit_kerja[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Activity</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="activitygroup"
                                        label-for="activity"
                                    >
                                        <v-select
                                            v-model="selectedactivity"
                                            :options="activities"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="
                                                        !selectedactivity
                                                    "
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="activityReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="lokasi"
                                    class="col-sm-2 col-form-label"
                                    >lokasi</label
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
                                <label class="col-sm-2 col-form-label"
                                    >Threat</label
                                >
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
                                <label
                                    for="pengendalian"
                                    class="col-sm-2 col-form-label"
                                    >pengendalian</label
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
                                    >kemungkinan</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="possibilitygroup"
                                        label-for="possibility"
                                    >
                                        <v-select
                                            v-model="selectedpossibility"
                                            :options="possibilities"
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
                                        label-for="threat"
                                    >
                                        <v-select
                                            v-model="selectedconsequence"
                                            :options="consequences"
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
                                        v-model="form.tingkat_resiko"
                                        class="form-control"
                                        id="tingkat_resiko"
                                    />
                                    <div
                                        v-if="theErrors.tingkat_resiko"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.tingkat_resiko[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="status_regulasi"
                                    class="col-sm-2 col-form-label"
                                    >Status Regulasi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.status_regulasi"
                                        class="form-control"
                                        id="status_regulasi"
                                    />
                                    <div
                                        v-if="theErrors.status_regulasi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.status_regulasi[0] }}
                                    </div>
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
                            <div class="form-group row">
                                <label
                                    for="resiko_ditoleransi"
                                    class="col-sm-2 col-form-label"
                                    >Resiko Ditoleransi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.resiko_ditoleransi"
                                        class="form-control"
                                        id="resiko_ditoleransi"
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
                                    for="cakupan_resiko"
                                    class="col-sm-2 col-form-label"
                                    >Cakupan Resiko</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.cakupan_resiko"
                                        class="form-control"
                                        id="resiko_ditoleransi"
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
                                    />
                                    <div
                                        v-if="theErrors.status_program"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.status_program[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="program"
                                    class="col-sm-2 col-form-label"
                                    >Program</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.program"
                                        class="form-control"
                                        id="program"
                                    />
                                    <div
                                        v-if="theErrors.program"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.program[0] }}
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
                    unit_kerja: "",
                    activity_id: "",
                    lokasi: "",
                    condition_id: "",
                    threat_id: "",
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
                    status_program: "",
                    program: ""
                }
            },
            /*   validations: {
                form: {
                    category_id: {
                        required
                    },
                    unit_kerja: {
                        required
                    },
                    pengendalian: {
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
                    peluang: {
                        required
                    },
                    resiko: {
                        required
                    },
                    resiko_ditoleransi: "",
                    program: "",
                    lama_penyimpangan: "",
                    product_image: "",
                    dampak_sosial: ""
                }
            }, */
            items: [],
            theErrors: [],
            selectedactivity: "",
            selectedcondition: "",
            selectedthreat: "",
            selectedpossibility: "",
            selectedconsequence: "",
            activities: [],
            conditions: [],
            threats: [],
            possibilities: [],
            consequences: []
        };
    },
    mounted() {
        this.loadData();
        this.getActivity();
        this.getCondition();
        this.getThreat();
        this.getPosibility();
        this.getConsequence();
    },
    methods: {
        loadData() {
            axios.get("api/registrasi").then(response => {
                this.items = Object.values(response.data);
                //console.log(Object.values(response.data));
            });
        },
        getActivity() {
            axios.get("api/activity").then(response => {
                this.activities = Object.values(response.data);
                let cat = $.map(this.activities, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.activities = cat;
            });
        },
        getCondition() {
            axios.get("api/condition").then(response => {
                this.conditions = Object.values(response.data.data);
                let cat = $.map(this.conditions, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.conditions = cat;
            });
        },
        getThreat() {
            axios.get("api/threat").then(response => {
                this.threats = Object.values(response.data.data);
                let cat = $.map(this.threats, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.threats = cat;
            });
        },
        getPosibility() {
            axios.get("api/possibility").then(response => {
                this.possibilities = Object.values(response.data);
                let cat = $.map(this.possibilities, function(t) {
                    return { label: t.nama, value: t.id };
                });
                this.possibilities = cat;
            });
        },
        getConsequence() {
            axios.get("api/consequence").then(response => {
                this.consequences = Object.values(response.data.data);
                let cat = $.map(this.consequences, function(t) {
                    return { label: t.nilai, value: t.id };
                });
                this.consequences = cat;
            });
        },
        async store() {
            try {
                this.form.activity_id = this.selectedactivity.value;
                this.form.condition_id = this.selectedcondition.value;
                this.form.threat_id = this.selectedthreat.value;
                this.form.possibility_id = this.selectedpossibility.value;
                this.form.consequence_id = this.selectedconsequence.value;
                let response = await axios.post("api/register", this.form);
                // console.log(response.status);
                if (response.status == 200) {
                    this.form.activity_id = "";
                    this.form.condition_id = "";
                    this.form.threat_id = "";
                    this.form.possibility_id = "";
                    this.form.consequence_id = "";
                    this.form.pengendalian = "";
                    this.fosrm.tingkat_resiko = "";
                    this.form.status_regulasi = "";
                    this.form.aspek_lingkungan = "";
                    this.form.peluang = "";
                    this.form.resiko = "";
                    this.form.resiko_ditoleransi = "";
                    this.form.program = "";
                    this.form.lama_penyimpangan = "";
                    this.form.product_image = "";
                    this.form.dampak_sosial = "";
                    this.$swal({
                        icon: "success",
                        title: "Consequence Added successfully"
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
