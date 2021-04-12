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
              <!-- Info modal -->
              <b-modal @shown="focusMyElement" ref="my-modal" :id="infoModal.id" :title="infoModal.title" @hide="resetInfoModal" hide-footer>
                <form @submit.prevent="editMode ? update() : store()"> 
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Nilai" label-for="nilai">
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
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Konsekensi" label-for="konsekuensi">
                      <b-form-input
                        id="konsekuensi"
                        name="konsekuensi"
                        ref="konsekuensiReff"
                        v-model="$v.form.konsekuensi.$model"
                        :state="validateState('konsekuensi')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Financial" label-for="financial">
                      <b-form-input
                        id="financial"
                        name="financial"
                        ref="financialReff"
                        v-model="$v.form.financial.$model"
                        :state="validateState('financial')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Objective" label-for="objective">
                      <b-form-input
                        id="objective"
                        name="objective"
                        ref="objectiveReff"
                        v-model="$v.form.objective.$model"
                        :state="validateState('objective')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                   <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Legal" label-for="legal">
                      <b-form-input
                        id="legal"
                        name="legal"
                        ref="legal"
                        v-model="$v.form.legal.$model"
                        :state="validateState('legal')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                   <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Biaya" label-for="biaya">
                      <b-form-input
                        id="biaya"
                        name="biaya"
                        ref="biaya"
                        v-model="$v.form.biaya.$model"
                        :state="validateState('biaya')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                   <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Reputasi" label-for="reputasi">
                      <b-form-input
                        id="reputasi"
                        name="reputasi"
                        ref="reputasi"
                        v-model="$v.form.reputasi.$model"
                        :state="validateState('reputasi')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                   <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="cakupan" label-for="cakupan">
                      <b-form-input
                        id="cakupan"
                        name="cakupan"
                        ref="cakupan"
                        v-model="$v.form.cakupan.$model"
                        :state="validateState('cakupan')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                   <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="lama_pemulihan" label-for="lama_pemulihan">
                      <b-form-input
                        id="lama_pemulihan"
                        name="lama_pemulihan"
                        ref="lama_pemulihan"
                        v-model="$v.form.lama_pemulihan.$model"
                        :state="validateState('lama_pemulihan')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="lama_penyimpangan" label-for="lama_penyimpangan">
                      <b-form-input
                        id="lama_penyimpangan"
                        name="lama_penyimpangan"
                        ref="lama_penyimpangan"
                        v-model="$v.form.lama_penyimpangan.$model"
                        :state="validateState('lama_penyimpangan')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="product_image" label-for="product_image">
                      <b-form-input
                        id="product_image"
                        name="product_image"
                        ref="product_image"
                        v-model="$v.form.product_image.$model"
                        :state="validateState('product_image')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>
                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="dampak_sosial" label-for="dampak_sosial">
                      <b-form-input
                        id="dampak_sosial"
                        name="dampak_sosial"
                        ref="dampak_sosial"
                        v-model="$v.form.dampak_sosial.$model"
                        :state="validateState('dampak_sosial')"
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
        pageOptions: [1, 5, 10, 15, { value: 100, text: "All" }],
        currentPage: 1,
        filter: "",
        items: [],
        fields: [
          {
            key: 'no',
            sortable: true,
            tdClass:'text-center',
            thClass:'text-center'
          },
          {
            key: 'nilai',
            sortable: true
          },
          {
            key: 'konsekuensi',
            sortable: true
          },
          {
            key: 'financial',
            sortable: true
          },
          {
            key: 'objective',
            sortable: true
          },
          {
            key: 'legal',
            sortable: true
          },
          {
            key: 'biaya',
            sortable: true
          },
          {
            key: 'reputasi',
            sortable: true
          },
          {
            key: 'cakupan',
            sortable: true
          },
          {
            key: 'lama pemulihan',
            sortable: true
          },
          {
            key: 'lama penyimpangan',
            sortable: true
          },
          {
            key: 'product image',
            sortable: true
          },
          {
            key: 'dampak sosial',
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
          nilai : '',
          konsekuensi : '',
          financial : '',
          objective : '',
          legal : '',
          biaya : '',
          reputasi : '',
          cakupan : '',
          lama_pemulihan : '',
          lama_penyimpangan : '',
          product_image : '',
          dampak_sosial : '',
        },
      }
    },
    validations: {
      form: {
        nilai: {
          required,
          minLength: minLength(1)
        },
        konsekuensi : {
          required,
          minLength: minLength(1)
        },
        financial : {
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
        cakupan: {
          required,
          minLength: minLength(3)
        },
        lama_pemulihan: {
          required,
          minLength: minLength(3)
        },
        lama_penyimpangan: {
          required,
          minLength: minLength(3)
        },
        product_image: {
          required,
          minLength: minLength(3)
        },
        dampak_sosial: {
          required,
          minLength: minLength(3)
        },
      }
    },
    mounted() {
      this.loadData();
    },
    methods: {
     loadData() {
        axios.get("api/consequence").then((response) => {
          this.items = Object.values(response.data);
          //console.log(Object.values(response.data));
        }); 
      },
      focusMyElement()
      {
         this.$refs.nilaiReff.focus();
      },

      openModal(tipe, title, button,item) {
        if(tipe=="edit") {
          this.editMode = true;
          this.form.nilai =item.nilai;
          this.form.konsekuensi =item.konsekuensi;
          this.form.financial =item.financial;
          this.form.objective =item.objective;
          this.form.legal =item.legal;
          this.form.biaya =item.biaya;
          this.form.lama_pemulihan =item.lama_pemulihan;
          this.form.lama_penyimpangan =item.lama_penyimpangan;
         this.form.product_image =item.product_image;
         this.form.dampak_sosial =item.dampak_sosial;
        }
        else {
          this.editMode = false;
          this.form.nilai ='';
          this.form.konsekuensi ='';
          this.form.financial ='';
          this.form.objective ='';
          this.form.legal ='';
          this.form.biaya ='';
          this.form.reputasi ='';
          this.form.cakupan ='';
          this.form.lama_pemulihan ='';
          this.form.lama_penyimpangan ='';
          this.form.product_image ='';
          this.form.dampak_sosial ='';
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
            let response =  await axios.post('api/consequence',this.form)
             //console.log(response.status);
              if(response.status==200){
                  this.form.nilai = '';
                  this.form.konsekuensi = '';
                  this.form.financial = '';
                  this.form.objective = '';
                  this.form.legal = '';
                  this.form.biaya = '';
                  this.form.reputasi = '';
                  this.form.cakupan = '';
                  this.form.lama_pemulihan = '';
                  this.form.lama_penyimpangan = '';
                  this.form.product_image = '';
                  this.form.dampak_sosial = '';
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
      },

      async update() {
        this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let id = this.form.id;
            let updated = await axios.put('api/consequence/'+id,this.form)
              if(updated.status==200){
                  this.form.nilai = '';
                  this.form.konsekuensi = '';
                  this.form.financial = '';
                  this.form.objective = '';
                  this.form.legal = '';
                  this.form.biaya = '';
                  this.form.reputasi = '';
                  this.form.cakupan = '';
                  this.form.lama_pemulihan = '';
                  this.form.lama_penyimpangan = '';
                  this.form.product_image = '';
                  this.form.dampak_sosial = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Consequence Updated successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Consequence Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
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