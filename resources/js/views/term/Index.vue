<template>
  <div class="overflow-auto">
     <div class="container">
        <div class="row mt-3">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  Istilah 
                </h3>
                
              </div>
              <div class="card-body">
              <b-row class="p-20">
                <b-col>
                  <b-button variant="outline-success" size="sm" @click="openModal('save' , 'SAVE', $event.target)"> 
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

              <template #row-details="row">
                  <b-card>
                    <div class="ml-5 pr-5">
                      <table class="table">
                        <thead>
                          <tr>
                              <th>No</th>
                              <th>Kode</th>
                              <th>Istilah</th>
                              <th>Nama</th>
                              <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(value, key) in row.item.threat" :key="key">
                            <td>{{key + 1 }}</td>
                            <td>{{value.kode }}</td>
                            <td>{{value.istilah }}</td>
                            <td>{{value.nama }}</td>
                            <td>
                              <b-button variant="outline-danger" size="sm" @click="deleteThreat(value.id)">
                                <i class="fa fa-trash"></i>
                                </b-button>
                              </td>

                          </tr>
                        </tbody>
                      </table>
                   </div>
                  </b-card>
                </template>

              <template #cell(no)="row">
                  {{ row.index + 1 }}
                </template>
                <template #cell(actions)="row">
                   <b-button variant="outline-info" size="sm" @click="row.toggleDetails" class="mr-1">
                    <i class='fa fa-eye'></i>
                  </b-button>
                   <b-button variant="outline-success" size="sm" @click="openModal('tambahthreat' , 'Tambah Threat', $event.target,row.item)" class="mr-1">
                    <i class="fa fa-plus"></i>
                  </b-button>
                  <b-button variant="outline-warning" size="sm" @click="openModal('edit' , 'Edit ID : ' +row.item.id, $event.target, row.item)" class="mr-1">
                    <i class="fa fa-edit"></i>
                  </b-button>
                  <b-button variant="outline-danger" size="sm" @click="deleteTerm(row.item.id)">
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
              <b-modal @shown="focusMyElement" ref="my-modal" :id="infoModal.id" :title="infoModal.title" @hide="resetInfoModal" hide-footer>
                <form @submit.prevent="editMode ? update() : store()"> 
                  <div class="modal-body">
                    <b-form-group id="kategorigroup" label="Kategori" label-for="kategori">
                      <v-select v-model="selected"  :options="categories">
                        <template #search="{attributes, events}">
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
                    <b-form-group id="example-input-group-1" label="kode" label-for="kode">
                      <b-form-input
                        id="kode"
                        name="kode"
                        ref="kodeReff"
                        v-model="$v.form.kode.$model"
                        :state="validateState('kode')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                      
                   </b-form-group>
                    <b-form-group id="example-input-group-1" label="Istilah" label-for="istilah">
                      <b-form-input
                        id="istilah"
                        name="istilah"
                        ref="istilahReff"
                        v-model="$v.form.istilah.$model"
                        :state="validateState('istilah')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                   
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" @click="hideModal" >
                      Close
                    </button>
                    <button type="submit" v-show="editMode" class="btn btn-primary">
                      Update
                    </button>
                    <button type="submit" v-show="!editMode"  class="btn btn-primary">
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
        editMode:false,
        loading:false,
        pageOptions: [5, 10, 15, { value: 100, text: "All" }],
        currentPage: 1,
        selected:"",
        filter: "",
        items: [],
        categories:[],
        fields: [
          {
            key: 'no',
            sortable: true,
            tdClass:'text-center',
            thClass:'text-center'
          },
          {
            key: 'id',
            sortable: true
          },
          {
            key: 'category_id',
            label: 'Kategori',
            sortable: true
          },
          {
            key: 'kode',
            sortable: true
          },
          {
            key: 'istilah',
            sortable: true
          },
          {
            key: 'created_at',
            sortable: true,
            tdClass:'text-right',
            thClass:'text-center'
          },
          {
            key: 'updated_at',
            sortable: true,
            tdClass:'text-right',
            thClass:'text-center'
          },
          { 
            key: 'actions', 
            label: 'Actions' ,
            tdClass:'text-center',
            thClass:'text-center'
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
          id : '',
          category_id:'',
          kode : '',
          istilah : '',
          
        },
        form2: {
          threat_id:'',
          term_id : '',
        },
      }
    },
    validations: {
      form: {
        category_id: {
        required,
        },
        kode: {
          required,
          minLength: minLength(1)
        },
        istilah : {
          required,
          minLength: minLength(1)
        },
      }
    },
    mounted() {
      this.loadData();
      this.getCategory();
    },
    methods: {
    
     loadData() {
        axios.get("api/term").then((response) => {
          this.items = Object.values(response.data.data);
          //console.log(Object.values(response.data.data));
        }); 
      },
      getCategory()
      {
        axios.get("api/category").then((response) => {
        this.categories = Object.values(response.data);
        let cat=$.map(this.categories,function(t){
          return {label:t.nama,value:t.id}
        });
        this.categories=cat;
        }); 
      },

      openModal(tipe, title, button,item) {
        //console.log("openModal");
        if(tipe=="edit") {
          this.editMode = true;
          this.form.id =item.id;
          this.form.kode =item.kode;
          this.form.istilah =item.istilah;
          this.form.category_id =item.category_id;
          this.selected =item.category_id;
          this.selected={label:item.category,value:item.category_id}
          
        }
        else if(tipe=="tambahthreat")
        {
          this.editMode = false;
          this.detailMode = true;
          this.form2.term_id = item.id;
          this.form2.threat_id ='';
          this.form2.nama=''; 
        }
        else {
          this.editMode = false;
          this.selected ='';
          this.form.category_id ='';
          this.form.kode ='';
          this.form.istilah ='';
        }

        this.infoModal.title = title
        this.$root.$emit('bv::show::modal', this.infoModal.id, button)
      },
      resetInfoModal() {
        this.infoModal.title = ''
          this.$nextTick(() => {
          this.$v.$reset();
        });
      },
      hideModal() {
        this.$refs['my-modal'].hide()
      },
      validateState(kode) {
        const { $dirty, $error } = this.$v.form[kode];
        return $dirty ? !$error : null;
      },
      validateState(istilah) {
        const { $dirty, $error } = this.$v.form[istilah];
        return $dirty ? !$error : null;
      },
      async store() {
         this.form.category_id = this.selected.value;
         this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            
            let response =  await axios.post('api/term',this.form)
             //console.log(response.status);
              if(response.status==200){
                  this.form.category_id = '';
                  this.form.kode = '';
                  this.form.istilah = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Term Added successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
            console.log(e.response.data.errors);
          }
      },

      async store2() {
         
          let cek = await axios.get('api/threat/'+this.form2.threat_id);
          //console.log(cek.data.success);
          if(cek.data.success==false){
             this.$swal({
                icon: 'error',
                title: 'Data Sudah Ada ! ! !'
              });
          }
          else {
             try {
              let response =  await axios.post('api/threat',this.form2)
              //console.log(response);
                if(response.status==200){
                    this.form2.threat_id = '';
                    this.form2.term_id = '';
                
                    this.hideModal();
                    this.$swal({
                      icon: 'success',
                      title: 'Tim Detail Added successfully'
                    });
                    this.loadData();
                }
            } catch (e) {
              console.log(e.response.data.errors);
            }
          }
         
      },

      async update() {
        let id = this.form.id;
        this.form.category_id = this.selected.value;
        
        this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let updated = await axios.put('api/term/'+id,this.form)
              if(updated.status==200){
                  this.form.kode= '';
                  this.form.istilah = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Term Updated successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Term Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
      },
      focusMyElement()
      {

      },

      deleteTerm(id) { 
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
            axios.delete("api/term/"+id).then(response => {
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
      deleteThreat(id) { 
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
            axios.delete("api/threat/"+id).then(response => {
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