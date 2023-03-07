import axios from 'axios';
import App from './App.vue';
import './plugins/vuetify';
import router from './router';
import store from './store';
import Vue from 'vue';

Vue.prototype.$http = axios;

Vue.config.productionTip = false;

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app');