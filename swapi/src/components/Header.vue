<template>
  <header>
    <nav>
      <div class="nav-wrapper container">
        <router-link to="/" class="brand-logo center hide-on-med-and-down"><i class="material-icons">stars</i> SW API</router-link>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
          <li><router-link to="/people">Peoples</router-link></li>
          <li><router-link to="/planets">Planets</router-link></li>
        </ul>
        <div class="menu-mobile hide-on-large-only">
          <router-link to="/" class="brand-logo left"><i class="material-icons">stars</i> SW API</router-link>
          <ul class="right hide-on-large-only">
            <li><router-link to="/people">People</router-link></li>
            <li><router-link to="/planets">Planets</router-link></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  name: 'header'
}
</script>

<style>
header nav {
  background-color: #13293D;
}

header nav .brand-logo {
  color: #1de9c3;
  font-weight: 200;
}

.menu-mobile ul {
  margin-left: 40px;
}
</style>