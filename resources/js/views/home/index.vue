<template>
    <div>
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"> Selamat Datang <strong>{{ user.name }}</strong></h5>
                                <p class="card-text">
                                </p>
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

            //state loggedIn with localStorage
            loggedIn: localStorage.getItem('loggedIn'),
            //state token
            token: localStorage.getItem('token'),
            //state user logged In
            user: [],

            userview:true,
            items:[],            
            
        };
    },
    created() {
        axios.get('api/user', {headers: {'Authorization': 'Bearer '+this.token}})
        .then(response => {
            //console.log(response)
            this.user = response.data // assign response to state user
        })
    },

    mounted() {
        if (!this.loggedIn) {
            return this.$router.push({ name: 'login'})
        }
    }
}
</script>