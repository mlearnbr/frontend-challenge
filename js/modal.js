function pegarIdPersonagem(){
    
    var boxPersonagens = document.querySelectorAll(".box");
    boxPersonagens.forEach(box => {
        box.addEventListener('click', (e) => {
            
            var elemento = e.target;
            var idPersonagem = elemento.children[3].innerText;
            iniciaModal(idPersonagem);
            
        })
    })  
    
}


function iniciaModal(idPersonagem){

    var arrayPersonagensLocalStorage = JSON.parse(localStorage.getItem("arrayPersonagens"));
    
    var urlPersonagem = arrayPersonagensLocalStorage.results[idPersonagem-1].url;
    var idPersonagemLocalStorage = urlPersonagem.match(/\d/g);
    idPersonagemLocalStorage = idPersonagemLocalStorage.join("");

    let modalNome = document.querySelector(".modalNome");
    modalNome.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].name;

    let modalAnoNascimento = document.querySelector(".modalAnoNascimento");
    modalAnoNascimento.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].birth_year;

    let modalCorOlho = document.querySelector(".modalCorOlho");
    modalCorOlho.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].eye_color;

    let modalGenero = document.querySelector(".modalGenero");
    modalGenero.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].gender;

    let modalCorCabelo = document.querySelector(".modalCorCabelo");
    modalCorCabelo.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].hair_color;

    let modalAltura = document.querySelector(".modalAltura");
    modalAltura.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].height;

    let modalMassa = document.querySelector(".modalMassa");
    modalMassa.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].mass;

    let modalCorPele = document.querySelector(".modalCorPele");
    modalCorPele.innerHTML = arrayPersonagensLocalStorage.results[idPersonagem-1].skin_color;

    let modalMundo = document.querySelector(".modalMundo");
    modalMundo.setAttribute('homeworld', `${arrayPersonagensLocalStorage.results[idPersonagem-1].homeworld}`);
    fetchHomeWorld(modalMundo.getAttribute('homeworld'), modalMundo);

    let modalFilmes = document.querySelector(".modalFilmes");
    modalFilmes.setAttribute('films', `${arrayPersonagensLocalStorage.results[idPersonagem-1].films[0]}`);
    fetchFilms(modalFilmes.getAttribute('films'), modalFilmes);

    let modalEspecies = document.querySelector(".modalEspecies");
    modalEspecies.setAttribute('especie', `${arrayPersonagensLocalStorage.results[idPersonagem-1].species[0]}`);
    fetchSpecies(modalEspecies.getAttribute('especie'), modalEspecies);

    const modal = document.querySelector(".modal-container");
    modal.classList.add("mostrar");
    
    modal.addEventListener('click', (e) => {
        if(e.target.id == "modal-promocao" || e.target.className == "fechar"){
            modal.classList.remove('mostrar');
        }
    })

}

async function fetchFilms(url, elemento){
    return await fetch(url)
    .then(resp => resp.json())
    .then(filmes => {
        elemento.innerHTML = filmes.title;
    })
    .catch(err => console.error(err))
}

async function fetchHomeWorld(url, elemento){
    return await fetch(url)
    .then(resp => resp.json())
    .then(homeworld => {
        elemento.innerHTML = homeworld.name;
    })
    .catch(err => console.error(err))
}


function salvarLocalStorage(personagens){

    var arrayPersonagens = [];
    arrayPersonagens = personagens;
    localStorage.setItem("arrayPersonagens", JSON.stringify(arrayPersonagens));
}

