<template>
    <div>
        <body class="hold-transition login-page">
            <div class="login-box" style="width:400px !important">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                <a href="/" class="h1"><b>HIRA</b>DC</a>
                </div>

                <div class="card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <div v-if="loginFailed" class="alert alert-danger">
                        Email atau Password Anda salah.
                    </div>

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Email" name="email" v-model="user.email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div v-if="validation.email" class="mt-2 alert alert-danger">
                            Masukkan Email
                        </div>
                        <p class="text-danger" v-text="errors.email"></p>
                    </div>

                    <div class="form-group">
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" v-model="user.password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>

                        <div v-if="validation.password" class="mt-2 alert alert-danger">
                            Masukkan Password
                        </div>
                        <p class="text-danger" v-text="errors.password"></p>
                    </div>

                    <div class="row">
                        <div class="col-7">
                            <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                Remember Me
                            </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-5">
                            <button @click="login" class="btn btn-primary btn-block">
                            <i class="fas fa-sign-in-alt"></i>
                                Sign In
                            </button>
                        </div>
                        <!-- /.col -->
                        </div>

                    <p class="mb-0">
                        <router-link :to="{ name: 'registrasi' }">Create New Account!</router-link>
                    </p>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
            </div>

        </body>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                
                //state loggedIn with localStorage
                loggedIn: localStorage.getItem('loggedIn'),
                //state token
                token: localStorage.getItem('token'),
                //state user
                user: [],
                //state validation
                validation: [],
                //state login failed
                loginFailed: null,

                errors: {}
            }
        },
        methods: {
            /*login(){
                axios.post('api/login', this.user).then((response) => {
                    localStorage.setItem('token', response.data)
                    this.$router.push('/')
                    
                }).catch((errors) => {
                    this.errors = errors.response.data.errors
                })
            }*/

            login() {
                if (this.user.email && this.user.password) {
                    axios.get('/sanctum/csrf-cookie')
                        .then(response => {
                            //debug cookie
                            //console.log(response)

                            axios.post('api/login', {
                                email: this.user.email,
                                password: this.user.password
                            }).then(res => {

                                //debug user login
                                //console.log(res)

                                if (res.data.success) {

                                    //set localStorage
                                    localStorage.setItem("loggedIn", "true")

                                    //set localStorage Token
                                    localStorage.setItem("token", res.data.token)

                                    //change state
                                    this.loggedIn = true

                                    //redirect dashboard
                                    return this.$router.push({ name: 'home' })

                                } else {

                                    //set state login failed
                                    this.loginFailed = true

                                }

                            }).catch(error => {
                                console.log(error)
                                 this.loginFailed = true
                            })

                        })
                }

                this.validation = []

                if (!this.user.email) {
                    this.validation.email = true
                }

                if (!this.user.password) {
                    this.validation.password = true
                }

            }
        },

        //check user already logged in
        mounted() {
            if (this.loggedIn) {
                //return this.$router.push({ name: 'home' })
            }
        }
    }
</script>