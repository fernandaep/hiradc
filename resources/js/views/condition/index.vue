<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Kondisi</h3>
            <div class="card-tools">
              <button class="btn btn-success" data-toggle="modal" data-target="#addNew" >
                Add New <i class="fas fa-cogs fa-fw"></i>
              </button>
            </div>
          </div>
         
          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Kondisi</th>
                  <th scope="col">Action</th>
                </tr>

                <tr v-for="condition in conditions" :key="condition.id">
                  <td>{{ condition.id }}</td>
                  <td>{{ condition.nama }}</td>
                  <td>
                    <a href="#" data-id="condition.id" @click="editModalWindow(condition)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    |
                    <a href="#" @click="deleteCondition(condition.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="card-footer"></div>
        </div>
      </div>
    </div>

    <!-- modal -->
    <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 v-show="!editMode" class="modal-title" id="addNewLabel">
              Add New condition
            </h5>
            <h5 v-show="editMode" class="modal-title" id="addNewLabel">
              Update condition
            </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
           
          <form @submit.prevent="editMode ? update() : store()">
            <div class="modal-body">
                <div class="form-group">
                  <input v-model="form.nama" type="text" name="nama" placeholder="Nama" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">
                Close
              </button>
              <button v-show="editMode" type="submit" class="btn btn-primary">
                Update
                 <template v-if="loading">
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: auto; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; shape-rendering: auto;" width="20px" height="20px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid"> <circle cx="30" cy="50" fill="#e90c59" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="-0.5s"></animate> </circle> <circle cx="70" cy="50" fill="#46dff0" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="0s"></animate> </circle> <circle cx="30" cy="50" fill="#e90c59" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="-0.5s"></animate> <animate attributeName="fill-opacity" values="0;0;1;1" calcMode="discrete" keyTimes="0;0.499;0.5;1" dur="1s" repeatCount="indefinite"></animate> </circle></svg>
                </template>
                
              </button>
              <button v-show="!editMode" type="submit" class="btn btn-primary">
                Create
                <template v-if="loading">
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: auto; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: block; shape-rendering: auto;" width="20px" height="20px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid"> <circle cx="30" cy="50" fill="#e90c59" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="-0.5s"></animate> </circle> <circle cx="70" cy="50" fill="#46dff0" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="0s"></animate> </circle> <circle cx="30" cy="50" fill="#e90c59" r="20"> <animate attributeName="cx" repeatCount="indefinite" dur="1s" keyTimes="0;0.5;1" values="30;70;30" begin="-0.5s"></animate> <animate attributeName="fill-opacity" values="0;0;1;1" calcMode="discrete" keyTimes="0;0.499;0.5;1" dur="1s" repeatCount="indefinite"></animate> </circle></svg>
                </template>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  data() {
    return {
      editMode: false,
      loading:false,
      conditions: [],
      theErrors: [],

      form: {
        id : '',
        nama : '',

      },

    };
  },
  created() {
    this.loadData();
  },
 /*  watch: {
        // whenever question changes, this function will run
        pencarian: function (q) {
          if (q != '') {
            this.searchCategory()  
          }
          else {
            this.getCategories()
          }
          
        }
      }, */
  methods: {
     loadData() {
        axios.get("api/condition").then((response) => {
          this.conditions = response.data;
        }); 
      },
      openModalWindow() {
        this.editMode = false;
        this.form.nama = '';
        $("#addNew").modal("show");
      },
      editModalWindow(condition){
        console.log(condition);
           this.editMode = true;
           $('#addNew').modal('show');
           this.form.id = condition.id;
           this.form.nama = condition.nama;
      },
     async store() {
        this.loading=true;
          try {
            let response = await axios.post('api/condition',this.form)
              if(response.status==200){
                  // /console.log(response.data);
                  this.form.nama = '';
                  this.loading=false;
                  $('#addNew').modal('hide');
                  this.theErrors=[];
                  this.$swal({
                    icon: 'success',
                    title: 'Condition Added successfully'
                  });
                  this.loadData();
              }
          } catch (e) {
            //console.log(e.response.data.errors);
            this.theErrors = e.response.data.errors ;
          }
      },

       async update() {
          this.loading=false;
          try {
            let id = this.form.id;
            let updated = await axios.put('api/condition/'+id,this.form)
              if(updated.status==200){
                  this.form.nama = '';
                  this.loading=false;
                  $('#addNew').modal('hide');
                  this.theErrors=[];
                  this.$swal({
                    icon: 'success',
                    title: 'Condition Updated successfully'
                  });
                  this.loadData();
                  this.editMode=false;
                  
              }
          } catch (e) {
             this.$swal({
                icon: 'Error',
                title: 'Condition Updated Failed '+e.response.data.errors
              });
            this.theErrors = e.response.data.errors ;
          }
      },

      
     /*  update(){
        let id = this.form.id;
        axios.put("api/category/" + id , this.form)
        .then(function (response) {
           console.log(respon);
        })
        .catch(function () {
            //alert("Could not load your category")
            console.log(response.data.errors);
        });
      },  */
         
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
       /*  getActivities(page) {
          var app = this;
          if (typeof page === 'undefined') {
            page = 1;
          }
          axios.get("api/activity/"+id+'/show-all?page='+page)
          .then(function (resp) {
            app.activities = resp.data.data;
            app.activitiesData = resp.data;
            app.loading = false;
          })
          .catch(function (resp) {
            console.log(resp);
            app.loading = false;
            alert("Could not load activity");
          });
        },
        searchActivities(page){
          var app = this;
          if (typeof page === 'undefined') {
            page = 1;
          }
          axios.get("api/activity/"+id+'/search?q='+app.pencarian+'&page='+page)
          .then(function (resp) {
            app.activities = resp.data;
            app.ActivitiesData = [];
          })
          .catch(function (resp) {
            console.log(resp);
            alert("Could not load Activity");
          });
        }, */
      

     },
}
</script> 

<style scoped>
.pencarian {
  color: red;
 
  float: right;
  padding-bottom: 10px;
}
</style> */