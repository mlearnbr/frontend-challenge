<template>
  <!--Inicio de código com caixa de pesquisa e cards-->
  <div class="divPrincipal">

    <div class="cabecalho">      
      <img src="../assets/Star_Wars_logo-1.png" style="width: 155px; height: 65px">            
    </div>
    
    <div class="filtro">
      <div class="titulo-filtro">
          <p>Pesquisar personagem:</p>          
      </div>
      <div class="filtro-pesquisa">
        <input id="pesquisa" type="text" class="inputSearch">
        <button id="btn" @click="pesquisarPersonagens()" class="btnSearch">ir</button>          
      </div>
    </div>
              
    <div v-for="personagem in grupoPersonagens" :key="personagem.name">
      <div class="containerItem">
        <div class="card-nome">

          <div class="titulo">
            <div class="sliderTitle">
              <h3>Name: {{personagem.name}}</h3>
              <h3>Birth year: {{personagem.birth_year}}</h3>
            </div>
          </div>
          
          <div class="flip-card">
            <div class="flip-card-inner">

              <div class="flip-card-front">
                <div class="sliderBody">
                  <img v-bind:src="`https://starwars-visualguide.com/assets/img/characters/${personagem.url.replace(/[^0-9 ]/g,'')}.jpg`"/>
                </div>
              </div>
              
              <div class="flip-card-back">
                <div class="back-header">
                  <h2>Name: {{personagem.name}}</h2>
                </div>
                <div class="back-footer">                  
                  <p>Birth year: {{personagem.birth_year}} </p> 
                  <p>Eye color: {{personagem.eye_color}}</p>
                  <p>Gender: {{personagem.gender}}</p>
                  <p>Hair color: {{personagem.hair_color}}</p>
                  <p>Height: {{personagem.height}}</p>
                  <p>Mass: {{personagem.mass}} kg</p>
                  <p>Skin color: {{personagem.skin_color}}</p>
                  <p>Homeworld: {{planetas.name}}</p>                  
                  <!-- <p>Species: {{personagem.species}}</p>
                  <p>Films: {{personagem.films}}</p> -->                                   
                </div>
              </div>
             </div>
           </div>
            
         </div>
       </div>
     </div>
     <div>
        <ul>
            <li v-for="item in filmes.results">
                {{ item.title }}
            </li>
        </ul>
        <!-- <pre>{{ item.title }}</pre> -->
     </div> 
     
   </div>  
</template>

<script>
export default {
  name: 'vueExibicao',
  data: function(){
    return {
      grupoPersonagens: [],
      planetas: [],
      filmes: []
    }
  },
  methods: {

    listarPersonagens(nome){
      this.grupoPersonagens = [];
      const url = `https://swapi.co/api/people/?search=${nome}`;
            
      const sw = fetch(url)
                .then(response => response.json())
                .then(response => {
                    response.results.map(personagem => {
                        this.grupoPersonagens.push(personagem);
                    });
                });
    },

    pesquisarPersonagens(){
      let campo_pesquisa = document.querySelector("#pesquisa").value
      if(campo_pesquisa != ""){
        this.listarPersonagens(campo_pesquisa);
        this.listarFilmes();
      }
    },

    listarFilmes(){
        fetch("https://swapi.co/api/films/")
        .then(response => response.json())
        .then(data=>{
            this.filmes = data;
        })
    }

  }
}
</script>

<style lang="scss" scoped>

    button, input, select, textarea {
        background-color: #383434;
        border-style: none;
        color: inherit;
    }

</style>