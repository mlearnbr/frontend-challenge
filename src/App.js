import React, { useState, useEffect } from 'react';
import Modal from 'react-modal';
import logo from './assets/logo.png'
import './App.css';

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)',
    boxShadow             : '7px 3px 3px 3px #757575'
  }
};

function App() {

  const [listCharacters, setListCharacters] = useState(null)
  const [characterSpecie, setSpecies] = useState(null)
  const [characterPlanet, setPlanet] = useState(null)
  const [characterFilms, setFilms] = useState([])
  const [selectedCharacter, setSelectedCharacter] = useState(null)
  const [modalIsOpen, setIsOpen] = useState(false);
 
  function closeModal(){
    setIsOpen(false);
  }

  useEffect(()=>{
    const url = 'https://swapi.dev/api/people'

    fetch(url)
      .then((resp) => resp.json())
      .then(function (data){
        
        setListCharacters(data.results)
      
      })
      .catch((error) => {
        alert("Oops, algo deu errado, tente novamente.")
      })

  },[])


  // FUNCTION TO SHOW THE INFORMATION ABOUT THE CHARACTERS
  const infoSelectedItem = async (index) => {

    let selectedItem = listCharacters[index]
    
    if(selectedItem.species === []) {
       return
    } else {
      let species = await getSpecies(selectedItem.species[0])
      await setSpecies(species)

    }

    let characFilms = []

    let planet = await getPlanet(selectedItem.homeworld)
    await getFilms(selectedItem.films.map(film => {
        return film
       
    }))

    await setPlanet(planet)
    await setFilms(characFilms)
    await setSelectedCharacter(selectedItem)

    setIsOpen(true);
  
  }


  // FUNCTION TO GET THE SPECIE OF THE SELECTED CHARACTER
  const getSpecies = (url) => {

    if(url === undefined) {
      return
    } else {

      return new Promise((resolve, reject) => {

        fetch(url)
          .then((resp) => resp.json())
          .then(function (data){
            
            setSpecies(data.name)
            resolve(data.name)
          
        })
        .catch((error) => {
          alert("Oops, algo deu errado, tente novamente.")
        })
  
      })
    }  
  }

  // FUNCTION TO GET THE PLANET OF THE SELECTED CHARACTER
  const getPlanet = (url) => {

    return new Promise((resolve, reject) => {

      fetch(url)
        .then((resp) => resp.json())
        .then(function (data){
          
            setPlanet(data.name)
            resolve(data.name)
        
      })
      .catch((error) => {
        alert("Oops, algo deu errado, tente novamente.")
      })
    })
  }

  let old_data = null
  // FUNCTION TO GET THE FILMS OF THE SELECTED CHARACTER
  const getFilms = (url) => {

    url.map(item => {

      return new Promise((resolve, reject) => {

        fetch(item)
          .then((resp) => resp.json())
          .then(function (data){
  
            setFilms(old_data => [...old_data, data.title])
            old_data = data.title
            resolve(data.title)
              
        })
        .catch((error) => {
          alert("Oops, algo deu errado, tente novamente.")
        })
      })
    }) 
  }

  if (!listCharacters) {
      return (
        <div className="loading">
          <h4>Loading...</h4>
        </div>
      );
  }

  return (

    <div className="App">
      <header className="App-header">

      <img src={logo} alt="Logo" />

      <p className='rules'>Select a character and see the information about it</p>

        {listCharacters.map((item, index) =>(
          <a key={index} href="/#" onClick={() => infoSelectedItem(index)}>{item.name}</a>
        ))}

          {modalIsOpen &&
            <Modal
            isOpen={modalIsOpen}
            onRequestClose={closeModal}
            style={customStyles}
            ariaHideApp={false}
          >
            <h1>{selectedCharacter.name}</h1>
            <h2>Birthday: {selectedCharacter.birth_year}</h2>
            <h2>Eye color: {selectedCharacter.eye_color}</h2>
            <h2>Gender: {selectedCharacter.gender}</h2>
            <h2>Mass: {selectedCharacter.mass} Kg</h2>
            <h2>Hair color: {selectedCharacter.hair_color}</h2>
            <h2>Height: {selectedCharacter.height}</h2>
            <h2>Skin color: {selectedCharacter.skin_color}</h2>
            {characterSpecie &&
              <h2>Species: {characterSpecie}</h2>
            }
            <h2>Planet: {characterPlanet}</h2>
            <h2>Films: {characterFilms.map((film, index) => {
              return <li key={index}>{film}</li>
            })}</h2>

            
          </Modal>
          }

        <footer>
          <p className='footer-message'>Made by Thiago Padovani 2020</p>
        </footer>

      </header>
      
    </div>
  );
}

export default App;
