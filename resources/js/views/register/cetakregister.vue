<template>
    <div class="overflow-auto">
        <div class="container">
            <div class="row mt-1">
                <div class="col-md-20">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                Register
                            </h3>
                        </div>
                        <div class="card-body">
                            <b-row class="p-10">
                                <a type="button">
                                    <button
                                        @click="downloadPDF"
                                        class="btn btn-primary"
                                    >
                                        Export
                                    </button>
                                </a>
                            

                                   <b-col lg="2" sm="4" md="2" class="my-1">
                                    <b-form-group
                                        label="Year"
                                        label-for="per-year-select"
                                        label-cols-sm="8"
                                        label-cols-md="8"
                                        label-cols-lg="6"
                                        label-align-sm="right"
                                        label-size="sm"
                                        class="mb-0"
                                    >
                                 <b-form-select
                                            id="per-year-select"
                                            v-model="filter"
                                            :options="year"
                                            size="sm"
                                        ></b-form-select>
                                    </b-form-group>
                                </b-col>
                                   <b-col lg="2" sm="4" md="2" class="my-1">
                                    <b-form-group
                                        label="Risk"
                                        label-for="per-risk-select"
                                        label-cols-sm="8"
                                        label-cols-md="8"
                                        label-cols-lg="6"
                                        label-align-sm="right"
                                        label-size="sm"
                                        class="mb-0"
                                    >
                                      <b-form-select
                                            id="per-risk-select"
                                            v-model="filter"
                                            :options="risk"
                                            size="sm"
                                        ></b-form-select>
                                    </b-form-group>
                                </b-col>
                                <b-col lg="2" sm="4" md="2" class="my-1">
                                    <b-form-group
                                        label="Per page"
                                        label-for="per-page-select"
                                        label-cols-sm="8"
                                        label-cols-md="8"
                                        label-cols-lg="6"
                                        label-align-sm="right"
                                        label-size="sm"
                                        class="mb-0"
                                    >
                                        <b-form-select
                                            id="per-page-select"
                                            v-model="perPage"
                                            :options="pageOptions"
                                            size="sm"
                                        ></b-form-select>
                                    </b-form-group>
                                </b-col>

                                <!-- <b-table bordered show-empty striped stacked="md" no-provider-filtering 
                                class="management-list" ref="table"
                                v-model="filteredItems"
                                :items="tableItems"
                                :fields="fields"
                                :current-page="currentPage"
                                :per-page="perPage"
                                :filter="filter"
                                :filter-function="filterTable"
                                :sort-by.sync="sortBy"
                                :sort-desc.sync="sortDesc"
                                @filtered="onFiltered">
                                </b-table> -->

                                <b-col lg="3" class="my-1">
                                    <b-form-group
                                        label="Filter"
                                        label-for="filter-input"
                                        label-cols-sm="3"
                                        label-align-sm="right"
                                        label-size="sm"
                                        class="mb-0"
                                    >
                                        <b-input-group size="sm">
                                            <b-form-input
                                                id="filter-input"
                                                v-model="filter"
                                                type="search"
                                                placeholder="Type to Search"
                                            ></b-form-input>

                                            <b-input-group-append>
                                                <b-button
                                                    :disabled="!filter"
                                                    @click="filter = ''"
                                                    >Clear</b-button
                                                >
                                            </b-input-group-append>
                                        </b-input-group>
                                    </b-form-group>
                                </b-col>
                            </b-row>
                            <br />
                            <b-table
                                id="my-table"
                                :items="items"
                                :per-page="perPage"
                                :current-page="currentPage"
                                :filter="filter"
                                :fields="fields"
                                :head-variant="headvariant"
                                primary-key="id"
                                :tbody-transition-props="transProps"
                                :sort-by.sync="sortBy"
                                :sort-desc.sync="sortDesc"
                                stacked="md"
                                small
                                striped
                                hover
                                responsive
                            >
                                

                                <template #cell(no)="row">
                                    {{ row.index + 1 }}
                                </template>
                                <template #cell(created_at)="row">
                                    {{ row.item.created_at | formatDate }}
                                </template>
                                <template #cell(updated_at)="row">
                                    {{ row.item.updated_at | formatDate }}
                                </template>
                                <template #cell(actions)="row">
                                    
                                    <b-button variant="outline-info" size="sm" @click="row.toggleDetails" class="mr-1">
                                        <i class="fa fa-eye"></i>
                                    </b-button>

                                    <b-button variant="outline-success" size="sm"  class="mr-1"
                                        @click="
                                            openModal(
                                                'mitigasi',
                                                'Tambah Mitigasi',
                                                $event.target,
                                                row.item
                                            )"
                                    >
                                        <i class="fa fa-plus"></i>
                                    </b-button>

                                    <b-button variant="outline-info" size="sm" class="mr-1" @click="verifiedRegister(row.item.id)" v-if="row.item.status=='Menunggu Verifikasi' && (level=='verifikator' || level=='admin')">
                                        <i class="fa fa-check"></i>
                                    </b-button>

                                    <b-button
                                        variant="outline-primary"
                                        size="sm"
                                        @click="approvedRegister(row.item.id)"
                                        class="mr-1" 
                                        v-if="row.item.status=='Menunggu Approval' && (level=='approval' || level=='admin')"
                                    >
                                        <i class="fa fa-check-double"></i>
                                    </b-button>
                                    <b-button variant="outline-info" size="sm" 
                                        v-if="row.item.status=='Menunggu Verifikasi' && (level=='unitkerja' || level=='admin')">
                                            <router-link
                                                :to="{
                                                    name: 'register.edit',
                                                    params: { id: row.item.id }
                                                }"
                                            >
                                                <i class="fa fa-edit"></i>
                                            </router-link>
                                        </b-button>

                                        <b-button
                                            variant="outline-danger"
                                            size="sm"
                                            @click="deleteRegister(row.item.id)"
                                            v-if="row.item.status=='Menunggu Verifikasi' && (level=='unitkerja' || level=='admin')"
                                        >
                                            <i class="fa fa-trash"></i>
                                        </b-button>
                                </template>
                            </b-table>

                            <b-row>
                                <b-col class="my-1">
                                    <b-pagination
                                        v-model="currentPage"
                                        :total-rows="rows"
                                        :per-page="perPage"
                                        align="right"
                                        size="sm"
                                        class="my-0"
                                    ></b-pagination>
                                </b-col>
                            </b-row>

                            <b-modal
                                @shown="focusMyElement"
                                ref="my-modal"
                                :id="infoModal.id"
                                :title="infoModal.title"
                                @hide="resetInfoModal"
                                hide-footer
                            >
                            </b-modal>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { validationMixin } from "vuelidate";
import { required, minLength } from "vuelidate/lib/validators";

export default {
    mixins: [validationMixin],
    data() {
        return {
             //state loggedIn with localStorage
            loggedIn: localStorage.getItem('loggedIn'),
            //state token
            token: localStorage.getItem('token'),
            //state user logged In

            perPage: 10,
            editMode: false,
            detailMode: false,
            loading: false,
            pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
            currentPage: 1,
            filter: "",
            selectedpossibility: "",
            registers: [],
            selectedconsequence: "",
            selectedregister: "",
            hasilkali: 0,
            possibilities: [],
            consequences: [],
            mitigasis: [],
            items: [],
            level:null,
            year: [
                { value: "2020", text: "2020" },
                { value: "2021", text: "2021" },
                { value: "2022", text: "2022" },
                { value: "2023", text: "2023" },
                { value: "2024", text: "2024" }
            ],
            risk: [
                { value: "Rendah", text: "Rendah" },
                { value: "Sedang", text: "Sedang" },
                { value: "Tinggi", text: "Tinggi" },
                { value: "SangatTinggi", text: "Sangat Tinggi" }
            ],
            fields: [
                {
                    key: "no",
                    sortable: true,
                    tdClass: "text-center",
                    thClass: "text-center"
                },
                {
                    key: "actions",
                    label: "Actions",
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "status",
                    label: "Status",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "units",
                    label: "Unit Kerja",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "category",
                    label: "Kategori",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "activity",
                    label: "Kegiatan",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "lokasi",
                    label: "Lokasi",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "condition",
                    label: "Kondisi",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "threat",
                    label: "Threat",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "vulnerability",
                    label: "Dampak",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "pengendalian",
                    label: "Pengendalian",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "possibility_id",
                    label: "Kemungkinan",
                    sortable: true,
                    tdClass: "text-center nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "consequence_id",
                    label: "Konsekuensi",
                    sortable: true,
                    tdClass: "text-center nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "tingkat_resiko",
                    label: "Tingkat Resiko",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "status_regulasi",
                    label: "Status Regulasi",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "aspek_lingkungan",
                    label: "Aspek Resiko",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "peluang",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "resiko",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "resiko_ditoleransi",
                    sortable: true,
                    tdClass: "text-center nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "cakupan_resiko",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "status_program",
                    sortable: true,
                    tdClass: "text-left nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "created_at",
                    sortable: true,
                    tdClass: "text-center nowrap",
                    thClass: "text-center nowrap"
                },
                {
                    key: "updated_at",
                    sortable: true,
                    tdClass: "text-center nowrap",
                    thClass: "text-center nowrap"
                },
               
            ],
            headvariant: "dark",
            transProps: {
                name: "flip-list"
            },
            sortBy: "created_at",
            sortDesc: true,
            infoModal: {
                id: "info-modal",
                title: ""
            },
            form2: {
                register_id: "",
                mitigasi_id: "",
                program_mitigasi: "",
                possibility_id: "",
                consequence_id: "",
                tingkat_resiko: 0,
                aspek_lingkungan: "",
                resiko_ditoleransi: "",
                keterangan: ""
            },

        };
    },
    validations: {
        form2: {
            register: {},
            program_mitigasi: {
                required,
                minLength: minLength(3)
            },
            possibility_id: {
                required
            },
            consequence_id: {
                required
            },
            tingkat_resiko: {
                required,
                minLength: minLength(1)
            },
            aspek_lingkungan: {
                required,
                minLength: minLength(2)
            },
            resiko_ditoleransi: {
                required,
                minLength: minLength(2)
            },
            keterangan: {
                required,
                minLength: minLength(2)
            }
        }
    },

    mounted() {
        this.loadData();
        /* this.getRegister(); */
        this.getPossibility();
        this.getConsequence();
    },
    created() {
        axios.get('api/user', {headers: {'Authorization': 'Bearer '+this.token}})
        .then(response => {
            //console.log(response.data)
            this.level= response.data.level
            //console.log(this.level)
        })
    },

    methods: {
        loadData() {
            axios.get("api/register").then(response => {
                this.items = Object.values(response.data.data);
            });
        },
      verifiedRegister(id) {
            this.$swal({
                title: "Apakah Kamu Yakin?",
                text: "Akan Memverifikasi Register ini??",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, Verifikasi!"
            }).then(result => {
                if (result.isConfirmed) {
                    axios.put("api/register/" + id+"/verified").then(response => {
                        this.$swal(
                            "Verified!",
                            "Register ini Berhasil di Verifikasi.",
                            "success"
                        );
                        this.loadData();
                    });
                }
            });
        },

        approvedRegister(id) {
            this.$swal({
                title: "Apakah Kamu Yakin?",
                text: "Akan Approved Register ini??",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ya, Approved!"
            }).then(result => {
                if (result.isConfirmed) {
                    axios.put("api/register/" + id+"/approved").then(response => {
                        this.$swal(
                            "Approved",
                            "Register ini Berhasil di Approved.",
                            "success"
                        );
                        this.loadData();
                    });
                }
            });
        },

        approved(){
            //
        },
        getRegister() {
            axios.get("api/register").then(response => {
                this.registers = Object.values(response.data.data);
                let cat = $.map(this.registers, function(t) {
                    return {
                        label: t.id,
                        value: t.id
                    };
                });
                this.registers = cat;
            });
        },
        getPossibility() {
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
            axios.get("api/consequence").then(response => {
                this.consequences = Object.values(response.data.data);
                let cat = $.map(this.consequences, function(t) {
                    return {
                        label: t.nilai + " - " + t.konsekuensi + "",
                        value: t.nilai
                    };
                });
                this.consequences = cat;
            });
        },
        focusMyElement() {
            this.$refs.registerReff.focus();
        },

        perkalian() {
            this.form2.possibility_id = this.selectedpossibility.value;
            this.form2.consequence_id = this.selectedconsequence.value;
            if (
                this.form2.possibility_id == null ||
                this.form2.consequence_id == null
            ) {
                this.hasilkali = 0;
            } else {
                this.hasilkali =
                    parseInt(this.form2.possibility_id) *
                    parseInt(this.form2.consequence_id);
            }

            if (this.hasilkali <= 4) {
                this.labelresiko = "Rendah";
            } else if (this.hasilkali >= 5 && this.hasilkali <= 9) {
                this.labelresiko = "Sedang";
            } else if (this.hasilkali >= 10 && this.hasilkali <= 16) {
                this.labelresiko = "Tinggi";
                this.form2.tingkat_resiko = this.labelresiko;

                this.cekresiko();
            }
        },
        cekresiko() {
            if (
                this.labelresiko == "Sangat Tinggi" ||
                this.labelresiko == "Tinggi"
            ) {
                this.form2.resiko_ditoleransi = "Ya";
            } else if (
                this.labelresiko == "Sedang" ||
                this.labelresiko == "Rendah"
            ) {
                this.form2.resiko_ditoleransi = "Tidak";
            } else {
                this.form2.resiko_ditoleransi = "";
            }
        },
        openModal(tipe, title, button, item) {
            if (tipe == "mitigasi") {
                this.editMode = false;
                this.detailMode = true;
                this.form2.id = item.id;
                this.form2.register_id = item.id;
                this.form2.mitigasi_id = "";
                this.form2.program_mitigasi = "";
                this.form2.possibility_id = "";
                this.form2.consequence_id = "";
                this.form2.tingkat_resiko = "";
                this.form2.aspek_lingkungan = "";
                this.form2.resiko_ditoleransi = "";
                this.form2.keterangan = "";
            } else {
                this.editMode = false;
                this.form2.program_mitigasi = "";
                this.form2.possibility_id = "";
                this.form2.consequence_id = "";
                this.form2.tingkat_resiko = "";
                this.form2.aspek_lingkungan = "";
                this.form2.resiko_ditoleransi = "";
                this.form2.keterangan = "";
            }

            this.infoModal.title = title;
            this.$root.$emit("bv::show::modal", this.infoModal.id, button);
        },
          downloadPDF(){
                 axios({
                    url: "api/cetakregister",
                    method: 'GET',
                    responseType: 'blob',
                    }).then((response) => {
                        var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                        var fileLink = document.createElement('a');
                        fileLink.href = fileURL;
                        fileLink.setAttribute('download', 'file.pdf');
                        document.body.appendChild(fileLink);
                        fileLink.click();

            });

        },
        resetInfoModal() {
            this.infoModal.title = "";
            this.$nextTick(() => {
                this.$v.$reset();
            });
        },
        hideModal() {
            this.$refs["my-modal"].hide();
        },
        /*  validateState(register) {
            const { $dirty, $error } = this.$v.form2[register];
            return $dirty ? !$error : null;
        }, */
        validateState(program_mitigasi) {
            const { $dirty, $error } = this.$v.form2[program_mitigasi];
            return $dirty ? !$error : null;
        },

        validateState(tingkat_resiko) {
            const { $dirty, $error } = this.$v.form2[tingkat_resiko];
            return $dirty ? !$error : null;
        },
        validateState(aspek_lingkungan) {
            const { $dirty, $error } = this.$v.form2[aspek_lingkungan];
            return $dirty ? !$error : null;
        },
        validateState(resiko_ditoleransi) {
            const { $dirty, $error } = this.$v.form2[resiko_ditoleransi];
            return $dirty ? !$error : null;
        },
        validateState(keterangan) {
            const { $dirty, $error } = this.$v.form2[keterangan];
            return $dirty ? !$error : null;
        },
        async store2() {
            this.form2.possibility_id = this.selectedpossibility.value;
            this.form2.consequence_id = this.selectedconsequence.value;
            this.$v.form2.$touch();
            if (this.$v.form2.$anyError) {
                return;
            }
            try {
                let response = await axios.post("api/mitigasi", this.form2);
                //console.log(response.status);
                if (response.status == 200) {
                    this.form2.register_id = "";
                    this.form2.program_mitigasi = "";
                    this.form2.possibility_id = "";
                    this.form2.consequence_id = "";
                    this.form2.tingkat_resiko = "";
                    this.form2.aspek_lingkungan = "";
                    this.form2.resiko_ditoleransi = "";
                    /* this.form.keterangan =''; */
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "Mitigasi Added successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                console.log(e.response.data.errors);
            }
        },
        deleteRegister(id) {
            this.$swal({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then(result => {
                if (result.isConfirmed) {
                    axios.delete("api/register/" + id).then(response => {
                        this.$swal(
                            "Deleted!",
                            "Your file has been deleted.",
                            "success"
                        );
                        this.loadData();
                    });
                }
            });
        },
        deleteMitigasi(id) {
            this.$swal({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then(result => {
                if (result.isConfirmed) {
                    axios.delete("api/mitigasi/" + id).then(response => {
                        this.$swal(
                            "Deleted!",
                            "Your file has been deleted.",
                            "success"
                        );
                        this.loadData();
                    });
                }
            });
        }
    },

    computed: {
        rows() {
            return this.items.length;

        }
    }
};
</script>
<style>
table#my-table .flip-list-move {
    transition: transform 1s;
}

.nowrap {
    white-space: nowrap;
}
</style>




