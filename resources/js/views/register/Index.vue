<template>
    <div class="overflow-auto">
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                Register
                            </h3>
                        </div>
                        <div class="card-body">
                            <b-row class="p-20">
                                <b-col lg="2">
                                    <router-link
                                        :to="{ name: 'register.create' }"
                                        class="btn btn-outline-primary"
                                    >
                                        <i class="fas fa-plus"></i> Add New
                                    </router-link>
                                </b-col>
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
                                <b-col lg="5" class="my-1">
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
                                <template #row-details="row">
                                    <b-card>
                                        <div class="ml-5 pr-5">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>
                                                            Kegiatan
                                                        </th>
                                                        <th>
                                                            Program Mitigasi
                                                        </th>
                                                        <th>Kemungkinan</th>
                                                        <th>Konsekuensi</th>
                                                        <th>Tingkat Resiko</th>
                                                        <th>
                                                            Aspek Lingkungan
                                                        </th>
                                                        <th>
                                                            Resiko Ditoleransi
                                                        </th>
                                                        <th>Keterangan</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr
                                                        v-for="(value,
                                                        key) in row.item
                                                            .mitigasi"
                                                        :key="key"
                                                    >
                                                        <td>{{ key + 1 }}</td>
                                                        <td>
                                                            {{ value.register }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.program_mitigasi
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.possibility_id
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.consequence_id
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.tingkat_resiko
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.aspek_lingkungan
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.resiko_ditoleransi
                                                            }}
                                                        </td>
                                                        <td>
                                                            {{
                                                                value.keterangan
                                                            }}
                                                        </td>
                                                        <td>
                                                            <b-button
                                                                variant="outline-info"
                                                                size="sm"
                                                                @click="
                                                                    openModal(
                                                                        'mitigasi',
                                                                        'Edit ID : ' +
                                                                            row
                                                                                .item
                                                                                .id,
                                                                        $event.target,
                                                                        row.item
                                                                    )
                                                                "
                                                                class="mr-1"
                                                            >
                                                                <i
                                                                    class="fa fa-edit"
                                                                ></i>
                                                            </b-button>
                                                            <b-button
                                                                variant="outline-danger"
                                                                size="sm"
                                                                @click="
                                                                    deleteMitigasi(
                                                                        value.id
                                                                    )
                                                                "
                                                            >
                                                                <i
                                                                    class="fa fa-trash"
                                                                ></i>
                                                            </b-button>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </b-card>
                                </template>
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
                                    <b-button
                                        variant="outline-info"
                                        size="sm"
                                        @click="row.toggleDetails"
                                        class="mr-1"
                                    >
                                        <i class="fa fa-eye"></i>
                                    </b-button>
                                    <b-button
                                        variant="outline-success"
                                        size="sm"
                                        @click="
                                            openModal(
                                                'mitigasi',
                                                'Tambah Mitigasi',
                                                $event.target,
                                                row.item
                                            )
                                        "
                                        class="mr-1"
                                    >
                                        <i class="fa fa-plus"></i>
                                    </b-button>
                                    <b-button variant="outline-info" size="sm">
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
                                <form
                                    @submit.prevent="
                                        editMode ? update() : store2()
                                    "
                                >
                                    <div class="modal-body">
                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Kegiatan"
                                            label-for="register_id"
                                        >
                                            <b-form-input
                                                id="register_id"
                                                name="register_id"
                                                ref="registerReff"
                                                v-model="
                                                    $v.form2.kegiatan.$model
                                                "
                                                aria-describedby="input-1-live-feedback"
                                                readonly
                                            ></b-form-input>

                                            <b-form-invalid-feedback
                                                id="input-1-live-feedback"
                                                >This is a required field.
                                            </b-form-invalid-feedback>
                                        </b-form-group>
                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Program Mitigasi"
                                            label-for="program_mitigasi"
                                        >
                                            <b-form-input
                                                id="program_mitigasi"
                                                name="program_mitigasi"
                                                ref="program_mitigasiReff"
                                                v-model="
                                                    $v.form2.program_mitigasi
                                                        .$model
                                                "
                                                :state="
                                                    validateState(
                                                        'program_mitigasi'
                                                    )
                                                "
                                                aria-describedby="input-1-live-feedback"
                                            ></b-form-input>

                                            <b-form-invalid-feedback
                                                id="input-1-live-feedback"
                                                >This is a required field.
                                            </b-form-invalid-feedback>
                                        </b-form-group>

                                        <b-form-group
                                            id="possibilitygroup"
                                            label="Kemungkinan"
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

                                        <b-form-group
                                            id="consequencegroup"
                                            label="Konsekuensi"
                                            label-for="consequence"
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
                                                        ref="consequencesReff"
                                                    />
                                                </template>
                                            </v-select>
                                        </b-form-group>

                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Tingkat Resiko"
                                            label-for="tingkat_resiko"
                                        >
                                            <b-form-input
                                                id="tingkat_resiko"
                                                name="tingkat_resiko"
                                                ref="tingkat_resikoReff"
                                                v-model="
                                                    $v.form2.tingkat_resiko
                                                        .$model
                                                "
                                                :state="
                                                    validateState(
                                                        'tingkat_resiko'
                                                    )
                                                "
                                                aria-describedby="input-1-live-feedback"
                                                readonly
                                            ></b-form-input>
                                            <b-form-invalid-feedback
                                                id="input-1-live-feedback"
                                                >This is a required field.
                                            </b-form-invalid-feedback>
                                        </b-form-group>

                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Aspek Lingkungan"
                                            label-for="aspek_lingkungan"
                                        >
                                            <v-select
                                                :options="[
                                                    'Penting',
                                                    'Tidak Penting'
                                                ]"
                                                v-model="
                                                    $v.form2.aspek_lingkungan
                                                        .$model
                                                "
                                                :state="
                                                    validateState(
                                                        'aspek_lingkungan'
                                                    )
                                                "
                                            ></v-select>
                                        </b-form-group>

                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Resiko Ditoleransi"
                                            label-for="resiko_ditoleransi"
                                        >
                                            <b-form-input
                                                id="resiko_ditoleransi"
                                                name="resiko_ditoleransi"
                                                ref="resiko_ditoleransiReff"
                                                v-model="
                                                    $v.form2.resiko_ditoleransi
                                                        .$model
                                                "
                                                :state="
                                                    validateState(
                                                        'resiko_ditoleransi'
                                                    )
                                                "
                                                aria-describedby="input-1-live-feedback"
                                                readonly
                                            ></b-form-input>
                                        </b-form-group>

                                        <b-form-group
                                            id="example-input-group-1"
                                            label="Keterangan"
                                            label-for="keterangan"
                                        >
                                            <b-form-input
                                                id="keterangan"
                                                name="keterangan"
                                                ref="keteranganReff"
                                                v-model="
                                                    $v.form2.keterangan.$model
                                                "
                                                :state="
                                                    validateState('keterangan')
                                                "
                                                aria-describedby="input-1-live-feedback"
                                            ></b-form-input>
                                            <b-form-invalid-feedback
                                                id="input-1-live-feedback"
                                                >This is a required field.
                                            </b-form-invalid-feedback>
                                        </b-form-group>
                                    </div>
                                    <div class="modal-footer">
                                        <button
                                            type="button"
                                            class="btn btn-danger"
                                            @click="hideModal"
                                        >
                                            Close
                                        </button>
                                        <button
                                            type="submit"
                                            v-show="editMode"
                                            class="btn btn-primary"
                                        >
                                            Update
                                        </button>
                                        <button
                                            type="submit"
                                            v-show="!editMode"
                                            class="btn btn-primary"
                                        >
                                            Create
                                        </button>
                                    </div>
                                </form>
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
            perPage: 10,
            editMode: false,
            detailMode: false,
            loading: false,
            pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
            currentPage: 1,
            filter: "",
            selectedpossibility: "",
            registers: "",
            selectedconsequence: "",
            hasilkali: 0,
            possibilities: [],
            consequences: [],
            mitigasis: [],
            items: [],
            year: [
                { value: "2020", text: "2020" },
                { value: "2021", text: "2021" },
                { value: "2022", text: "2022" },
                { value: "2023", text: "2023" },
                { value: "2024", text: "2024" }
            ],
            fields: [
                {
                    key: "no",
                    sortable: true,
                    tdClass: "text-center",
                    thClass: "text-center"
                },
                {
                    key: "category",
                    label: "Kategori",
                    sortable: true
                },
                {
                    key: "activity",
                    label: "Kegiatan",
                    sortable: true
                },
                {
                    key: "lokasi",
                    label: "Lokasi",
                    sortable: true
                },
                {
                    key: "condition",
                    label: "Kondisi",
                    sortable: true
                },
                {
                    key: "threat",
                    label: "Threat",
                    sortable: true
                },
                {
                    key: "pengendalian",
                    label: "Pengendalian",
                    sortable: true
                },
                {
                    key: "possibility_id",
                    label: "Kemungkinan",
                    sortable: true
                },
                {
                    key: "consequence_id",
                    label: "Konsekuensi",
                    sortable: true
                },
                {
                    key: "tingkat_resiko",
                    label: "Tingkat Resiko",
                    sortable: true
                },
                {
                    key: "status_regulasi",
                    label: "Status Regulasi",
                    sortable: true
                },
                {
                    key: "aspek_lingkungan",
                    label: "Aspek Resiko",
                    sortable: true
                },
                {
                    key: "peluang",
                    sortable: true
                },
                {
                    key: "resiko",
                    sortable: true
                },
                {
                    key: "resiko_ditoleransi",
                    sortable: true
                },
                {
                    key: "cakupan_resiko",
                    sortable: true
                },
                {
                    key: "status_program",
                    sortable: true
                },
                {
                    key: "created_at",
                    sortable: true,
                    tdClass: "text-right",
                    thClass: "text-center"
                },
                {
                    key: "updated_at",
                    sortable: true,
                    tdClass: "text-right",
                    thClass: "text-center"
                },
                {
                    key: "actions",
                    label: "Actions",
                    tdClass: "text-center",
                    thClass: "text-center"
                }
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
                keterangan: "",
                kegiatan:"",
            }
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
        this.getPossibility();
        this.getConsequence();
    },
    methods: {
        loadData() {
            axios.get("api/register").then(response => {
                this.items = Object.values(response.data.data);
                console.log(Object.values(response.data.data));
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
            } else {
                this.labelresiko = "Sangat Tinggi";
            }
            this.resiko = this.hasilkali + " - " + this.labelresiko;
            this.form2.tingkat_resiko = this.labelresiko;

            this.cekresiko();
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
                this.form2.kegiatan = item.kegiatan;
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

        resetInfoModal() {
            this.infoModal.title = "";
            this.$nextTick(() => {
                this.$v.$reset();
            });
        },
        hideModal() {
            this.$refs["my-modal"].hide();
        },
        validateState(register) {
            const { $dirty, $error } = this.$v.form2[register];
            return $dirty ? !$error : null;
        },
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
</style>
