/* eslint-disable no-console */
/* eslint-disable max-len */
/* eslint-disable react/jsx-indent */
/* eslint-disable operator-linebreak */
/* eslint-disable no-await-in-loop */
/* eslint-disable comma-dangle */
/* eslint-disable no-plusplus */
/* eslint-disable react/jsx-one-expression-per-line */
import { useParams } from 'react-router-dom';
import React, { useState, useEffect } from 'react';

function Details() {
  const [characterDetails, setCharacterDetails] = useState([]);
  const [films, setFilms] = useState([]);
  const [finalPromise, setFinalPromise] = useState([]);
  const [homeworld, setHomeWorld] = useState([]);

  const { characterId } = useParams();
  const API_IMG_DETAILS = `https://starwars-visualguide.com/assets/img/characters/${characterId}.jpg`;

  const getCharacterDetails = async () => {
    const response = await fetch(`https://swapi.dev/api/people/${characterId}`);
    const data = await response.json();
    setCharacterDetails(data);
    setFilms(data.films);
  };

  useEffect(() => {
    const filmsResolved = films.map(async (film) => fetch(film).then((res) => res.json()));
    Promise.all(filmsResolved).then((results) => setFinalPromise(results));
  }, [films]);

  useEffect(() => {
    getCharacterDetails();
  }, []);

  const getHomeWorld = async () => {
    const response = await fetch(characterDetails?.homeworld);
    const data = await response.json();
    setHomeWorld(data);
  };
  getHomeWorld();

  return (
    <section style={{ backgroundColor: '#eee' }}>
      <div className="container py-5">
        <div className="row justify-content-center">
          <div className="col-md-8 col-lg-6 col-xl-4">
            <div className="card text-black">
              <img
                src={API_IMG_DETAILS}
                className="card-img-top"
                alt="Apple Computer"
              />
              <div className="card-body">
                <div className="text-center">
                  <p className="text-muted mb-4">{characterDetails?.name}</p>
                </div>
                <div>
                  <div className="d-flex justify-content-between">
                    <span>Birth Date: {characterDetails?.birth_year}</span>
                    <span>Eye Color: {characterDetails?.eye_color}</span>
                  </div>
                  <div className="d-flex justify-content-between">
                    <span>Gender: {characterDetails?.gender}</span>
                    <span>Hair Color: {characterDetails?.hair_color}</span>
                  </div>
                  <div className="d-flex justify-content-between">
                    <span>Height: {characterDetails?.height}</span>
                    <span>Mass: {characterDetails?.mass}</span>
                    <span> Homeworld: {homeworld.name ? homeworld.name : 'Unspecified'}</span>
                  </div>
                </div>
                <div className="d-flex justify-content-between font-weight-bold mt-4">
                <div>Movies:{finalPromise?.map((filme) => <ul key={filme.edited}><li>{filme.title}</li></ul>)}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Details;
