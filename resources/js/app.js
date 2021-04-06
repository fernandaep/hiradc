import axios from 'axios'; 
window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

try {
    window.Popper = require('popper.js').default;
    window.$ = window.jQuery = require('jquery');

    require('bootstrap');
    require('overlayscrollbars');
    require('admin-lte');

} catch (e) {}

import Vue from 'vue';
import VueRouter from 'vue-router'; 
import routes from './router';
import App from './layouts/App.vue';
import { VuejsDatatableFactory } from 'vuejs-datatable';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';
import VueSweetalert2 from 'vue-sweetalert2';
import { Form, HasError, AlertError } from 'vform';
import moment from "moment"; 


import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'


Vue.filter("strToUpper", function(text) {
	return text.charAt(0).toUpperCase() + text.slice(1);
});

Vue.filter("formatDate", function(date) {
	return moment(date).format('MMMM Do YYYY');
}); 

window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

Vue.use(VueRouter,VuejsDatatableFactory);
Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueSweetalert2);

const app = new Vue({
    el: '#app',
    render: h=>h(App),
    router : new VueRouter(routes),
});
