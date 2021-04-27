<template>
    <div class="overflow-auto">
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                Konsekuensi
                            </h3>
                        </div>
                        <div class="card-body">
                            <b-row class="p-20">
                                <b-col>
                                    <router-link
                                        :to="{ name: 'consequence.create' }"
                                        class="btn btn-outline-primary"
                                    >
                                        <i class="fas fa-plus"></i> Add New
                                    </router-link>
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
                                    <b-button variant="outline-info" size="sm">
                                        <router-link
                                            :to="{
                                                name: 'consequence.edit',
                                                params: { id: row.item.id }
                                            }"
                                            class="btn btn-outline-primary"
                                        >
                                            <i class="fa fa-edit"></i> Edit
                                        </router-link>
                                    </b-button>
                                    <b-button
                                        variant="outline-danger"
                                        size="sm"
                                        @click="deleteConsequence(row.item.id)"
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
                                            id="example-input-group-1"
                                            label="nilai"
                                            label-for="nilai"
                                        >
                                            <b-form-input
                                                id="nilai"
                                                name="nilai"
                                                ref="nilaiReff"
                                                v-model="$v.form.nilai.$model"
                                                :state="validateState('nilai')"
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
            loading: false,
            pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
            currentPage: 1,
            filter: "",
            items: [],
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
                    key: "category_id",
                    label: "Kategori",
                    sortable: true
                },
                {
                    key: "nilai",
                    label: "nilai",
                    sortable: true
                },
                {
                    key: "konsekuensi",
                    label: "konsekuensi",
                    sortable: true
                },
                {
                    key: "financial",
                    label: "financial",
                    sortable: true
                },
                {
                    key: "objective",
                    label: "objective",
                    sortable: true
                },
                {
                    key: "legal",
                    label: "legal",
                    sortable: true
                },
                {
                    key: "biaya",
                    label: "biaya",
                    sortable: true
                },
                {
                    key: "reputasi",
                    label: "reputasi",
                    sortable: true
                },
                {
                    key: "cakupan",
                    label: "cakupan",
                    sortable: true
                },
                {
                    key: "lama_pemulihan",
                    label: "lama_pemulihan",
                    sortable: true
                },
                {
                    key: "lama_penyimpangan",
                    label: "lama_penyimpangan",
                    sortable: true
                },
                {
                    key: "product_image",
                    label: "product_image",
                    sortable: true
                },
                {
                    key: "dampak_sosial",
                    label: "dampak_sosial",
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
            form: {
                id: "",
                nilai: "",
                konsekuensi: "",
                financial: "",
                objective: "",
                legal: "",
                biaya: "",
                reputasi: "",
                cakupan: "",
                lama_pemulihan: "",
                lama_penyimpangan: "",
                product_image: "",
                dampak_sosial: ""
            }
        };
    },
    validations: {
        form: {
            nilai: {
                required,
                minLength: minLength(1)
            },
            konsekuensi: {
                required,
                minLength: minLength(1)
            },
            financial: {
                required,
                minLength: minLength(1)
            },
            objective: {
                required,
                minLength: minLength(1)
            },
            legal: {
                required,
                minLength: minLength(1)
            },
            biaya: {
                required,
                minLength: minLength(3)
            },
            reputasi: {
                required,
                minLength: minLength(3)
            },
            cakupan: "",
            lama_pemulihan: "",
            lama_penyimpangan: "",
            product_image: "",
            dampak_sosial: ""
        }
    },
    mounted() {
        this.loadData();
    },
    methods: {
        loadData() {
            axios.get("api/consequence").then(response => {
                this.items = Object.values(response.data);
                //console.log(Object.values(response.data));
            });
        },
        focusMyElement() {
            this.$refs.nilaiReff.focus();
        },

        openModal(tipe, title, button, item) {
            if (tipe == "edit") {
                this.editMode = true;
                this.form.nilai = item.nilai;
                this.form.konsekuensi = item.konsekuensi;
                this.form.financial = item.financial;
                this.form.objective = item.objective;
                this.form.legal = item.legal;
                this.form.biaya = item.biaya;
                this.form.reputasi = item.reputasi;
                this.form.cakupan = item.cakupan;
                this.form.lama_pemulihan = item.lama_pemulihan;
                this.form.lama_penyimpangan = item.lama_penyimpangan;
                this.form.product_image = item.product_image;
                this.form.dampak_sosial = item.dampak_sosial;
            } else {
                this.editMode = false;
                this.form.nilai = "";
                this.form.konsekuensi = "";
                this.form.financial = "";
                this.form.objective = "";
                this.form.legal = "";
                this.form.biaya = "";
                this.form.reputasi = "";
                this.form.cakupan = "";
                this.form.lama_pemulihan = "";
                this.form.lama_penyimpangan = "";
                this.form.product_image = "";
                this.form.dampak_sosial = "";
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
        validateState(nilai) {
            const { $dirty, $error } = this.$v.form[nilai];
            return $dirty ? !$error : null;
        },
        validateState(konsekuensi) {
            const { $dirty, $error } = this.$v.form[konsekuensi];
            return $dirty ? !$error : null;
        },
        validateState(financial) {
            const { $dirty, $error } = this.$v.form[financial];
            return $dirty ? !$error : null;
        },
        validateState(objective) {
            const { $dirty, $error } = this.$v.form[objective];
            return $dirty ? !$error : null;
        },
        validateState(legal) {
            const { $dirty, $error } = this.$v.form[legal];
            return $dirty ? !$error : null;
        },
        validateState(biaya) {
            const { $dirty, $error } = this.$v.form[biaya];
            return $dirty ? !$error : null;
        },
        validateState(reputasi) {
            const { $dirty, $error } = this.$v.form[reputasi];
            return $dirty ? !$error : null;
        },
        validateState(cakupan) {
            const { $dirty, $error } = this.$v.form[cakupan];
            return $dirty ? !$error : null;
        },
        validateState(lama_pemulihan) {
            const { $dirty, $error } = this.$v.form[lama_pemulihan];
            return $dirty ? !$error : null;
        },
        validateState(lama_penyimpangan) {
            const { $dirty, $error } = this.$v.form[lama_penyimpangan];
            return $dirty ? !$error : null;
        },
        validateState(product_image) {
            const { $dirty, $error } = this.$v.form[product_image];
            return $dirty ? !$error : null;
        },
        validateState(dampak_sosial) {
            const { $dirty, $error } = this.$v.form[dampak_sosial];
            return $dirty ? !$error : null;
        },

        async store() {
            this.$v.form.$touch();
            if (this.$v.form.$anyError) {
                return;
            }
            try {
                let response = await axios.post("api/consequence", this.form);
                //console.log(response.status);
                if (response.status == 200) {
                    this.form.nilai = "";
                    this.form.konsekuensi = "";
                    this.form.financial = "";
                    this.form.objective = "";
                    this.form.legal = "";
                    this.form.biaya = "";
                    this.form.reputasi = "";
                    this.form.cakupan = "";
                    this.form.lama_pemulihan = "";
                    this.form.lama_penyimpangan = "";
                    this.form.product_image = "";
                    this.form.dampak_sosial = "";
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "Consequence Added successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                console.log(e.response.data.errors);
            }
        },

        async update() {
            this.$v.form.$touch();
            if (this.$v.form.$anyError) {
                return;
            }
            try {
                let id = this.form.id;
                let updated = await axios.put(
                    "api/consequence/" + id,
                    this.form
                );
                if (updated.status == 200) {
                    this.form.nilai = "";
                    this.form.konsekuensi = "";
                    this.form.financial = "";
                    this.form.objective = "";
                    this.form.legal = "";
                    this.form.biaya = "";
                    this.form.reputasi = "";
                    this.form.cakupan = "";
                    this.form.lama_pemulihan = "";
                    this.form.lama_penyimpangan = "";
                    this.form.product_image = "";
                    this.form.dampak_sosial = "";
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "Consequence Updated successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                this.$swal({
                    icon: "Error",
                    title:
                        "Consequence Updated Failed " + e.response.data.errors
                });
                this.theErrors = e.response.data.errors;
            }
        },

        deleteConsequence(id) {
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
                    axios.delete("api/consequence/" + id).then(response => {
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
