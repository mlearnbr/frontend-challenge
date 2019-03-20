<template>
  <nav>
    <v-toolbar app dark>
      <v-toolbar-side-icon class="hidden-sm-and-up" @click="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title class="headline text-uppercase">
        <span class="font-weight-light">Star</span>
        <span>Wars</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only" v-for="menu in menus" :key="menu.texto">
        <v-btn router :to="menu.route" flat>
          <v-icon left>{{ menu.icone }}</v-icon>
          {{ menu.texto }}
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>

    <v-navigation-drawer class="hidden-xs-only" v-model="drawer" app dark>
      <v-list>
        <v-list-tile v-for="menu in menus" :key="menu.texto" router :to="menu.route">
          <v-list-tile-action>
            <v-icon class="white--text">{{ menu.icone }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title class="white-text">{{ menu.texto }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      drawer: false,
      menus: [
        { icone: "dashboard", texto: "Home", route: "/" },
        { icone: "person", texto: "Personagens", route: "/personagens" }
      ]
    };
  }
};
</script>