<template>

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="#" class="brand-link">
            <img src="https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png" alt="Logo" class="brand-image elevation-3" style="opacity: .8"/>
            <span class="brand-text font-weight-light">HIRADC</span>
        </a>
        <div class="sidebar">
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="https://picsum.photos/300/300" class="img-circle elevation-2" alt="Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">{{ user.name }}</a>
                </div>
            </div>

            <nav class="mt-2">
                <div v-if="loggedIn">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  
                        <li class="nav-item">
                            <router-link class="nav-link" exact :to="{ name: 'home' }">
                                <i class="nav-icon fas fa-home"></i>
                                <p>Home</p>
                            </router-link>
                        </li>
                     <div v-if="level=='admin'" >
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-cogs"></i>
                                <p>
                                    Master
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview"> 
                              <!--   <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'karyawan' }">
                                        <i class="nav-icon fas fa-users"></i>
                                        <p>Karyawan</p>
                                    </router-link>
                                </li> -->
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'category' }">
                                            <i class="nav-icon fas fa-bars"></i>
                                        <p>Kategori</p>
                                    </router-link>
                                </li>
                               <!--  <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'asset' }">
                                        <i class="nav-icon fas fa-archive"></i>
                                        <p>Asset</p>
                                    </router-link>
                                </li> -->
                               <!--  <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'activity' }">
                                        <i class="nav-icon fas fa-people-carry"></i>
                                        <p>Kegiatan</p>
                                    </router-link>
                                </li> -->
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'possibility' }">
                                        <i class="nav-icon fas fa-balance-scale"></i>
                                        <p>Kemungkinan</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'mitigasi' }">
                                        <i class="nav-icon fas fa-chart-line"></i>
                                        <p>Mitigasi</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'unit' }">
                                        <i class="nav-icon fas fa-building"></i>
                                        <p>Unit Kerja</p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-link"></i>
                                <p>
                                    Relasi
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'condition' }">
                                        <i class="nav-icon fas fa-building"></i>
                                        <p>Kondisi</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'threat' }">
                                        <i class="nav-icon fas fa-hard-hat"></i>
                                        <p>Threat</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'vulnerability' }" >
                                        <i class="nav-icon fas fa-hand-holding-medical"></i>
                                        <p>Vulnerability</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'term' }" >
                                        <i class="nav-icon fas fa-dharmachakra"></i>
                                        <p>Istilah</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'consequence' }" >
                                        <i class="nav-icon fas fa-dice"></i>
                                        <p>Konsekuensi</p>
                                    </router-link>
                                </li>
                            <!--     <li class="nav-item">
                                    <router-link class="nav-link" :to="{ name: 'k3team' }" >
                                        <i class="nav-icon fas fa-handshake"></i>
                                        <p>Admin User</p>
                                    </router-link>
                                </li> -->
                            </ul>
                        </li>
                    </div>

                    <li class="nav-item">
                        <router-link class="nav-link" :to="{ name: 'register' }" >
                            <i class="nav-icon fas fa-registered"></i>
                            <p>register</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" :to="{ name: 'Registerpertanggal' }" >
                            <i class="nav-icon fas fa-registered"></i>
                            <p>Cetak Register</p>
                        </router-link>
                    </li>
                  
                    
                    <li class="nav-header"></li>

                    <li class="nav-item">
                        <a class="nav-link" @click="logout" style="cursor:pointer">
                            <i class="nav-icon fas fa-sign-out-alt"></i>
                            Logout
                        </a>
                    </li>
               
                </ul>
                </div>
            </nav>
        </div>
    </aside>
    <!-- </div> -->
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
            level:null

        };
    },
    created() {
        axios.get('api/user', {headers: {'Authorization': 'Bearer '+this.token}})
        .then(response => {
            //console.log(response.data)
            this.user = response.data // assign response to state user
            this.level= response.data.level
            //console.log(this.level)
        })
    },

    methods: {
        logout() {
            axios.get('api/logout')
            .then(() => {
                //remove localStorage
                localStorage.removeItem("loggedIn")    
                //redirect
                return this.$router.push({ name: 'login' })
            })
        }

    },
        //check user logged in or not
    mounted() {
        if(!this.loggedIn) {
            return this.$router.push({ name: 'login' })
        }
    }

};
</script>
