import { useState } from "react";
import Router from "../router/router";
import axios from "axios";
import GlobalStateContext from "./GlobalContext";

const GlobalState = () => {
    const [ characters, setCharacters ] = useState()
    const [ character, setCharacter ] = useState()
    const [ planet, setPlanet ] = useState()
    const [ films, setFilms ] = useState([])
    const [ species, setSpecies ] = useState()

    const getCharacters = async () => {
        const url = `https://swapi.dev/api/people/`
        try {
            const response = await axios.get(url)
            setCharacters(response.data.results)
        } catch (error) {
            console.log(error)
        }
    }

    const getCharacter = async (param) => {
        const url = `https://swapi.dev/api/people/${param}/`
        try {
            const responseCharacter = await axios.get(url)
            const responsePlanet = await axios.get(responseCharacter.data.homeworld)

            setCharacter(responseCharacter.data)
            setPlanet(responsePlanet.data.name)
            getFilms(responseCharacter.data)
        } catch (error) {
            console.log(error)
        }
    }

    const getFilms = (characterFilms) => {

        let newFilm = []
        characterFilms.films.map( async (film) => {
            try {
                const responseFilm = await axios.get(film)

                newFilm = [...newFilm, {title: responseFilm.data.title} ]
                setFilms(newFilm)
            } catch (error) {
                console.log(error)
            }
        })
        getSpecie(characterFilms)
    }

    const getSpecie = (character) => {
        
        if (character.species.length === 0) {
            setSpecies('Not defined')
        } else {
            const url = `${character.species}`
            axios.get(url)
            .then(res => setSpecies(res.data.name))
            .catch(err => console.log(err))
        }
    }

    const states = { characters, character, planet, films, species }
    const setters = { setCharacters }
    const requests = { getCharacters, getCharacter }

    return (
        <GlobalStateContext.Provider value={{ states, requests, setters }}>
            <Router />
        </GlobalStateContext.Provider>
    )
}

export default GlobalState;