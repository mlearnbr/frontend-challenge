(async () => {
    var get_data = location.search.slice(1);


    //Personagens
    const where = encodeURIComponent(JSON.stringify({
      "name": {
        "$exists": true
      }
    }));
    const response = await fetch(
      `https://parseapi.back4app.com/classes/SWAPI_Character?limit=200&order=name&where=${where}`,
      {
        headers: {
          'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
          'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
        }
      }
    );
    const data = await response.json();
    

    //Filmes
    const relation_where_films = encodeURIComponent(JSON.stringify({
      "characters":{
        "__type": "Pointer",
        "className": "SWAPI_Character",
        "objectId": get_data,
      }
    }));
    const resp_films = await fetch(
      `https://parseapi.back4app.com/classes/SWAPI_Film?&where=${relation_where_films}`,
      {
        headers: {
          'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
          'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
        }
      }
    );
    const films = await resp_films.json();


    //Especies
    const relation_where_species = encodeURIComponent(JSON.stringify({
        "people":{
          "__type": "Pointer",
          "className": "SWAPI_Character",
          "objectId": get_data,
        }
    }));
    const resp_species = await fetch(
      `https://parseapi.back4app.com/classes/SWAPI_Specie?&where=${relation_where_species}`,
      {
        headers: {
          'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
          'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
        }
      }
    );
    const species = await resp_species.json();
    

    //Planetas
    const resp_planet = await fetch(
      `https://parseapi.back4app.com/classes/SWAPI_Planet`,
      {
        headers: {
          'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
          'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
        }
      }
    );
    const planet = await resp_planet.json();

    

    if(response.status >= 200 && response.status < 400 && resp_films.status >= 200 && resp_films.status < 400 && resp_species.status >= 200 && resp_species.status < 400 && resp_planet.status >= 200 && resp_planet.status < 400){
      
      const obj_st = data.results;

      const voltar = document.getElementById("voltar");
      const arrow = document.createElement('a');
      arrow.setAttribute('class', 'arrow');
      voltar.appendChild(arrow);
      arrow.href = "index.html";

      const arrow_1 = document.createElement('div');
      arrow_1.setAttribute('id', 'arrow_1');
      arrow.appendChild(arrow_1);

      const arrow_2 = document.createElement('p');
      arrow_2.setAttribute('id', 'arrow_2');
      arrow.appendChild(arrow_2);
      arrow_2.textContent = "VOLTAR";

      const principal = document.getElementById("psg");

      const container = document.createElement('div');
      container.setAttribute('class', 'container');

      principal.appendChild(container);

      const cdiv_1 = document.createElement('div');
      const cdiv_2 = document.createElement('div');
      cdiv_1.setAttribute('class', 'cdiv');
      cdiv_2.setAttribute('class', 'cdiv');
      cdiv_1.setAttribute('id', 'cdiv_1');
      cdiv_2.setAttribute('id', 'cdiv_2');

      container.appendChild(cdiv_1);
      container.appendChild(cdiv_2);

      const img = document.createElement('img');
      img.setAttribute('id', 'img_charc');

      $.getJSON("images.json", function(out) {

        obj_st.forEach(Personagem => {

            if(Personagem.objectId == get_data){


                //Imagem
                for(let x = 0; x < out.length; x++){
                  if(Personagem.name == out[x].name)
                    img.src = out[x].image;
                }


                //Nome
                const h1 = document.createElement('h1');
                h1.textContent = Personagem.name;
                

                //Nascimento
                const rotulo1 = document.createElement('h4');
                rotulo1.setAttribute('class', 'rotulo');
                rotulo1.textContent = "Nascimento:";

                const p1 = document.createElement('p');
                if(Personagem.birthYear == undefined){
                    p1.textContent = "Desconhecido";
                } else{
                    p1.textContent = Personagem.birthYear;
                }
                

                //Cor do olho
                const rotulo2 = document.createElement('h4');
                rotulo2.setAttribute('class', 'rotulo');
                rotulo2.textContent = "Cor do olho:";

                const p2 = document.createElement('p');
                p2.textContent = Personagem.eyeColor;


                //Gênero
                const rotulo3 = document.createElement('h4');
                rotulo3.setAttribute('class', 'rotulo');
                rotulo3.textContent = "Gênero:";

                const p3 = document.createElement('p');
                p3.textContent = Personagem.gender;


                //Cor do cabelo
                const rotulo4 = document.createElement('h4');
                rotulo4.setAttribute('class', 'rotulo');
                rotulo4.textContent = "Cor do cabelo:";

                const p4 = document.createElement('p');
                p4.textContent = Personagem.hairColor;


                //Altura
                const rotulo5 = document.createElement('h4');
                rotulo5.setAttribute('class', 'rotulo');
                rotulo5.textContent = "Altura:";

                const p5 = document.createElement('p');
                p5.textContent = Personagem.height+"cm";


                //Peso
                const rotulo6 = document.createElement('h4');
                rotulo6.setAttribute('class', 'rotulo');
                rotulo6.textContent = "Peso:";

                const p6 = document.createElement('p');
                if(Personagem.mass == undefined){
                    p6.textContent = "Desconhecido";
                } else{
                    p6.textContent = Personagem.mass+"kg";
                }


                //Cor da pele
                const rotulo7 = document.createElement('h4');
                rotulo7.setAttribute('class', 'rotulo');
                rotulo7.textContent = "Cor da pele:";

                const p7 = document.createElement('p');
                p7.textContent = Personagem.skinColor;


                //Planeta
                const rotulo8 = document.createElement('h4');
                rotulo8.setAttribute('class', 'rotulo');
                rotulo8.textContent = "Planeta natal:";

                const p8 = document.createElement('p');
                var obj_planet = planet.results;

                obj_planet.forEach(Planet => {
                  if(Planet.objectId == Personagem.homeworld.objectId){
                    p8.textContent = Planet.name;
                  }
                });
                if(p8.textContent == "")
                  p8.textContent = "Desconhecido";


                //Especie
                const rotulo9 = document.createElement('h4');
                rotulo9.setAttribute('class', 'rotulo');
                rotulo9.textContent = "Espécie:";

                const p9 = document.createElement('p');
                var obj_species = species.results;
              
                if(obj_species.length == 0)
                  p9.innerHTML += "Human";
                else{
                  obj_species.forEach(Especies => {
                    p9.innerHTML += Especies.name;
                  });
                }
                

                //Filmes
                const rotulo10 = document.createElement('h4');
                rotulo10.setAttribute('class', 'rotulo');
                rotulo10.textContent = "Filmes:";

                const p10 = document.createElement('p');
                var obj_films = films.results;
                //console.log(obj_films);
                obj_films.forEach(Filme => {
                  p10.innerHTML += Filme.title+"<br>";
                });
                

                cdiv_1.appendChild(h1);
                cdiv_1.appendChild(rotulo1);
                cdiv_1.appendChild(p1);
                cdiv_1.appendChild(rotulo2);
                cdiv_1.appendChild(p2);
                cdiv_1.appendChild(rotulo3);
                cdiv_1.appendChild(p3);
                cdiv_1.appendChild(rotulo4);
                cdiv_1.appendChild(p4);
                cdiv_1.appendChild(rotulo5);
                cdiv_1.appendChild(p5);
                cdiv_1.appendChild(rotulo6);
                cdiv_1.appendChild(p6);
                cdiv_1.appendChild(rotulo7);
                cdiv_1.appendChild(p7);
                cdiv_1.appendChild(rotulo8);
                cdiv_1.appendChild(p8);
                cdiv_1.appendChild(rotulo9);
                cdiv_1.appendChild(p9);
                cdiv_1.appendChild(rotulo10);
                cdiv_1.appendChild(p10);
                cdiv_2.appendChild(img);   
            }
        });
      });

    } else{
      console.log("Erro");

    }
})();