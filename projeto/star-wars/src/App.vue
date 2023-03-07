<template>  
  <div id="app">
    <starWars/>
  </div>
</template>

<script>
import starWars from './components/starWars';

export default {
  name: 'App',
  components: {    
    starWars
  },
  data: () => ({
    //
  }),
};
</script>
<style lang="scss">
  body{
    width: 100%;
    height: 100%;
    background-color: #000;
  }
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
</style>
