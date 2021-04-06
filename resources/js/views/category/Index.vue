<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Kategori</h3>
            <div class="card-tools">
              <button class="btn btn-success" data-toggle="modal" data-target="#addNew" @click="openModalWindow">
                Add New <i class="fas fa-cogs fa-fw"></i>
              </button>
            </div>
          </div>

          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Kategori</th>
                  <th scope="col">Action</th>
                </tr>

                <tr v-for="category in categories" :key="category.id">
                  <td>{{ category.id }}</td>
                  <td>{{ category.nama }}</td>
                  <td>
                    <a href="#" data-id="category.id" @click="editModalWindow(category)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    |
                    <a href="#" @click="deleteCategory(category.id)">
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
              Add New Kategori
            </h5>
            <h5 v-show="editMode" class="modal-title" id="addNewLabel">
              Update Kategori
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
      categories: [],
      theErrors: [],

      form: {
        nama : '',
      },

    };
  },
  created() {
    this.loadData();
  },
  methods: {
     loadData() {
        axios.get("http://hiradc.test/api/category/").then((response) => {
          this.categories = response.data;
        });
      },
      openModalWindow() {
        this.editMode = false;
        this.form.nama = '';
        $("#addNew").modal("show");
      },
      editModalWindow(category){
           this.editMode = true;
           $('#addNew').modal('show');
           this.form.fill(category);
        },
        async store() {
          this.loading=true;
            try {
              let response = await axios.post('http://hiradc.test/api/category',this.form)
                if(response.status==200){
                    // /console.log(response.data);
                    this.form.nama = '';
                    this.loading=false;
                    $('#addNew').modal('hide');
                    this.theErrors=[];
                    this.$swal({
                      icon: 'success',
                      title: 'Category Added successfully'
                    });
                    this.loadData();
                }
            } catch (e) {
              //console.log(e.response.data.errors);
              this.theErrors = e.response.data.errors ;
            }
        },
        update(){
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
              axios.delete("http://hiradc.test/api/category/"+id).then(response => {
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
};
</script> 