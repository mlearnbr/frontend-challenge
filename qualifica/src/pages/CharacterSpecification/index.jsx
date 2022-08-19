import React, { useState, useEffect } from "react";

import { useParams, useHistory, Link } from "react-router-dom";

import { Loading } from "../../components/Loading";

import styles from "./CharacterSpecification.module.css";

export default function CharacterSpecification() {
  const [persona, setPersona] = useState({});
  const index = useParams();
  const [loading, setLoading] = useState(false);
  const history = useHistory();

  async function loadPersona() {
    async function fetchPersona() {
      let response = await fetch(`https://swapi.dev/api/people/${index.id}`);
      let data = await response.json();
      setPersona(data);
      setLoading(true);
    }
    fetchPersona();
  }

  useEffect(() => {
    loadPersona();
  }, []);

  return (
    <div className={styles.info}>
      {!loading ? (
        <Loading />
      ) : (
        <div>
          <h1>Conheça um pouco do: {persona.name}</h1>
          <p>Data de criação: {persona.birth_year}</p>
          <p>Cor dos olhos: {persona.eye_color}</p>
          <p>Gênero: {persona.gender}</p>
          <p>Cor de cabelo: {persona.hair_color}</p>
          <p>Altura: {persona.height}</p>
          <p>Massa: {persona.mass}</p>
          <p>Cor de pele: {persona.skin_color}</p>
          <p>Planeta Natal: {persona.homeworld}</p>
          <p>Filmes: </p>
          {persona.films && (
            <ul>
              {persona.films.map((item) => (
                <li>{item}</li>
              ))}
            </ul>
          )}

          <p>Espécie: {persona.species}</p>

          <Link className={styles.button} onClick={() => history.goBack()}>
            Voltar
          </Link>
        </div>
      )}
    </div>
  );
}
