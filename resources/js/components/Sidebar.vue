<template>
    <!-- <div v-if="isLoggedIn"> -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="#" class="brand-link">
            <img
                src="https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
                alt="Logo"
                class="brand-image elevation-3"
                style="opacity: .8"
            />
            <span class="brand-text font-weight-light">HIRADC</span>
        </a>
        <div class="sidebar">
            <nav class="mt-2">
                <ul
                    class="nav nav-pills nav-sidebar flex-column"
                    data-widget="treeview"
                    role="menu"
                    data-accordion="false"
                >
                    <li class="nav-item">
                        <router-link
                            class="nav-link"
                            exact
                            :to="{ name: 'home' }"
                        >
                            <i class="nav-icon fas fa-home"></i>
                            <p>Home</p>
                        </router-link>
                    </li>

                    <div v-if="userview">
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-shopping-cart"></i>
                                <p>
                                    Master
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'karyawan' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-address-card"
                                        ></i>
                                        <p>Karyawan</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'category' }"
                                    >
                                        <i class="nav-icon fas fa-cogs"></i>
                                        <p>Kategori</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'asset' }"
                                    >
                                        <i class="nav-icon fas fa-archive"></i>
                                        <p>Asset</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'activity' }"
                                    >
                                        <i class="nav-icon fas fa-archive"></i>
                                        <p>Kegiatan</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'possibility' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-balance-scale"
                                        ></i>
                                        <p>Kemungkinan</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'mitigasi' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-balance-scale"
                                        ></i>
                                        <p>Mitigasi</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'unit' }"
                                    >
                                        <i class="nav-icon fas fa-archive"></i>
                                        <p>Unit Kerja</p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-shopping-cart"></i>
                                <p>
                                    Relasi
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'condition' }"
                                    >
                                        <i class="nav-icon fas fa-building"></i>
                                        <p>Kondisi</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'threat' }"
                                    >
                                        <i class="nav-icon fas fa-hard-hat"></i>
                                        <p>Threat</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'vulnerability' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-hand-holding-medical"
                                        ></i>
                                        <p>Vulnerability</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'term' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-dharmachakra"
                                        ></i>
                                        <p>Istilah</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'consequence' }"
                                    >
                                        <i class="nav-icon fas fa-dice"></i>
                                        <p>Konsekuensi</p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link
                                        class="nav-link"
                                        :to="{ name: 'k3team' }"
                                    >
                                        <i
                                            class="nav-icon fas fa-handshake"
                                        ></i>
                                        <p>Admin User</p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>
                    </div>
                    <li class="nav-item">
                        <router-link
                            class="nav-link"
                            :to="{ name: 'register' }"
                        >
                            <i class="nav-icon fas fa-registered"></i>
                            <p>register</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" @click="logout">Logout</a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- </div> -->
</template>

<script>
export default {
    data() {
        return {
            userview: true,
            items: []
        };
    },
    methods: {
        menu() {
            axios.get("api/login").then(response => {
                this.items = Object.values(response.data);
                console.log(Object.values(response.data));
                let id = this.items;
                if (id == 1) {
                    this.userview = true;
                } else if (id == 2) {
                    this.userview = false;
                } else if (id == 3) {
                    this.userview = false;
                } else {
                    this.userview = true;
                }
            });
        },

        logout() {
            //redirect
            return this.$router.push({ name: "login" });
        }
    }
};
</script>
