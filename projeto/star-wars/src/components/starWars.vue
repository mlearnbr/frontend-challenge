<template>
  <!--Inicio de código com caixa de pesquisa e cards-->
  <div class="divPrincipal">

    <div class="cabecalho">      
      <img src="../assets/Star_Wars_logo-1.png" style="width: 155px; height: 65px">            
    </div>
    
    <div class="filtro">
      <div class="titulo-filtro">
          <p>Pesquisar nome do personagem:</p>          
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
                  <p><strong>Birth year:</strong> {{personagem.birth_year}} </p> 
                  <p><strong>Eye color:</strong> {{personagem.eye_color}}</p>
                  <p><strong>Gender:</strong> {{personagem.gender}}</p>
                  <p><strong>Hair color:</strong> {{personagem.hair_color}}</p>
                  <p><strong>Height:</strong> {{personagem.height}}</p>
                  <p><strong>Mass:</strong> {{personagem.mass}} kg</p>
                  <p><strong>Skin color:</strong> {{personagem.skin_color}}</p>
                  <div v-for="(planeta,index) in planetas" :key="index">
                    <p><strong>Homeworld:</strong> {{planeta.name}}</p>                                   
                  </div> 
                  <p><strong>films:</strong></p>                 
                  <!-- <div v-for="filme in filmes" :key="filme.episode_id"> -->
                  <div v-for="(filme, index) in filmes" :key="'A' + index">  
                    <p>{{filme.title}}</p>                                   
                  </div>
                  <!-- <div v-for="especie in especies" :key="especie.classification"> -->
                  <p><strong>Species:</strong></p>
                  <div v-for="(especie, index) in especies" :key="'B' + index">  
                    <p>{{especie.name}}</p>                                   
                  </div>                         
                </div>
              </div>
             </div>
           </div>
            
         </div>
       </div>
     </div>
     
   </div>  
</template>

<script>
import axios from 'axios';

export default {
  name: 'vueExibicao',
  data: function(){
    return {
      grupoPersonagens: [],
      planetas: [],
      filmes: [],
      especies: []
    }
  },
  methods: {

    listarPersonagens(nome){
      this.grupoPersonagens = [];
      this.planetas = [];
      this.filmes = [];
      this.especies = [];
      
      const url = `https://swapi.co/api/people/?search=${nome}`;
            
      const sw = fetch(url)
                .then(response => response.json())
                .then(response => {
                    response.results.map(personagem => {
                        this.grupoPersonagens.push(personagem);
                        axios.get(personagem.homeworld).then((res)=>{this.planetas.push(res.data)})
                        personagem.films.map(item => {console.log(item); axios.get(item).then((res)=>{this.filmes.push(res.data)}) })   
                        axios.get(personagem.species).then((res)=>{this.especies.push(res.data)})                                                                     
                    });
                });
    },

    pesquisarPersonagens(){
      let campo_pesquisa = document.querySelector("#pesquisa").value
      if(campo_pesquisa != ""){
        this.listarPersonagens(campo_pesquisa);        
      }
    },

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