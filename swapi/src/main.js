import Vue from 'vue'
import App from './App.vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'

Vue.use(VueResource)
Vue.use(VueRouter)

const routes = [
  { path: '/', component: people },
  { path: '/people', component: people },
  { path: '/people', component: people },
  { path: '/planets', component: planets },
]

new Vue({
  el: '#app',
  render: h => h(App)
})
