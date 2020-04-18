<template>
  <div>

    <nav class="navbar is-fixed-top header has-shadow is-dark" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <p class="navbar-item">
          <b class="challenge">
            Challenge - Star Wars
          </b>
        </p>
      </div>
    </nav>

    <section class="main-content columns">
      <div class="container column is-10">
        <nuxt />
      </div>
    </section>

  </div>
</template>

<script>
export default {
  data () {
    return {
      items: [
        {
          title: 'Home',
          icon: 'home',
          to: { name: 'index' }
        }
      ]
    }
  }
}
</script>
<style scoped>

.main-content {
  background-color: grey;
  padding: 2rem 3rem;
  min-height: 100%;
  min-height: 100vh;
}

.challenge{
  color: yellow;
}  


</style>
