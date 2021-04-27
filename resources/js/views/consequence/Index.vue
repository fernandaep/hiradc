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
                        <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
                      </b-input-group-append>
                    </b-input-group>
                  </b-form-group>
                </b-col>
              </b-row>
              <br>
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
                small striped hover responsive
              >
              <template #cell(no)="row">
                {{ row.index + 1 }}
              </template>
              <template #cell(created_at)="row">
                {{ row.item.created_at | formatDate}}
              </template>
              <template #cell(updated_at)="row">
                {{ row.item.updated_at | formatDate}}
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
                  <b-button variant="outline-danger" size="sm" @click="deleteConsequence(row.item.id)">
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
        headvariant:'dark',
        transProps: {
          name: 'flip-list'
        },
        sortBy: 'created_at',
        sortDesc: true,
        infoModal: {
          id: 'info-modal',
          title: '',
        },
       form: {
                id: "",
                category_id: "",
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
      }
    },
    mounted() {
        this.loadData();
    },
    methods: {
        loadData() {
            axios.get("api/consequence").then(response => {
                this.items = Object.values(response.data.data);
                //console.log(Object.values(response.data));
            });
        },

      deleteConsequence(id) { 
        this.$swal({
          title: 'Are you sure?',
          text: "You won't be able to revert this!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
          if (result.isConfirmed) {
            axios.delete("api/consequence/"+id).then(response => {
              this.$swal(
                  'Deleted!',
                  'Your file has been deleted.',
                  'success'
              )
              this.loadData();
            });
            
          }
        })
      },
    },
    computed: {
      rows() {
        return this.items.length
      }
    },
  }
</script>
<style>
table#my-table .flip-list-move {
  transition: transform 1s;
}
</style>