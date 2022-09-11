import { useContext, useEffect, useState } from 'react'
import { CharacterContext } from "../../contexts/CharacterContex"
import axios from 'axios'

function CharacterPage() {
  const { state } = useContext(CharacterContext)
  const { thumbnail } = state
  const {
    birth_year,
    eye_color,
    films,
    gender,
    hair_color,
    height,
    homeworld,
    mass,
    name,
    skin_color,
    species
  } = state.character


  return (
    <>
      <section>
        <button onClick={() => history.back()}>
          Voltar
        </button>
      </section>
      <section>
        <figure>
          <img src={thumbnail} alt="Character Thumbnail" height={150} width={200} />
        </figure>
        <details title={`Detalhes sobre: ${name}`}>
          <p>Nome: {name}</p>
          <p>Ano de Nascimento: {birth_year}</p>
          <p>Cor dos olhos: {eye_color}</p>
          <p>Gênero: {gender}</p>
          <p>Cor do cabelo: {hair_color}</p>
          <p>Altura: {height}</p>
          <p>Massa: {mass}</p>
          <p>Cor da pele: {skin_color}</p>
          <p>Planeta Natal:
            <a href={homeworld}>{homeworld}</a>
          </p>
          <p>Filmes:
            <ul>
              {films.map((film) => (
                  <li>
                    <a href={film}>{film}</a>
                  </li>
              ))}
            </ul>
          </p>
          <p>Espécie:
            <a href={species[0]}>{species[0]}</a>
          </p>
        </details>
      </section>
    </>
  )
}

export default CharacterPage