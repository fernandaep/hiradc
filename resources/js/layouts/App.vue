<template>
 <div v-if="loggedIn">
    <div class="wrapper">
      <Navbar />
      <Sidebar />    
      <div class="content-wrapper">
        <router-view></router-view>
      </div>
      <Footer />
    </div>
  </div>

  <div v-else>
    <router-view></router-view>
  </div>
</template>

<script>

import Navbar from '../components/Navbar'
import Footer from '../components/Footer'
import Sidebar from '../components/Sidebar'
import Login from '../views/auth/login'

export default {
    name: 'App',
    data() {
      return {
        loggedIn: null
      }
    },
      methods: {
      getLoggedIn() {
        this.loggedIn = localStorage.getItem("loggedIn")
      }
    },

    watch: {
      $route: {
        immediate: true,
        handler() {
          this.getLoggedIn()
        }
      }
    },

  components: { Navbar, Footer, Sidebar, Login },
  mounted() {
    window.$('body').Layout();
    window.$('[data-widget="pushmenu"]').PushMenu();
    window.$('[data-widget="control-sidebar"]').ControlSidebar();
    window.$('ul[data-widget="treeview"]').Treeview('init');
    window.$('.dropdown').Dropdown();
    window.$('ul[data-widget="treeview"]').overlayScrollbars();
  }
  
}
</script>