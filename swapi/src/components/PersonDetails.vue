<template>
  <section class="details container">
  <h1>Person details</h1>
    <div class="row">
      <div class="col s6">
        <ul class="collection">
          <li class="collection-item avatar indigo lighten-5">
            <i class="material-icons circle">person_pin</i>
            <span class="title">{{ personDetails.name }}</span>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'details',
  data() {
    return {
      personDetails: {}
    }
  },
  methods: {
    fetchSinglePerson(id) {
      this.$http.get('http://swapi.co/api/people/' + id).then(response => {
        console.log(response)
      })
    }
  },
  created() {
    this.fetchSinglePerson(this.$route.params.id)
  }
}
</script>

<style lang="scss">
</style>