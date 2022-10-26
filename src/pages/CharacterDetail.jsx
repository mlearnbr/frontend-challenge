/* eslint-disable react-hooks/exhaustive-deps */
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getNameInfo, getCharByName, getCharacterFilm } from "../api";
import loading from '../assets/loading.gif';
import '../styles/CharacterDetail.css';

export default function CharacterDetail() {
  const {id} = useParams();
  const [character, setCharacter] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const [films, setFilms] = useState([]);
  const [species, setSpecies] = useState('');

  useEffect(() => {
      const fetchCharacterInfo = async () => {
      setIsLoading(true);
      const getCharacter = await getCharByName(id);
      setCharacter(getCharacter);
      setIsLoading(false);
    };

    fetchCharacterInfo();
  }, []);

  useEffect(() => {
    const fetchCharacterFilms = async () => {
      setIsLoading(true);
      const filmsList = await character;
      const resultFilmsPromises = filmsList.films.map(async (film) => {
        const title = await getCharacterFilm(film.substr(22));
        return title;
      });

      const allFilms = await Promise.all(resultFilmsPromises)
      setFilms(allFilms);
      setIsLoading(false);
    };

    const fetchCharacterSpecies = async () => {
      setIsLoading(true);
      const getCharacter = await character;
      if (getCharacter.species.length > 0) {
        const resultSpecie = await getNameInfo(getCharacter.species[0].substr(22))
        setSpecies(resultSpecie.data.name);
      } else {
        setSpecies('Unknown');
      }
      setIsLoading(false);
    };

    const fetchHomeWorld = async () => {
      setIsLoading(true);
      const char = await character;
      const response = await getNameInfo(char.homeworld);
      setCharacter({...character, homeworld: response.data.name})
    }

    fetchCharacterFilms();
    fetchCharacterSpecies();
    fetchHomeWorld();
  }, [character]);

  const getCharacterImage = (i) => `https://starwars-visualguide.com/assets/img/characters/${i}.jpg`;

  return isLoading
    ? <div className="character-content"><img src={loading} alt="loading" className="loading"/></div>
    : (<div className="content">
        <aside>
          <img className="character-image" src={getCharacterImage(id)} alt={character.name} />
        </aside>
        <main>
          <div className="field">
            <span>{character.name}</span>
            <label>Name</label>
          </div>
          <div className="field">
            <span>{character.birth_year}</span>
            <label>Birth Year</label>
          </div>
          <div className="field">
            <span>{character.eye_color}</span>
            <label>Eye Color</label>
          </div>
          <div className="field">
            <span>{character.gender}</span>
            <label>Gender</label>
          </div>
          <div className="field">
            <span>{character.hair_color}</span>
            <label>Hair Color</label>
          </div>
          <div className="field">
            <span>{character.height}</span>
            <label>Height</label>
          </div>
          <div className="field">
            <span>{character.mass}</span>
            <label>Mass</label>
          </div>
          <div className="field">
            <span>{character.skin_color}</span>
            <label>Skin Color</label>
          </div>
          <div className="field">
            <span>{character.homeworld}</span>
            <label>Home World</label>
          </div>
          <div className="box">
            {films ?<ul className="field-lg">
              {films.map((film) => <li key={film}>{film}</li>)}
            </ul> : null}
            <label>Films</label>
          </div>
          <div className="field">
          <span>{species}</span>
           <label>Species</label>
          </div>
        </main>
      </div>)
}
