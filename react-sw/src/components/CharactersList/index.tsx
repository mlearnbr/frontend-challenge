import { useEffect, useState } from "react"
import { People } from 'swapi-ts'
import { Character } from "../../typings/characters"

interface IPagination {
  next: number
  previous: number
}

function CharactersList() {
  const [characters, setCharacters] = useState<Character[] | undefined>()
  const [page, setPage] = useState(1)
  const [apiPagination, setApiPagination ] = useState<IPagination>({
    next: 0,
    previous: 0
  })

  const extractPageNumberFromURL = (url: string) => (Number(url.replace('\D+', '')))

  useEffect(() => {
    People.getPage(page).then((res) => {
      const results = res.results
      setCharacters(results)
      setApiPagination({
        next: extractPageNumberFromURL(res.next) ?? null,
        previous: extractPageNumberFromURL(res.previous)  ?? null
      })
    })
  }, [page])

  const handleNextPageClick = () => {
    setPage(apiPagination.next)
  }

  return (
    <>
      <ul>
        {characters?.map((character, index) => (
          <li key={index}>
            <span>name: {character.name}</span>
            <span>species: {character?.species?.species?.map((specie) => specie)}</span>
            <span>birth year: {character.birth_year}</span>
          </li>
        ))}
      </ul>

      {}
      <button onClick={handleNextPageClick}>
          Next
      </button>
    </>
  )
}

export default CharactersList