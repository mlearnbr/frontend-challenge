async function fetchPeople(){
    return fetch("https://swapi.co/api/people/")
    .then(resp => resp.json())
    .then(personagens => {
        
        let id;
        var campoid;
        let nome;
        let anoNascimento;
        let elementoEspecie;

        let novaBox;
        let gridPersonagens;

        personagens.results.forEach(personagem => {
            novaBox = document.createElement("div");
            novaBox.classList.add("box");
            
            
            var url  = personagem.url;
            id = url.match(/\d/g);
            id = id.join("");
            campoid = document.createElement("span");
            campoid.classList.add("campoid");
            campoid.classList.add("invisivel");
            campoid.innerHTML = id;
            
            nome = document.createElement("h2");
            nome.innerHTML = personagem.name;
            nome.classList.add("nomePersonagem");

            anoNascimento = document.createElement("p");
            anoNascimento.classList.add("generoPersonagem");
            anoNascimento.innerHTML = `Nasceu em ${personagem.birth_year}`;
        
            elementoEspecie = document.createElement("p");
            elementoEspecie.classList.add("especiePersonagem");
            elementoEspecie.setAttribute('name', `${personagem.species[0]}`);

            novaBox.appendChild(nome);
            novaBox.appendChild(anoNascimento);
            novaBox.appendChild(elementoEspecie);
            novaBox.appendChild(campoid);

            gridPersonagens = document.querySelector(".gridPersonagens");
            gridPersonagens.appendChild(novaBox); 

        });
        
        completarEspecies();
        salvarLocalStorage(personagens);
    })
    .catch(err => console.error(err))
}
fetchPeople();

function completarEspecies(){

    var elementosEspecie = document.querySelectorAll(".especiePersonagem");
    elementosEspecie.forEach(especieElemento => {
        fetchSpecies(especieElemento.getAttribute('name'), especieElemento);
    });
}

async function fetchSpecies(url, especieElemento){
    return await fetch(url)
    .then(resp => resp.json())
    .then(especies => {
        especieElemento.innerHTML = especies.name;
    })
    .catch(err => console.error(err))
}