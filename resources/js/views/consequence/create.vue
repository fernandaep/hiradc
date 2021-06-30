<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">New Consequence</div>
                    <div class="card-body">
                        <form action="#" method="post" @submit.prevent="store">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"
                                    >Category</label
                                >
                                <div class="col-sm-10">
                                    <b-form-group
                                        id="kategorigroup"
                                        label-for="kategori"
                                    >
                                        <v-select
                                            v-model="selected"
                                            :options="categories"
                                        >
                                            <template
                                                #search="{attributes, events}"
                                            >
                                                <input
                                                    class="vs__search"
                                                    :required="!selected"
                                                    v-bind="attributes"
                                                    v-on="events"
                                                    ref="kategoriReff"
                                                />
                                            </template>
                                        </v-select>
                                    </b-form-group>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="nilai"
                                    class="col-sm-2 col-form-label"
                                    >Nilai</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.nilai"
                                        class="form-control"
                                        id="nilai"
                                    />
                                    <div
                                        v-if="theErrors.nilai"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.nilai[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="konsekuensi"
                                    class="col-sm-2 col-form-label"
                                    >Konsekuensi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.konsekuensi"
                                        class="form-control"
                                        id="konsekuensi"
                                    />
                                    <div
                                        v-if="theErrors.konsekuensi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.konsekuensi[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="financial"
                                    class="col-sm-2 col-form-label"
                                    >Financial</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.financial"
                                        class="form-control"
                                        id="financial"
                                    />
                                    <div
                                        v-if="theErrors.financial"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.financial[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="objective"
                                    class="col-sm-2 col-form-label"
                                    >Objective</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.objective"
                                        class="form-control"
                                        id="objective"
                                    />
                                    <div
                                        v-if="theErrors.objective"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.objective[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="legal"
                                    class="col-sm-2 col-form-label"
                                    >Legal</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.legal"
                                        class="form-control"
                                        id="legal"
                                    />
                                    <div
                                        v-if="theErrors.legal"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.legal[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="biaya"
                                    class="col-sm-2 col-form-label"
                                    >Biaya</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.biaya"
                                        class="form-control"
                                        id="biaya"
                                    />
                                    <div
                                        v-if="theErrors.biaya"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.biaya[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="reputasi"
                                    class="col-sm-2 col-form-label"
                                    >Reputasi</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.reputasi"
                                        class="form-control"
                                        id="reputasi"
                                    />
                                    <div
                                        v-if="theErrors.reputasi"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.reputasi[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="cakupan"
                                    class="col-sm-2 col-form-label"
                                    >Cakupan</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.cakupan"
                                        class="form-control"
                                        id="cakupan"
                                    />
                                    <div
                                        v-if="theErrors.cakupan"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.cakupan[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="lama_pemulihan"
                                    class="col-sm-2 col-form-label"
                                    >Lama Pemulihan</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.lama_pemulihan"
                                        class="form-control"
                                        id="lama_pemulihan"
                                    />
                                    <div
                                        v-if="theErrors.lama_pemulihan"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.lama_pemulihan[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="lama_penyimpangan"
                                    class="col-sm-2 col-form-label"
                                    >Lama Penyimpangan</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.lama_penyimpangan"
                                        class="form-control"
                                        id="lama_penyimpangan"
                                    />
                                    <div
                                        v-if="theErrors.lama_penyimpangan"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.lama_penyimpangan[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="product_image"
                                    class="col-sm-2 col-form-label"
                                    >Product Image</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.product_image"
                                        class="form-control"
                                        id="product_image"
                                    />
                                    <div
                                        v-if="theErrors.product_image"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.product_image[0] }}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label
                                    for="dampak_sosial"
                                    class="col-sm-2 col-form-label"
                                    >Dampak Sosial</label
                                >
                                <div class="col-sm-10">
                                    <input
                                        type="text"
                                        v-model="form.dampak_sosial"
                                        class="form-control"
                                        id="dampak_sosial"
                                    />
                                    <div
                                        v-if="theErrors.dampak_sosial"
                                        class="mt2 text-danger"
                                    >
                                        {{ theErrors.dampak_sosial[0] }}
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
            },
            validations: {
                form: {
                    category_id: {
                        required
                    },
                    nilai: {
                        required
                    },
                    konsekuensi: {
                        required
                    },
                    financial: {
                        required
                    },
                    objective: {
                        required
                    },
                    legal: {
                        required
                    },
                    biaya: {
                        required
                    },
                    reputasi: {
                        required
                    },
                    cakupan: "",
                    lama_pemulihan: "",
                    lama_penyimpangan: "",
                    product_image: "",
                    dampak_sosial: ""
                }
            },
            items: [],
            theErrors: [],
            selected: "",
            categories: []
        };
    },
    mounted() {
        this.loadData();
        this.getCategory();
    },
    methods: {
        loadData() {
            axios.get("api/consequence").then(response => {
                this.items = Object.values(response.data);
                //console.log(Object.values(response.data));
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

        async store() {
            try {
                /* this.form.category_id = this.selected.value; */
                let response = await axios.post("api/consequence", this.form);
                //console.log(response.status);
                if (response.status == 200) {
                    this.form.category_id = "";
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
