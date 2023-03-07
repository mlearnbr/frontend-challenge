<template>
  <v-container>
    <v-layout>
      <v-flex xs12 sm6 offset-sm3>
        <v-card>
          <v-img src="https://arcoiriscinemas.com.br/2014/wp-content/uploads/2016/04/Arcoplex_novosite_star_wars-01-724x269.jpg" aspect-ratio="2.75"></v-img>
          <v-card-title primary-title>
            <h4 class="display-1 font-weight-medium font-italic">{{ people.name }}</h4>
          </v-card-title>
          <v-card-text>
            <h5
              class="headline font-weight-light font-italic"
            >Ano de nascimento: {{ people.birth_year }}</h5>
            <h5 class="headline font-weight-light font-italic">Cor dos olhos: {{ people.eye_color }}</h5>
            <h5 class="headline font-weight-light font-italic">Gênero: {{ people.gender }}</h5>
            <h5
              class="headline font-weight-light font-italic"
            >Cor do cabelo: {{ people.hair_color }}</h5>
            <h5 class="headline font-weight-light font-italic">Altura: {{ people.height }}</h5>
            <h5 class="headline font-weight-light font-italic">Peso: {{ people.mass }}</h5>
            <h5 class="headline font-weight-light font-italic">Cor da pele: {{ people.skin_color }}</h5>
            <h5 class="headline font-weight-light font-italic">Planeta: {{ planetPeople }}</h5>
            <h5 class="headline font-weight-light font-italic">Filmes:</h5>
            <h5 class="headline font-weight-light font-italic">Espécie: {{ speciePeople }}</h5>
          </v-card-text>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>


<script>
export default {
  props: ["id"],
  data() {
    return {
      people: [],
      urlPeople: "https://swapi.co/api/people/",
      urlSpecies: "https://swapi.co/api/species/",
      urlPlanets: "https://swapi.co/api/planets/",
      idSpecie: 0,
      speciePeople: "",
      idPlanet: 0,
      planetPeople: ""
    };
  },
  methods: {
    // Busca o personagem passando o id do personagem
    getPeople(id) {
      // Faz a requisição para a api buscando o personagem conforme a url https://swapi.co/api/people/1  
      this.$http.get(this.urlPeople + this.id).then(resultado => {
        // Armazena o resultado da requisição da api contendo o personagem conforme o seu id
        this.people = resultado.data;
        // Executa o metodo getIdSpecie
        this.getIdSpecie();
        // Executa o metodo getIdPlanet
        this.getIdPlanet();
      });
    },

    // Busca o id da especie relacionada ao personagem
    getIdSpecie() {
      // Recupera a url da especie
      let urlSpeciesPeople = this.people.species[0];
      // Conta a quantidade de caracteres
      let count = urlSpeciesPeople.length;
      // Transforma a url da especie em id
      if (count === 31) {
        this.idSpecie = urlSpeciesPeople.slice(29, 30);
      } else {
        this.idSpecie = urlSpeciesPeople.slice(29, 31);
      }

      // Executa o metodo passando o id da especie
      this.getSpecie(this.idSpecie);
    },

    // Busca a especie conforme seu id
    getSpecie(id) {
      // Faz a requisição para a api buscando a especie conforme o id https://swapi.co/api/species/1  
      this.$http.get(this.urlSpecies + this.idSpecie).then(resultado => {
        // Armazena o resultado da requisição da api contendo a especie relacionada ao personagem
        this.speciePeople = resultado.data.name;
      });
    },

    // Busca o id do planeta relacionada ao personagem
    getIdPlanet() {
      // Recupera a url do planeta
      let urlPlanetsPeople = this.people.homeworld;
      // Conta a quantidade de caracteres
      let count = urlPlanetsPeople.length;
      // Transforma a url do planeta em id
      if (count === 31) {
        this.idPlanet = urlPlanetsPeople.slice(29, 30);
      } else {
        this.idPlanet = urlPlanetsPeople.slice(29, 31);
      }
      // Executa o metodo passando o id do planeta
      this.getPlanet(this.idPlanet);
    },

    // Busca o planeta conforme seu id
    getPlanet(id) {
      // Faz a requisição para a api buscando o planeta conforme o id https://swapi.co/api/planets/1  
      this.$http.get(this.urlPlanets + this.idPlanet).then(resultado => {
        // Armazena o resultado da requisição da api contendo o planeta relacionado ao personagem
        this.planetPeople = resultado.data.name;
      });
    }
  },
  mounted() {
    // Ao carregar a pagina executa o getPeople()
    this.getPeople(this.id);
  }
};
</script>
