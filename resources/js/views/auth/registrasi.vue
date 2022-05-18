<template>
    <div>

    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                <a href="/" class="h1"><b>HIRA</b>DC</a>
                </div>
                <div class="card-body">
                <p class="login-box-msg">Register a new membership</p>

                    <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Full name" name="name" v-model="user.name">
                    <div class="input-group-append">
                        <div class="input-group-text">
                        <span class="fas fa-user"></span>
                        </div>
                    </div>
                   <!--  <p class="text-danger" v-text="errors.name"></p> -->
                    </div>
                    <div class="input-group mb-3">
                    <input type="email" class="form-control" placeholder="Email" name="email" v-model="user.email">
                    <div class="input-group-append">
                        <div class="input-group-text">
                        <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                  <!--   <p class="text-danger" v-text="errors.email"></p> -->
                    </div>
                    <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password" v-model="user.password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                        </div>
                    </div>
                   <!--  <p class="text-danger" v-text="errors.password"></p> -->
                    </div>
                    <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Retype password" name="password_confirmation" v-model="user.password_confirmation">
                    <div class="input-group-append">
                        <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    </div>
                    
                    <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                        <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                        <label for="agreeTerms">
                        I agree to the <a href="#">terms</a>
                        </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button @click="registerUser" class="btn btn-primary btn-block">Register</button>
                    </div>
                    <!-- /.col -->
                    </div>

                    <router-link to="/login">Already have an account!</router-link>
                </div>
                <!-- /.form-box -->
            </div><!-- /.card -->
        </div>
        </body>
       
    </div>
</template>

<script>
    export default {
        data() {
            return {
                user: [],
                errors: {}
            }
        },
        methods: {
            registerUser(){
                    if(this.user.password!=this.user.password_confirmation){
                        this.$swal({
                            icon: 'error',
                            title: 'Password Tidak Sama!!'
                        })

                    }
                    else if(this.user.name && this.user.email && (this.user.password == this.user.password_confirmation)){
                     axios.get('/sanctum/csrf-cookie')
                        .then(response => {
                            //debug cookie
                           //console.log(response)
                            axios.post('/api/registrasi', {
                                name   : this.user.name,
                                email  : this.user.email,
                                password: this.user.password,
                                password_confirmation: this.user.password_confirmation,
                            }).then(res => {
                                //debug user login
                                console.log(res)
                                if (res.status==200) {
                                    //redirect dashboard
                                   this.$swal({
                                        icon: 'success',
                                        title: 'Registrasi Berhasil !!'
                                    });
                                    return this.$router.push({ name: 'login' })

                                } else {
                                     this.$swal({
                                        icon: 'error',
                                        title: 'Registrasi Gagal'
                                    })
                                }

                            }).catch(error => {
                                console.log(error)
                            })

                        })
                    }
                    else {
                        this.$swal({
                            icon: 'error',
                            title: 'Registrasi Gagal'
                        })
                    }
                }
            }

        }  
    
</script>