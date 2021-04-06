<template>

  <div>
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1 class="m-0">Kategori
                      <router-link :to="{name:'category.create'}" class="btn btn-outline-primary">
                        <i class="fas fa-plus"></i> Add New
                      </router-link>
                    </h1>
                </div> <!-- /.col -->
            </div> <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
     <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">List</h5>
                                <table class="table table-bordered table-striped">
                                <thead>
                                  <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Kategori</th>
                                    <th scope="col">Action</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <!-- menampilkan data ke table -->
                                  <tr v-for="category in categories" :key="category.id">
                                    <td style="width: 40%">{{ category.id }}</td>
                                    <td style="width: 40%">{{ category.nama }}</td>
                                    <td style="width: 20%">
                                        <router-link class="btn" :to="{name:'category.edit', params: {id:category.id}}"> 
                                          <i class="fas fa-edit"></i>
                                        </router-link>
                                      <button class="btn"
                                        v-on:click="deleteData(category.id)">
                                          <i class="fas fa-trash" style="color:red"></i>
                                      </button>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // variable array yang akan menampung hasil fetch dari api
      categories: []
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    loadData() {
      // fetch data dari api menggunakan axios
      axios.get("http://hiradc.test/api/category").then(response => {
        // mengirim data hasil fetch ke varibale array persons
        this.categories = response.data;
        //console.log(this.categories)
      });
    },
    deleteData(id) { 
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
   
  }
};
</script>
