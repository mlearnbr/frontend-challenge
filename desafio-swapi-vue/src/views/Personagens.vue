<template>
  <div class="personagens pt-4">
    <h1 class="subheading grey--text">Personagens</h1>
    <v-container class="my-2">
      <v-layout row wrap>
        <v-flex xs12 sm6 md4 lg3 v-for="people in peoples" :key="people.name">
          <v-card flat class="text-xs-center ma-3">
            <v-responsive class="pt-4">
              <v-avatar size="100" class="grey lighten-2">
                <img src="@/assets/thumb.jpg" alt>
              </v-avatar>
            </v-responsive>
            <v-card-text>
              <div class="subheading">Nome: {{ people.name }}</div>
              <div class="grey--text">Ano de nascimento: {{ people.birth_year }}</div>
              <div class="grey--text">Espécie: {{ peopleSpecie.name }}</div>
            </v-card-text>
            <v-card-actions>
              <v-btn flat block color="grey" @click="peopleDetails(people)">
                <v-icon small left>remove_red_eye</v-icon>
                <span>Detalhes</span>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
      <v-flex pt-5>
        <div class="text-xs-center">
          <v-btn class="black" flat dark :disabled="previous === null" @click="previousPage">
            <v-icon left>navigate_before</v-icon>
            <span>Anterior</span>
          </v-btn>
          <v-btn class="black" flat dark :disabled="next === null" @click="nextPage">
            <span>Próximo</span>
            <v-icon right>navigate_next</v-icon>
          </v-btn>
        </div>
      </v-flex>
    </v-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      page: 1,
      count: 0,
      next: null,
      previous: null,
      urlPeoples: "https://swapi.co/api/people/?page=",
      peoples: [],
      peoplesDetails: [],
      peopleSpecie: [],
      idPeople: 0
    };
  },
  methods: {
    // Envia os dados do personagem para a pagina personagem detalhes
    peopleDetails(people) {
      // Recupera a url do personagem
      let urlPeople = people.url;
      // Conta a quantidade de caracteres
      let count = urlPeople.length;
      // Transforma a url do personagem em id
      if (count === 30) {
        this.idPeople = urlPeople.slice(28, 29);
      } else {
        this.idPeople = urlPeople.slice(28, 30);
      }

      // Direcionamento para a pagina personagem detalhes
      this.$router.push("/personagem/" + this.idPeople);
    },

    // Buscar todos os personagens conforme a pagina
    getPeoples(page) {
      // Faz a requisição para a api buscando todos os personagens conforme a url (https://swapi.co/api/people/?page=1)
      this.$http.get(this.urlPeoples + page).then(resultado => {
        // Armazena o resultado da requisição da api contendo todos os personagens conforme a pagina
        this.peoples = resultado.data.results;
        // Armazena a quantidade total de personagens
        this.count = resultado.data.count;
        // Armazena a url para a proxima pagina
        this.next = resultado.data.next;
        // Armazena a url para a pagina anterior
        this.previous = resultado.data.previous;
      });
    },
    // Pagina anterior
    previousPage() {
      this.page--;
      this.getPeoples(this.page);
    },
    // Proxima pagina
    nextPage() {
      this.page++;
      this.getPeoples(this.page);
    }
  },
  mounted() {
    // Ao carregar a pagina executa o getPeoples()
    this.getPeoples(this.page);
  }
};
</script>

<style>
btnBlack {
  background: black;
}
</style>


