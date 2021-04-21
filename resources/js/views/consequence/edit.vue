<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">Edit Consequence</div>
          <div class="card-body">
            <form action="#" method="post" @submit.prevent="update">
              <div class="form-group row">
                <label for="nilai" class="col-sm-2 col-form-label">Nilai</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.nilai" class="form-control" id="nilai" />
                  <div v-if="theErrors.nilai" class="mt2 text-danger">{{ theErrors.nilai[0] }}</div>
                </div>
              </div>
               <div class="form-group row">
                <label for="konsekuensi" class="col-sm-2 col-form-label">Konsekuensi</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.konsekuensi" class="form-control" id="konsekuensi" />
                  <div v-if="theErrors.konsekuensi" class="mt2 text-danger">{{ theErrors.konsekuensi[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="financial" class="col-sm-2 col-form-label">Financial</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.financial" class="form-control" id="financial" />
                  <div v-if="theErrors.financial" class="mt2 text-danger">{{ theErrors.financial[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="objective" class="col-sm-2 col-form-label">Objective</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.objective" class="form-control" id="objective" />
                  <div v-if="theErrors.objective" class="mt2 text-danger">{{ theErrors.objective[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="legal" class="col-sm-2 col-form-label">Legal</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.legal" class="form-control" id="legal" />
                  <div v-if="theErrors.legal" class="mt2 text-danger">{{ theErrors.legal[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="biaya" class="col-sm-2 col-form-label">Biaya</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.biaya" class="form-control" id="biaya" />
                  <div v-if="theErrors.biaya" class="mt2 text-danger">{{ theErrors.biaya[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="reputasi" class="col-sm-2 col-form-label">Reputasi</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.reputasi" class="form-control" id="reputasi" />
                  <div v-if="theErrors.reputasi" class="mt2 text-danger">{{ theErrors.reputasi[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="cakupan" class="col-sm-2 col-form-label">Cakupan</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.cakupan" class="form-control" id="cakupan" />
                  <div v-if="theErrors.cakupan" class="mt2 text-danger">{{ theErrors.cakupan[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="lama_pemulihan" class="col-sm-2 col-form-label">Lama Pemulihan</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.lama_pemulihan" class="form-control" id="lama_pemulihan" />
                  <div v-if="theErrors.lama_pemulihan" class="mt2 text-danger">{{ theErrors.lama_pemulihan[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="lama_penyimpangan" class="col-sm-2 col-form-label">Lama Penyimpangan</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.lama_penyimpangan" class="form-control" id="lama_penyimpangan" />
                  <div v-if="theErrors.lama_penyimpangan" class="mt2 text-danger">{{ theErrors.lama_penyimpangan[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="product_image" class="col-sm-2 col-form-label">Product Image</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.product_image" class="form-control" id="product_image" />
                  <div v-if="theErrors.product_image" class="mt2 text-danger">{{ theErrors.product_image[0] }}</div>
                </div>
              </div>
              <div class="form-group row">
                <label for="dampak_sosial" class="col-sm-2 col-form-label">Dampak Sosial</label>
                <div class="col-sm-10">
                  <input type="text" v-model="form.dampak_sosial" class="form-control" id="dampak_sosial" />
                  <div v-if="theErrors.dampak_sosial" class="mt2 text-danger">{{ theErrors.dampak_sosial[0] }}</div>
                </div>
              </div>
              <div class="row">
                  <div class="col-12 text-right">
                      <input type="button" value="Go Back" onclick="history.back(-1)" />
                      <button type="submit" @click.prevent="updateCategory" class="btn btn-primary">
                        Submit
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
import { required, minLength } from "vuelidate/lib/validators";
export default {
  data() {
    return {
   props: {
   id: {
     required: true
    }
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
      theErrors: [],
      items:[],
      consequences : [],
    };
  },
  mounted() {
      this.loadData();
      this.getData();
  },
  methods: {
     
      loadData() {
           let id = this.form.id;
            axios.get("api/consequence"+id).then(response => {
                this.items = Object.values(response.data);
                //console.log(Object.values(response.data));
            });
        },
      getData(item,tipe) {
             if (tipe == "getData") {
                this.form.nilai = item.nilai;
                this.form.konsekuensi = item.konsekuensi;
                this.form.financial = item.financial;
                this.form.objective = item.objective;
                this.form.legal = item.legal;
                this.form.biaya = item.biaya;
                this.form.reputasi = item.reputasi;
                this.form.cakupan = item.cakupan;
                this.form.lama_pemulihan = item.lama_pemulihan;
                this.form.lama_penyimpangan = item.lama_penyimpangan;
                this.form.product_image = item.product_image;
                this.form.dampak_sosial = item.dampak_sosial;
            } else {
                this.editMode = false;
                this.form.nilai = "";
                this.form.konsekuensi = "";
                this.form.financial = "";
                this.form.objective = "";
                this.form.legal = "";
                this.form.biaya = "";
                this.form.reputasi = "";
                this.form.cakupan = "";
                this.form.lama_pemulihan = "";
                this.form.lama_penyimpangan = "";
                this.form.product_image = "";
                this.form.dampak_sosial = "";
            }
          },

      async update() {
            this.$v.form.$touch();
            if (this.$v.form.$anyError) {
                return;
            }
            try {
                let id = this.form.id;
                let updated = await axios.put(
                    "api/consequence/" + id,
                    this.form
                );
                if (updated.status == 200) {
                    this.form.nilai = "";
                    this.form.konsekuensi = "";
                    this.form.financial = "";
                    this.form.objective = "";
                    this.form.legal = "";
                    this.form.biaya = "";
                    this.form.reputasi = "";
                    this.form.cakupan = "";
                    this.form.lama_pemulihan = "";
                    this.form.lama_penyimpangan = "";
                    this.form.product_image = "";
                    this.form.dampak_sosial = "";
                    this.hideModal();
                    this.$swal({
                        icon: "success",
                        title: "Consequence Updated successfully"
                    });
                    this.loadData();
                }
            } catch (e) {
                this.$swal({
                    icon: "Error",
                    title:
                        "Consequence Updated Failed " + e.response.data.errors
                });
                this.theErrors = e.response.data.errors;
            }
        },
  }
};
</script>

<style>
</style>
