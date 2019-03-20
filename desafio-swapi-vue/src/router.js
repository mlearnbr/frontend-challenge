import Router from 'vue-router';
import Vue from 'vue';
// Views
import Home from './views/Home.vue';
import Personagem from './views/Personagem.vue';
import Personagens from './views/Personagens.vue';

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [{
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/personagens',
            name: 'personagens',
            component: Personagens
        },
        {
            path: '/personagem/:id',
            props: true,
            name: 'personagem',
            component: Personagem
        }
    ]
});