const principal = document.getElementById("root");
const container = document.createElement('div');
const page_number = document.createElement('div');


function imgError(){
    console.log("Alert");
}

function print(obj_st){
    container.textContent = "";

    let url = 'https://cdn.jsdelivr.net/gh/akabab/starwars-api@0.2.1/api/all.json';


    $.getJSON("images.json", function(out) {

        var obj_blt = [];

        obj_st.forEach(Personagem => { 

            const blt = document.createElement('a');
            blt.setAttribute('class', 'blt');
            blt.href = "personagem.html?"+Personagem.objectId;
            
            const contain_dd = document.createElement('div');
            contain_dd.setAttribute('class', 'contain_dd');

            const h4 = document.createElement('h4');
            h4.textContent = Personagem.name;

            const thumb = document.createElement('img');
            thumb.setAttribute('class', 'thumb');
            thumb.setAttribute('onerror', 'imgError()');
    
            for(let x = 0; x < out.length; x++){
                if(Personagem.name == out[x].name){
                    thumb.src = out[x].image;
                    break;
                }
            }
    
            const p = document.createElement('p');
            if(Personagem.birthYear == undefined){
                p.textContent = "Desconhecido";
            } else{
                p.textContent = Personagem.birthYear;
            }
    
            
            blt.appendChild(thumb);
            blt.appendChild(contain_dd);
            contain_dd.appendChild(h4);
            contain_dd.appendChild(p);

            obj_blt.push(blt);

            
        });

        paginacao (obj_blt);

    });

    
};

async function coleta(arrIds){

    let soma_ch = [];

    arrIds.forEach(Item => {
        (async () => {
            const characters_in_films = encodeURIComponent(JSON.stringify({
                "films":{
                    "__type": "Pointer",
                    "className": "SWAPI_Film",
                    "objectId": Item,
                }
            }));
            const resp_ch = await fetch(
            `https://parseapi.back4app.com/classes/SWAPI_Character?&order=name&where=${characters_in_films}`,
            {
                headers: {
                'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
                'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
                }
            }
            );
            const characters = await resp_ch.json();
            var obj_ch = characters.results;

            soma_ch = soma_ch.concat(obj_ch);

            soma_ch = soma_ch.filter(function (i) {
                return !this[JSON.stringify(i)] && (this[JSON.stringify(i)] = true);
            }, Object.create(null));
            
            soma_ch.sort((a, b) => a.name > b.name ? 1 : -1);     

            print(soma_ch);

        })();
        
        

    });



};

(async () => {
    const where = encodeURIComponent(JSON.stringify({
   
        "name": {
        "$exists": true,
      },

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
    var obj_st = data.results;

    const where_films = encodeURIComponent(JSON.stringify({
        "episodeId": {
          "$exists": true,
        },
  
    }));
    const response_films = await fetch(
    `https://parseapi.back4app.com/classes/SWAPI_Film?limit=200&order=episodeId&where=${where_films}`,
    {
        headers: {
        'X-Parse-Application-Id': 'AHRp1njy0CzU3OtIPltkVUt9ngMsosraVed8wb6i',
        'X-Parse-REST-API-Key': 'gMLL0WCeOpkLpLEGsBKVV8pJpeCVKBIH3remakIM',
        }
    }
    );
    const films = await response_films.json();
    var obj_films = films.results;


    if(response.status >= 200 && response.status < 400 && response_films.status >= 200 && response_films.status < 400){
        const logo = document.createElement('img');
        logo.setAttribute('class', 'logo');
        logo.src = 'Star_Wars.svg'
        principal.appendChild(logo);

        const h1 = document.createElement('h1');
        h1.setAttribute('id', 'h1_st');
        h1.textContent = "SWAPI - Personagens de Star Wars";
        principal.appendChild(h1);

        const h3 = document.createElement('h3');
        h3.setAttribute('id', 'h3_st');
        h3.textContent = "Seus personagens favoritos ao alcance de um clique";
        principal.appendChild(h3);

        const btns = document.createElement('div');
        btns.setAttribute('class', 'btns');
        principal.appendChild(btns);

        const h2_ch = document.createElement('h2');
        h2_ch.setAttribute('id', 'h2_ch');
        h2_ch.textContent = "Personagens";
        principal.appendChild(h2_ch);

        container.setAttribute('class', 'container');
        principal.appendChild(container);

        page_number.setAttribute('class', 'pagenumbers');
        page_number.setAttribute('id', 'pagination');
        principal.appendChild(page_number);
        

        var arrIds = [];

        obj_films.forEach(Filmes =>{

            const contain_check = document.createElement('div');
            contain_check.type = 'div';
            contain_check.className = 'contain_check';

            btns.appendChild(contain_check);

            const checkbox = document.createElement("INPUT");
            checkbox.type = "checkbox";

            checkbox.value = Filmes.title;
            checkbox.id = Filmes.episodeId;
            checkbox.className = 'checks';

            contain_check.appendChild(checkbox);

            const label = document.createElement("label");
            label.type = 'label';
            label.innerText = Filmes.title;
            label.htmlFor = checkbox.id;

            contain_check.appendChild(label);
            
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                arrIds.push(Filmes.objectId);
                coleta(arrIds);

                } else {
                    arrIds.splice(arrIds.indexOf(Filmes.objectId), 1);
                    if(arrIds.length == 0){
                        print(obj_st);

                    } else{
                        coleta(arrIds);

                    }
                }
            });
        });   

        print(obj_st);
    
    } else{
        console.log("Erro");
        
    }
        
        
    



    
    
})();