import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams, Link } from 'react-router-dom';

import CharactersService from 'services/characters.services';
import { Character } from 'models/Character';

import './character-detail.css';

export default function CharacterPage() {
  const [character, setCharacter] = useState<Character>();
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(false);
  const { id } = useParams();

  function getFilms(films: string[]) {
    return Promise.all(films.map(async (film: string) => {
      const resp = await axios.get(film);
      return resp?.data?.title;
    }));
  }

  function getHomeWorld(homeworld: string) {
    return axios.get(homeworld).then(resp => resp.data.name);
  }

  function getSpecies(species: string[]) {
    return Promise.all(species.map(async (specie) => {
      const resp = await axios.get(specie);
      return resp?.data?.name;
    }));
  }

  useEffect(() => {
    setIsLoading(true);
    CharactersService.getCharacterById(id)
    .then(async resp => {
      const films = await getFilms(resp.data.films);
      const homeworld = await getHomeWorld(resp.data.homeworld);
      const species = await getSpecies(resp.data.species);

      const character: Character = {
        name: resp.data.name,
        birth_year: resp.data.birth_year,
        eye_color: resp.data.eye_color,
        gender: resp.data.gender,
        hair_color: resp.data.hair_color,
        height: resp.data.height,
        mass: resp.data.mass,
        skin_color: resp.data.skin_color,
        films,
        homeworld,
        species
      };
      setCharacter(character);
    })
    .catch(() => setError(true))
    .finally(() => setIsLoading(false));
  }, [id]);

  return (
    <div className="page" id="character">
      <div className="container">
        
        {(character && !error) &&
          <div className="character__info">
            <h2>{ character.name }</h2>
            <h4>Birth year: { character.birth_year }</h4>
            <h4>Eye color: { character.eye_color }</h4>
            <h4>Gender: { character.gender }</h4>
            <h4>Hair color: { character.hair_color }</h4>
            <h4>Height: { character.height }</h4>
            <h4>Mass: { character.mass }</h4>
            <h4>Skin color: { character.skin_color }</h4>
            <h4>Homeworld: { character.homeworld }</h4>
            <h4>Films: { character.films.join(', ') }</h4>
            <h4>Species: { character.species.join(', ') }</h4>
          </div>
        }

        {error && <h4>No character found with the id {id}.</h4>}

        {isLoading && <p>Loading...</p>}
      
        <Link to="/" id="btn-back">all characters</Link>
      </div>
    </div>
  )
};