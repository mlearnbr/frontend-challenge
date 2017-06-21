<template>
  <section class="people container">
  <h1>People Data</h1>
    <div class="row">
      <div class="col xl12 l12 m12 s12">
        <div class="row">
          <div class="col s6" v-for="(person, key, index) in peopleList">
            <ul class="collection">
              <li class="collection-item avatar indigo lighten-5">
                <i class="material-icons circle">person_pin</i>
                <span class="title">{{ person.name }}</span>
                <p>Specie: {{ speciesList.name }}</p>
                <p>Birth Year: {{ person.birth_year }}</p>
                <router-link :to="'/people/' + index" class="secondary-content"><i class="material-icons">grade</i></router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'people',
  data() {
    return {
      peopleList: [],
      speciesList: []
    }
  },
  methods: {
    fetchApi() {
      this.$http.get('http://swapi.co/api/people').then(response => {
        this.peopleList = response.data.results
      })
    },

    getSpecies() {
      this.$http.get('http://swapi.co/api/species').then(response => {
        this.speciesList = response.data.results
      })
    }
  },
  created() {
    this.fetchApi(),
    this.getSpecies()
  }
}
</script>

<style lang="scss">
.people {
  h1 {
    color: #333;
  }
  .material-icons.circle {
    font-size: 2em !important;
  }
}
</style>