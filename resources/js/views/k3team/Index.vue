<template>
    <div class="overflow-auto">
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                Unit Kerja
                            </h3>
                        </div>
                        <div class="card-body">
                            <b-row class="p-20">
                                <b-col>
                                    <b-button
                                        variant="outline-success"
                                        size="sm"
                                        @click="
                                            openModal(
                                                'save',
                                                'SAVE',
                                                $event.target
                                            )
                                        "
                                    >
                                        Add New <i class="fas fa-plus"></i>
                                    </b-button>
                                </b-col>
                                <b-col sm="4" md="2" class="my-1">
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
                                <b-col lg="8" class="my-1">
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
                                    <b-button
                                        variant="outline-info"
                                        size="sm"
                                        @click="
                                            openModal(
                                                'edit',
                                                'Edit ID : ' + row.item.id,
                                                $event.target,
                                                row.item
                                            )
                                        "
                                        class="mr-1"
                                    >
                                        <i class="fa fa-edit"></i>
                                    </b-button>
                                    <b-button
                                        variant="outline-danger"
                                        size="sm"
                                        @click="deleteK3team(row.item.id)"
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
                            <!-- Info modal -->
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
                                        editMode ? update() : store()
                                    "
                                >
                                    <div class="modal-body">
                                        <b-form-group
                                            id="unit_kerja"
                                            label="Unit Kerja"
                                            label-for="unit_kerja"
                                        >
                                            <v-select
                                                v-model="selectedunitkerja"
                                                :options="units"
                                                @change="getkoor"
                                    
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
                                                        ref="unit_kerjaReff"
                                                    />
                                                </template>
                                            </v-select>
                                        </b-form-group>
                                        <b-form-group
                                            id="nik_dept"
                                            label="NIK Koordinator"
                                            label-for="koordinator"
                                        >
                                            <v-select
                                                v-model="selectedkoordinator"
                                                :options="koordinator"
                                            >
                                                <template
                                                    #search="{attributes, events}"
                                                >
                                                    <input
                                                        class="vs__search"
                                                        :required="
                                                            !selectedkoordinator
                                                        "
                                                        v-bind="attributes"
                                                        v-on="events"
                                                        ref="koordinatorReff"
                                                    />
                                                </template>
                                            </v-select>
                                        </b-form-group>
                                        <b-form-group
                                            id="nik_ketua"
                                            label="NIK ketua"
                                            label-for="kaunit"
                                        >
                                            <v-select
                                                v-model="selectedketua"
                                                :options="ketua"
                                            >
                                                <template
                                                    #search="{attributes, events}"
                                                >
                                                    <input
                                                        class="vs__search"
                                                        :required="
                                                            !selectedketua
                                                        "
                                                        v-bind="attributes"
                                                        v-on="events"
                                                        ref="ketuaReff"
                                                    />
                                                </template>
                                            </v-select>
                                        </b-form-group>
                                        <b-form-group
                                            id="nik_pic"
                                            label="NIK PIC Unit"
                                            label-for="pic"
                                        >
                                            <v-select
                                                v-model="selectedpic"
                                                :options="pic"
                                            >
                                                <template
                                                    #search="{attributes, events}"
                                                >
                                                    <input
                                                        class="vs__search"
                                                        :required="!selectedpic"
                                                        v-bind="attributes"
                                                        v-on="events"
                                                        ref="picReff"
                                                    />
                                                </template>
                                            </v-select>
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
            loading: false,
            pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
            currentPage: 1,
            selectedkoordinator: "",
            selectedketua: "",
            selectedunitkerja: "",
            unit_kerja: [],
            koordinator: [],
            ketua: [],
            pic: [],
            selectedpic: "",
            filter: "",
            items: [],
            karyawans: [],
            units: [],
            fields: [
                {
                    key: "no",
                    sortable: true,
                    tdClass: "text-center",
                    thClass: "text-center"
                },
                {
                    key: "id",
                    sortable: true
                },
                {
                    key: "unit_kerja",
                    label: "Unit Kerja",
                    sortable: true
                },
                {
                    key: "koordinator",
                    label: "Koordinator",
                    sortable: true
                },
                {
                    key: "ketua",
                    label: "Ketua",
                    sortable: true
                },
                {
                    key: "pic",
                    label: "PIC",
                    sortable: true
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
            form: {
                id: "",
                karyawan_nik: ""
                /*  unit_kerja :'',
          koordinator :'',
          ketua :'',
          pic :'', */
            }
        };
    },

    mounted() {
        this.loadData();
        this.getUnitkerja();
        this.getkoor();
    },
    methods: {
        loadData() {
            axios.get("api/k3team").then(response => {
                this.items = Object.values(response.data.data);
                //console.log(Object.values(response.data));
            });
        },
        getUnitkerja() {
            axios.get("api/unit").then(response => {
                this.units = Object.values(response.data);
                //console.log(this.units);
                let cat = $.map(this.units, function(t) {
                    return { label: t.unit_kerja, value: t.id};
                });
                this.units = cat;
                //console.log(this.karyawans);
            });  
           
        },
        getkoor() {
            let id = this.selectedunitkerja.value;
            axios.get("api/karyawan/" + id + "/getkoor").then(response => {
                this.koordinator = Object.values(response.data);
                console.log(this.koordinator)
                let cat = $.map(this.koordinator, function(t) {
                    return {
                        label: t.band +" - " + t.nama + "",
                        value: t.id
                    };
                });
                this.koordinator = cat;
                //console.log(this.koordinator);
            });
             /* axios.get("api/karyawan/" + nik + "/getketua").then(response => {
                this.ketua = Object.values(response.data);
                let cat = $.map(this.ketua, function(t) {
                    return { label: t.band +" - " + t.nama + "", value: t.nik };
                });
                this.ketua=cat; 
                //console.log(this.ketua);
            });
             axios.get("api/karyawan/" + nik + "/getpic").then(response => {
                this.pic = Object.values(response.data);
                let cat = $.map(this.pic, function(t) {
                    return { label: t.nik +" - " + t.nama + "", value: t.nik };
                });
                this.pic=cat; 
                //console.log(this.pic);
            }); */
        },

        openModal(tipe, title, button, item) {
            if (tipe == "edit") {
                this.editMode = true;
                this.form.id = item.id;
                this.form.unit_kerja = item.unit_kerja;
                this.form.karyawan_nik = item.karyawan_nik;
                this.selectedunitkerja = item.karyawan_nik;
                this.selectedunitkerja = { label: item.unit, value: item.unit };
                this.selectedkoordinator = item.karyawan_nik;
                this.selectedkoordinator = {
                    label: item.dept,
                    value: item.dept
                };
                this.selectedketua = item.karyawan_nik;
                this.selectedkoordinator = {
                    label: item.unit,
                    value: item.unit
                };
                this.selectedpic = item.karyawan_nik;
                this.selectedkoordinator = {
                    label: item.nama,
                    value: item.nama
                };
            } else {
                this.editMode = false;
                this.form.unit_kerja = "";
                this.form.karyawan_nik = "";
                this.form.nama = "";
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
        validateState(unit_kerja) {
            const { $dirty, $error } = this.$v.form[unit_kerja];
            return $dirty ? !$error : null;
        },
        async store() {
            this.form.karyawan_nik = this.selectedunitkerja.value;
            this.$v.form.$touch();
            if (this.$v.form.$anyError) {
                return;
            }
            try {
                let response = await axios.post("api/k3team", this.form);
                //console.log(response.status);
                if (response.status == 200) {
                    this.form.karyawan_nik = "";
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "K3Team Added successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                console.log(e.response.data.errors);
            }
        },

        async update() {
            let id = this.form.id;
            this.form.karyawan_nik = this.selectedkoordinator.value;
            this.form.karyawan_nik = this.selectedketua.value;
            this.form.karyawan_nik = this.selectedsekretaris.value;
            this.$v.form.$touch();
            if (this.$v.form.$anyError) {
                return;
            }
            try {
                let updated = await axios.put("api/k3team/" + id, this.form);
                if (updated.status == 200) {
                    this.form.unit_kerja = "";
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "K3Team Updated successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                this.$swal({
                    icon: "Error",
                    title: "K3Team Updated Failed " + e.response.data.errors
                });
                this.theErrors = e.response.data.errors;
            }
        },
        focusMyElement() {
            this.$refs.unit_kerjaReff.focus();
        },
        deleteK3team(id) {
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
                    axios.delete("api/k3team/" + id).then(response => {
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
