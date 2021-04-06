<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">New Category</div>
          <div class="card-body">
            <form action="#" method="post" @submit.prevent="store">
              <div class="form-group row">
                <label for="nama" class="col-sm-2 col-form-label">Kategori</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.nama" class="form-control" id="nama" />
                  <div v-if="theErrors.nama" class="mt2 text-danger">{{ theErrors.nama[0] }}</div>
                </div>
              </div>
              <div class="row">
                  <div class="col-12 text-right">
                      <router-link :to="{name:'category.view'}" class="btn btn-default">Back</router-link>
                      <button type="submit" class="btn btn-primary" > Save  
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
export default {
  data() {
    return {
      form: {
        nama : '',
      },
      categories: [],
      theErrors: [],
    };
  },
  mounted() {
       this.loadData();
  },
  methods: {
    async loadData() {
            let response = await axios.get('http://hiradc.test/api/category')
            //console.log(response.data);
            if(response.status===200){
                this.categories = response.data
            }
    },
    async store() {
      try {
         let response = await axios.post('http://hiradc.test/api/category',this.form)
          if(response.status==200){
              //console.log(response.data);
              this.form.nama = ''
              this.theErrors=[]
              toast.fire({
                icon: 'success',
                title: 'Category Added successfully'
              })
          }
      } catch (e) {
        //onsole.log(e.response.data.errors);
        this.theErrors = e.response.data.errors ;
      }
       
    }
  }
};
</script>

<style>
</style>