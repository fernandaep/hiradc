<template>
  <div class="overflow-auto">
     <div class="container">
        <div class="row mt-3">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  Kategori 
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
                              <th>Nama Vulnerability</th>
                              <th>Action</th>
                              <th>
                                <b-button variant="outline-success" size="sm" @click="openModal('vulnerability' , 'Tambah Vulnerability', $event.target,row.item)" class="mr-1">
                                  <i class="fa fa-plus"></i>
                                </b-button>
                              </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(value, key) in row.item.vulnerability" :key="key">
                            <td>{{key + 1 }}</td>
                            <td>{{value.nama}}</td>
                            <td>
                           <b-button variant="outline-info" size="sm" @click="openModal('vulnerability' , 'Edit ID : ' +row.item.id, $event.target,row.item)" class="mr-1">
                              <i class="fa fa-edit"></i>
                            </b-button>
                              <b-button variant="outline-danger" size="sm" @click="deleteVulnerability(value.id)">
                                <i class="fa fa-trash"></i>
                                </b-button>
                              </td>
                              <td>

                              </td>

                          </tr>
                        </tbody>
                      </table>
                      </div>
       
                  <!-- <div class="ml-5 pr-5">
                      <table class="table">
                        <thead>
                          <tr>
                              <th>No</th>
                              <th>Nama Condition</th>
                              <th>Action</th>
                              <th>
                              <b-button variant="outline-success" size="sm" @click="openModal('condition' , 'Tambah Condition', $event.target,row.item)" class="mr-1">
                               <i class="fa fa-plus"></i>
                            </b-button>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(value, key) in row.item.condition" :key="key">
                            <td>{{key + 1 }}</td>
                            <td>{{value.nama}}</td>
                            <td>
                              <b-button variant="outline-info" size="sm" @click="openModal('condition' , 'Edit ID : ' +row.item.id, $event.target,row.item)" class="mr-1">
                                <i class="fa fa-edit"></i>
                              </b-button>
                              <b-button variant="outline-danger" size="sm" @click="deleteCondition(value.id)">
                                <i class="fa fa-trash"></i>
                                </b-button>
                              </td>
                              <td>
                                
                              </td>
                          </tr>
                        </tbody>
                      </table>
                      </div>
 
                      <div class="ml-5 pr-5">
                      <table class="table">
                        <thead>
                          <tr>
                              <th>No</th>
                              <th>Kode</th>
                              <th>Istilah</th>
                              <th>Action</th>
                              <th>
                              <b-button variant="outline-success" size="sm" @click="openModal('term' , 'Tambah Term', $event.target,row.item)" class="mr-1">
                               <i class="fa fa-plus"></i>
                            </b-button>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(value, key) in row.item.term" :key="key">
                            <td>{{key + 1 }}</td>
                            <td>{{value.kode}}</td>
                            <td>{{value.istilah}}</td>
                            <td>
                               <b-button variant="outline-info" size="sm" @click="openModal('term' , 'Edit ID : ' +row.item.id, $event.target,row.item)" class="mr-1">
                                <i class="fa fa-edit"></i>
                              </b-button>
                              <b-button variant="outline-danger" size="sm" @click="deleteTerm(value.id)">
                                <i class="fa fa-trash"></i>
                                </b-button>
                              </td>
                              <td>
                                
                              </td>
                          </tr>
                        </tbody>
                      </table>
                      </div>-->

                    
                      <div class="ml-5 pr-5">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>No</th>
                              <th>Nilai</th>
                              <th>Konsekuensi</th>
                              <th>Financial</th>
                              <th>Objective</th>
                              <th>Legal</th>
                              <th>Biaya</th>
                              <th>Reputasi</th>
                              <th>Cakupan</th>
                              <th>Lama Pemulihan</th>
                              <th>Lama Penyimpangan</th>
                              <th>Product Image</th>
                              <th>Dampak Sosial</th>
                              <th>Action</th>
                              <th>
                             <b-button variant="outline-success" size="sm">
                                        <router-link
                                        :to="{ name: 'category.createConsequence' }"
                                        class="btn btn-outline-primary"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </router-link>
                                    </b-button>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="(value, key) in row.item.consequence" :key="key">
                            <td>{{key + 1 }}</td>
                            <td>{{value.nilai}}</td>
                            <td>{{value.konsekuensi}}</td>
                            <td>{{value.financial}}</td>
                            <td>{{value.objective}}</td>
                            <td>{{value.legal}}</td>
                            <td>{{value.biaya}}</td>
                            <td>{{value.reputasi}}</td>
                            <td>{{value.cakupan}}</td>
                            <td>{{value.lama_pemulihan}}</td>
                            <td>{{value.lama_penyimpangan}}</td>
                            <td>{{value.product_image}}</td>
                            <td>{{value.dampak_sosial}}</td>
                            <td>
                               <b-button variant="outline-info" size="sm">
                                        <router-link
                                            :to="{
                                                name: 'category.editConsequence',
                                                params: { id: row.item.id }
                                            }"
                                            class="btn btn-outline-primary"
                                        >
                                            <i class="fa fa-edit"></i> Edit
                                        </router-link>
                                    </b-button>
                              <b-button variant="outline-danger" size="sm" @click="deleteConsequence(value.id)">
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
                  <b-button variant="outline-success" size="sm" @click="openModal('vulnerability' , 'Tambah Vulnerability', $event.target,row.item)" class="mr-1">
                    <i class="fa fa-plus"></i>
                  </b-button>
                  <b-button variant="outline-info" size="sm" @click="openModal('edit' , 'Edit ID : ' +row.item.id, $event.target,row.item)" class="mr-1">
                    <i class="fa fa-edit"></i>
                  </b-button>
                  <b-button variant="outline-danger" size="sm" @click="deleteCategory(row.item.id)">
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
                <div v-if="!detailMode && (!editMode || editMode)">
                <form @submit.prevent="editMode ? update() : store()"> 
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Name" label-for="nama">
                      <b-form-input
                        id="nama"
                        name="nama"
                        ref="namaReff"
                        v-model="$v.form.nama.$model"
                        :state="validateState('nama')"
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
                </div>

                 <div v-else>
                <form @submit.prevent="store2()" > 
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Name" label-for="nama">
                      <b-form-input
                        id="nama"
                        name="nama"
                        ref="namaReff"
                        v-model="$v.form2.nama.$model"
                        :state="validateState('nama')"
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
                  </div>

                  <!-- <div v-else>
                  <form @submit.prevent="store3()" > 
                    <div class="modal-body">
                      <b-form-group id="example-input-group-1" label="Nama" label-for="nama">
                        <b-form-input
                          id="nama"
                          name="nama"
                          ref="namaReff"
                          v-model="$v.form3.nama.$model"
                          :state="validateState('nama')"
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
                    </div> -->
                    
                  <!-- <div v-else>
                  <form @submit.prevent="store4()" > 
                   <div class="modal-body">
                   <b-form-group id="example-input-group-1" label="kode" label-for="kode">
                      <b-form-input
                        id="kode"
                        name="kode"
                        ref="kodeReff"
                        v-model="$v.form4.kode.$model"
                       
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
                        v-model="$v.form4.istilah.$model"
                       
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>  
                
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">
                    Add
                  </button>
                  <button type="button" class="btn btn-danger" @click="hideModal" >
                    Close
                  </button>
                </div>      
                </form>
                </div> -->

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
        detailMode:false,
        loading:false,
        pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
        currentPage: 1,
        filter: "",
        selectedVulnerability:"",
        vulnerabilities:[],
        conditions:[],
        terms:[],
        consequences:[],
        items: [],
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
            key: 'nama',
            sortable: true
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
        sortBy: 'nama',
        sortDesc: true,
        infoModal: {
          id: 'info-modal',
          title: '',
        },
        form: {
          id : '',
          nama : '',
        },
        form2: {
          vulnerability_id:'',
          category_id:'',
          nama : '',
        },
        form3: {
          condition_id:'',
          category_id:'',
          nama : '',
        },
        form4: {
          terms_id:'',
          category_id:'',
          kode:'',
          istilah:'',
        },
        /* form5: {
          consequence_id:'',
          category_id:'',
        }, */
      }
    },
    validations: {
      form: {
        nama: {
          required,
          minLength: minLength(1)
        }
      },
      form2: {
        nama: {
          required,
          minLength: minLength(1)
         }
        },
        form3: {
        nama: {
          required,
          minLength: minLength(1)
         }
        },
        form4: {
        kode: {
          required,
          minLength: minLength(1)
        },
        istilah: {
          required,
          minLength: minLength(1)
        },
      }
    },

    mounted() {
      this.loadData();
    },
    methods: {
     loadData() {
        axios.get("api/category").then((response) => {
          this.items = Object.values(response.data.data);
          /* console.log(Object.values(response.data)); */
        }); 
      },
   
      focusMyElement()
      {
           this.$refs.namaReff.focus();

      },

      openModal(tipe, title, button,item) {
        if(tipe=="edit") {
          this.editMode = true;
           this.detailMode = false;
          this.form.id =item.id;
          this.form.nama =item.nama;
         
        }
        else if(tipe=="vulnerability")
        {
          this.editMode = false;
          this.detailMode = true;
          this.form2.category_id = item.id;
          this.form2.vulnerability_id ='';
          this.form2.nama ='';
        }
        else if(tipe=="condition")
        {
          this.editMode = false;
          this.detailMode = true;
          this.form3.category_id = item.id;
          this.form3.condition_id ='';
          this.form3.nama ='';
        }
        else if(tipe=="term")
        {
          this.editMode = false;
          this.detailMode = true;
          this.form4.category_id = item.id;
          this.form4.term_id ='';
          this.form4.kode ='';
          this.form4.istilah ='';
        }
       /*  else if(tipe=="tambahdetail4")
        {
          this.editMode = false;
          this.detailMode = true;
          this.form5.category_id = item.id;
          this.form5.consequence_id ='';
        } */
        else {
          this.editMode = false;
          this.detailMode = false;
          this.form.nama ='';
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
      validateState(name) {
        const { $dirty, $error } = this.$v.form[name];
        return $dirty ? !$error : null;
      },
      validateState(name) {
        const { $dirty, $error } = this.$v.form2[name];
        return $dirty ? !$error : null;
      },
       validateState(name) {
        const { $dirty, $error } = this.$v.form3[name];
        return $dirty ? !$error : null;
      },
      /* validateState(kode) {
        const { $dirty, $error } = this.$v.form4[kode];
        return $dirty ? !$error : null;
      },
      validateState(istilah) {
        const { $dirty, $error } = this.$v.form4[istilah];
        return $dirty ? !$error : null;
      }, */
      async store() {
         this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let response =  await axios.post('api/category',this.form)
             //console.log(response.status);
              if(response.status==200){
                  this.form.nama = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Category Added successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
            console.log(e.response.data.errors);
          }
      },

      async store2() {
          let cek = await axios.get('api/vulnerability/'+this.form2.vulnerability_id);
          //console.log(cek.data.success);
          if(cek.data.success==false){
             this.$swal({
                icon: 'error',
                title: 'Data Sudah Ada ! ! !'
              });
          }
          else {
             try {
              let response =  await axios.post('api/vulnerability',this.form2)
              //console.log(response);
                if(response.status==200){
                    this.form2.vulnerability_id = '';
                    this.form2.category_id = '';
                    this.hideModal();
                    this.$swal({
                      icon: 'success',
                      title: 'Vulnerability Added successfully'
                    });
                    this.loadData();
                }
            } catch (e) {
              console.log(e.response.data.errors);
            }
          }
         
      },

      async store3() {
          let cek = await axios.get('api/condition/'+this.form3.condition_id);
          //console.log(cek.data.success);
          if(cek.data.success==false){
             this.$swal({
                icon: 'error',
                title: 'Data Sudah Ada ! ! !'
              });
          }
          else {
             try {
              let response =  await axios.post('api/condition',this.form3)
              //console.log(response);
                if(response.status==200){
                    this.form3.condition_id = '';
                    this.form3.category_id = '';
                
                    this.hideModal();
                    this.$swal({
                      icon: 'success',
                      title: 'Condition Added successfully'
                    });
                    this.loadData();
                }
            } catch (e) {
              console.log(e.response.data.errors);
            }
          }
         
      },
      async store4() {
          let cek = await axios.get('api/term/'+this.form4.term_id);
          //console.log(cek.data.success);
          if(cek.data.success==false){
             this.$swal({
                icon: 'error',
                title: 'Data Sudah Ada ! ! !'
              });
          }
          else {
             try {
              let response =  await axios.post('api/term',this.form4)
              //console.log(response);
                if(response.status==200){
                    this.form4.term_id = '';
                    this.form4.category_id = '';
                    this.form4.kode = '';
                    this.form4.istilah = '';
                    
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
          }
         
      },

      /* async store5() {
          let cek = await axios.get('api/consequence/'+this.form5.consequence_id);
          //console.log(cek.data.success);
          if(cek.data.success==false){
             this.$swal({
                icon: 'error',
                title: 'Data Sudah Ada ! ! !'
              });
          }
          else {
             try {
              let response =  await axios.post('api/consequence',this.form4)
              //console.log(response);
                if(response.status==200){
                    this.form2.consequence_id = '';
                    this.form2.category_id = '';
                
                    this.hideModal();
                    this.$swal({
                      icon: 'success',
                      title: 'Consequence Added successfully'
                    });
                    this.loadData();
                }
            } catch (e) {
              console.log(e.response.data.errors);
            }
          }
         
      }, */

      async update() {
        this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let id = this.form.id;
            let updated = await axios.put('api/category/'+id,this.form)
              if(updated.status==200){
                  this.form.nama = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Category Updated successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Category Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
      },

      deleteCategory(id) { 
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
            axios.delete("api/category/"+id).then(response => {
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
      deleteVulnerability(id) { 
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
            axios.delete("api/vulnerability/"+id).then(response => {
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
      deleteCondition(id) { 
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
            axios.delete("api/condition/"+id).then(response => {
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