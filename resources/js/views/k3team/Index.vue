<template>
  <div class="overflow-auto">
     <div class="container">
        <div class="row mt-3">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  Admin User
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
                  <b-button variant="outline-danger" size="sm" @click="deleteAdminUsers(row.item.id)">
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
                    <b-form-group id="example-input-group-1" label="Name" label-for="name">
                      <b-form-input
                        id="name"
                        name="name"
                        ref="nameReff"
                        v-model="$v.form.name.$model"
                        :state="validateState('name')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Email" label-for="email">
                      <b-form-input
                        id="email"
                        name="email"
                        ref="emailReff"
                        v-model="$v.form.email.$model"
                        :state="validateState('email')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Password" label-for="password">
                      <b-form-input
                        id="password"
                        name="password"
                        ref="passwordReff"
                        v-model="$v.form.password.$model"
                        :state="validateState('password')"
                        aria-describedby="input-1-live-feedback"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-1-live-feedback"
                      >This is a required field.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </div>
                  <div class="modal-body">
                    <b-form-group id="example-input-group-1" label="Level" label-for="level">
                      <b-form-input
                        id="level"
                        name="level"
                        ref="levelReff"
                        v-model="$v.form.level.$model"
                        :state="validateState('level')"
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
        user: [],
        errors: {},
        items: [],
        fields: [
          {
            key: 'no',
            sortable: true,
            tdClass:'text-center',
            thClass:'text-center'
          },
          /* {
            key: 'id',
            sortable: true
          }, */
          {
            key: 'name',
            sortable: true
          },
          {
            key: 'email',
            sortable: true
          },
          {
            key: 'password',
            sortable: true
          },
           {
              key: 'level',
            sortable: true
           },
          /* {
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
          }, */
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
          name : '',
          email : '',
          password: '',
          level:'',
        },
      }
    },
    validations: {
      form: {
        name: {
          required,
        },
        email : {
          required,
          minLength: minLength(1)
        },
        password : {
          required,
        },
         level : {
          required,
        },
      }
    },
    mounted() {
      this.loadData();
    },
    methods: {
     loadData() {
        axios.get("api/k3team").then((response) => {
          this.items = Object.values(response.data);
          console.log(Object.values(response.data));
        }); 
      },
      focusMyElement()
      {
         this.$refs.nameReff.focus();
      },

      openModal(tipe, title, button,item) {
        if(tipe=="edit") {
          this.editMode = true;
          this.form.id =item.id;
          this.form.nama =item.nama;
          this.form.email =item.email;
          this.form.password =item.password;
          this.form.level =item.level;
         
        }
        else {
          this.editMode = false;
          this.form.nama ='';
          this.form.email ='';
          this.form.password ='';
          this.form.level ='';
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
       validateState(email) {
        const { $dirty, $error } = this.$v.form[email];
        return $dirty ? !$error : null;
      },
       validateState(password) {
        const { $dirty, $error } = this.$v.form[password];
        return $dirty ? !$error : null;
      },
      validateState(level) {
        const { $dirty, $error } = this.$v.form[level];
        return $dirty ? !$error : null;
      },
      async store() {
         this.$v.form.$touch();
          if (this.$v.form.$anyError) {
            return;
          }
          try {
            let response =  await axios.post('api/k3team',this.form)
             //console.log(response.status);
              if(response.status==200){
                  this.form.nama = '';
                  this.form.email = '';
                  this.form.password = '';
                  this.form.level = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Admin User Added successfully'
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
            let updated = await axios.put('api/k3team/'+id,this.form)
              if(updated.status==200){
                  this.form.nama = '';
                  this.form.email = '';
                  this.form.password = '';
                  this.form.level = '';
                  this.hideModal();
                  this.$swal({
                    icon: 'success',
                    title: 'Admin User Updated successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Admin User Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
      },

      deleteAdminUsers(id) { 
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
            axios.delete("api/k3team/"+id).then(response => {
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