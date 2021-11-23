import React, {useEffect, useState} from 'react';
import axios from 'axios';
import './CharacterDetailsModal.css';

const CharacterDetailsModal = ({ setOpenModal, index }) => {
    //const [films, setFilms] = useState([{}]);

    /*
    console.log("Filmes ---  ",indice.homeworld);
    console.log("Filmes ---  ",indice.species);
    */

    let characterFilms = index.films;
    console.log("Filmes ---  ", characterFilms);

    characterFilms.map(filmes => {
        console.log('Dentro do map----', filmes);
        /*
        -- A ideia era fazer um map no array de filmes retornado
         e assim fazer o fetch para pegar as informações de cada filme

        Não funcionou 😔 --
        axios
        .get(`${filmes}/?format=json`)
        .then((response ) => {
            console.log('Response do axios ---', response.data);
            setFilms(...films, filmes);
        })
        */
        
    })
    
    return (
        <div className="modal-background">
            <div className="modal-container">
                <div className="close-btn">
                    <button
                        onClick={() => {
                            setOpenModal(false);
                        }}
                    >
                        X
                    </button>
                </div>
                <div className="modal-title">
                    <h1>{index.name}</h1>
                </div>
                <div className="modal-body">
                    <ul>
                        <li>Birth Year: {index.birth_year}</li>
                        <li>Eye Color: {index.eye_color}</li>
                        <li>Gender: {index.gender}</li>
                        <li>Hair Color: {index.hair_color}</li>
                        <li>Height: {index.height}</li>
                        <li>Mass: {index.mass}</li>
                        <li>Skin Color: {index.skin_color}</li>
                    </ul>
                </div>
            </div>
        </div>
    )
}

export default CharacterDetailsModal
