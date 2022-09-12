import { useContext } from 'react'
import { CharacterContext } from "../../contexts/CharacterContex"
import { BackButton, MainSection } from './styled'

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
      <MainSection>
        <section>
          <BackButton onClick={() => history.back()}>
            Voltar
          </BackButton>
        </section>
        <figure>
          <img src={thumbnail} alt="Character Thumbnail" />
        </figure>
        <details>
          <summary>Detalhes sobre: {name}</summary>
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
          <details>
            <summary>Filmes</summary>
            <ul>
              {films.map((film, index) => (
                <li key={index}>
                    <a href={film}>{film}</a>
                  </li>
              ))}
            </ul>
          </details>
          <p>Espécie:
            <a href={species[0]}>{species[0]}</a>
          </p>
        </details>
      </MainSection>
    </>
  )
}

export default CharacterPage