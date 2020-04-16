<template>
  <div style="height: 100vh;">
    <nav
      class="navbar header has-shadow is-primary"
      role="navigation"
      aria-label="main navigation"
    >
      <div class="navbar-brand">
         <p class="navbar-item">Desafio - Star Wars</p>
        <div class="navbar-burger">
          <span />
          <span />
          <span />
        </div>
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
  background-color: #F7F8FB;
  padding: 2rem 3rem;
}
</style>
