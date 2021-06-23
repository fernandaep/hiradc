<template>
  <div class="overflow-auto">
     <div class="container">
        <div class="row mt-3">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  Mitigasi
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
                  <b-button variant="outline-info" size="sm" @click="openModal('edit' , 'Edit ID : ' +row.item.id, $event.target,row.item)" class="mr-1">
                    <i class="fa fa-edit"></i>
                  </b-button>
                  <b-button variant="outline-danger" size="sm" @click="deleteMitigasi(row.item.id)">
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
                    <b-form-group id="registergroup" label="Register" label-for="register">
                      <v-select v-model="selectedregister"  :options="registers">
                        <template #search="{attributes, events}">
                            <input
                              class="vs__search"
                              :required="!selectedregister"
                              v-bind="attributes"
                              v-on="events"
                              ref="registerReff"
                            />
                          </template>
                      </v-select>

                    </b-form-group>
                    <b-form-group id="example-input-group-1" label="Program Mitigasi" label-for="program_mitigasi">
                      <b-form-input
                        id="program_mitigasi"
                        name="program_mitigasi"
                        ref="program_mitigasiReff"
                        v-model="$v.form.program_mitigasi.$model"
                        :state="validateState('program_mitigasi')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>

                    <b-form-group id="possibilitygroup" label="Kemungkinan" label-for="possibility">
                      <v-select v-model="selectedpossibility"  :options="possibilities">
                        <template #search="{attributes, events}">
                            <input
                              class="vs__search"
                              :required="!selectedpossibility"
                              v-bind="attributes"
                              v-on="events"
                              ref="possibilityReff"
                            />
                          </template>
                      </v-select>

                    </b-form-group>
                    
                    <b-form-group id="consequencegroup" label="Konsekuensi" label-for="consequence">
                      <v-select v-model="selectedconsequence"  :options="consequences">
                        <template #search="{attributes, events}">
                            <input
                              class="vs__search"
                              :required="!selectedconsequence"
                              v-bind="attributes"
                              v-on="events"
                              ref="consequencesReff"
                            />
                          </template>
                      </v-select>

                    </b-form-group>
                
                    <b-form-group id="example-input-group-1" label="Tingkat Resiko" label-for="tingkat_resiko">
                      <b-form-input
                        id="tingkat_resiko"
                        name="tingkat_resiko"
                        ref="tingkat_resikoReff"
                        v-model="$v.form.tingkat_resiko.$model"
                        :state="validateState('tingkat_resiko')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                 
                    <b-form-group id="example-input-group-1" label="Aspek Lingkungan" label-for="aspek_lingkungan">
                      <v-select :options="['Penting', 'Tidak Penting']"
                        v-model="$v.form.aspek_lingkungan.$model"
                        :state="validateState('aspek_lingkungan')"
                      ></v-select>
                    </b-form-group>
                 
                    <b-form-group id="example-input-group-1" label="Resiko Ditoleransi" label-for="resiko_ditoleransi">
                      <v-select :options="['YA', 'TIDAK']"
                        v-model="$v.form.resiko_ditoleransi.$model"
                        :state="validateState('resiko_ditoleransi')"
                      ></v-select>
                    </b-form-group>

                     <!-- <b-form-group id="example-input-group-1" label="Keterangan" label-for="keterangan">
                      <b-form-input
                        id="keterangan"
                        name="keterangan"
                        ref="keteranganReff"
                        v-model="$v.form.keterangan.$model"
                        :state="validateState('keterangan')"
                       
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group> -->
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
        pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
        currentPage: 1,
        filter: "",
        selectedregister:"",
        selectedpossibility: "",
        selectedconsequence: "",
         possibilities: [],
         consequences: [],
         registers:[],
        items: [],
        fields: [
          {
            key: 'no',
            sortable: true,
            tdClass:'text-center',
            thClass:'text-center'
          },
          {
            key: 'register_id',
            sortable: true
          },
          {
            key: 'possibility',
            label: 'Kemungkinan',
            sortable: true
          },
          {
            key: 'consequence',
            label: 'Konsekuensi',
            sortable: true
          },
          {
            key: 'program_mitigasi',
            sortable: true
          },
          {
            key: 'kemungkinan_mitigasi',
            sortable: true
          },
          {
            key: 'konsekuensi_mitigasi',
            sortable: true
          },
          {
            key: 'tingkat_resiko',
            sortable: true
          },
          {
            key: 'aspek_lingkungan',
            sortable: true
          },
          {
            key: 'resiko_ditoleransi',
            sortable: true
          },
          {
            key: 'keterangan',
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
        sortBy: 'created_at',
        sortDesc: true,
        infoModal: {
          id: 'info-modal',
          title: '',
        },
        form: {
          id : '',
          register_id:'',
          program_mitigasi : '',
          possibility_id:'',
          consequence_id:'',
          tingkat_resiko : '',
          aspek_lingkungan : '',
          resiko_ditoleransi : '',
          keterangan : '',
        },
      }
    },
    validations: {
      form: {
        register_id: {
        required,
        },
        program_mitigasi: {
          required,
          minLength: minLength(3)
        },
        possibility_id: {
          required,
        },
        consequence_id: {
          required,
        },
        tingkat_resiko : {
          required,
          minLength: minLength(1)
        },
        aspek_lingkungan : {
          required,
          minLength: minLength(2)
        },
        resiko_ditoleransi : {
          required,
          minLength: minLength(2)
        },
      }
    },
    mounted() {
      this.loadData();
      this.getRegister();
      this.getPossibility();
      this.getConsequence();
    },
    methods: {
     loadData() {
        axios.get("api/mitigasi").then((response) => {
          this.items = Object.values(response.data.data);
          //console.log(Object.values(response.data));
        }); 
      },
      getRegister()
      {
        axios.get("api/register").then((response) => {
        this.registers = Object.values(response.data.data);
        let cat=$.map(this.registers,function(t){
          return {label:t.activity,value:t.id}
        });
        this.registers=cat;
        }); 
      },
      getPossibility()
      {
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
      getConsequence()
      {
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
      focusMyElement()
      {
         this.$refs.program_mitigasiReff.focus();
      },

      openModal(tipe, title, button,item) {
        if(tipe=="edit") {
          this.editMode = true;
          this.form.id =item.id;
          this.form.program_mitigasi =item.program_mitigasi;
          this.form.kemungkinan_mitigasi =item.kemungkinan_mitigasi;
          this.form.konsekuensi_mitigasi =item.konsekuensi_mitigasi;
          this.form.tingkat_resiko =item.tingkat_resiko;
          this.form.aspek_lingkungan =item.aspek_lingkungan;
          this.form.resiko_ditoleransi =item.resiko_ditoleransi;
          this.form.keterangan =item.keterangan;
        }
        else {
          this.editMode = false;
          this.form.program_mitigasi ='';
          this.form.kemungkinan_mitigasi='';
          this.form.konsekuensi_mitigasi='';
          this.form.tingkat_resiko ='';
          this.form.aspek_lingkungan ='';
          this.form.resiko_ditoleransi ='';
          this.form.keterangan ='';
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
      validateState(program_mitigasi) {
        const { $dirty, $error } = this.$v.form[program_mitigasi];
        return $dirty ? !$error : null;
      },
     /*  validateState(kemungkinan_mitigasi) {
        const { $dirty, $error } = this.$v.form[kemungkinan_mitigasi];
        return $dirty ? !$error : null;
      },
      validateState(konsekuensi_mitigasi) {
        const { $dirty, $error } = this.$v.form[konsekuensi_mitigasi];
        return $dirty ? !$error : null;
      }, */
       validateState(tingkat_resiko) {
        const { $dirty, $error } = this.$v.form[tingkat_resiko];
        return $dirty ? !$error : null;
      },
       validateState(aspek_lingkungan) {
        const { $dirty, $error } = this.$v.form[aspek_lingkungan];
        return $dirty ? !$error : null;
      },
       validateState(resiko_ditoleransi) {
        const { $dirty, $error } = this.$v.form[resiko_ditoleransi];
        return $dirty ? !$error : null;
      },
      /* validateState(keterangan) {
        const { $dirty, $error } = this.$v.form[keterangan];
        return $dirty ? !$error : null;
      }, */
      async store() {
         this.form.register_id = this.selectedregister.value;
         this.form.possibility_id = this.selectedpossibility.value;
         this.form.consequence_id = this.selectedconsequence.value;
         this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let response =  await axios.post('api/mitigasi',this.form)
             //console.log(response.status);
              if(response.status==200){
                 this.form.register_id = '';
                  this.form.program_mitigasi = '';
                  this.form.possibility_id='';
                  this.form.consequence_id='';
                  this.form.tingkat_resiko = '';
                  this.form.aspek_lingkungan = '';
                  this.form.resiko_ditoleransi = '';
                  /* this.form.keterangan =''; */
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Mitigasi Added successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
            console.log(e.response.data.errors);
          }
      },

      async update() {
         let id = this.form.id;
        this.form.register_id = this.selected.value;
        this.form.possibility_id = this.selected.value;
        this.form.consequence_id = this.selected.value;
        this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let id = this.form.id;
            let updated = await axios.put('api/mitigasi/'+id,this.form)
              if(updated.status==200){
                this.form.register_id = '';
                  this.form.program_mitigasi = '';
                  this.form.possibility_id='';
                  this.form.consequence_id='';
                  this.form.tingkat_resiko = '';
                  this.form.aspek_lingkungan = '';
                  this.form.resiko_ditoleransi = '';
                  /* this.form.keterangan =''; */
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Miitigasi Updated successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Mitigasi Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
      },

      deleteMitigasi(id) { 
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
            axios.delete("api/mitigasi/"+id).then(response => {
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