import { useEffect, useState } from "react"
import { People } from 'swapi-ts'
import { Character, PeopleResponse } from "../../typings/characters"
import CharactersCard from "../CharacterCard"

interface IPagination {
  next: number | undefined | null
  previous: number | undefined | null
}

function CharactersList() {
  const [characters, setCharacters] = useState<Character[] | undefined>()
  const [page, setPage] = useState<number | undefined | null>(1)
  const [apiPagination, setApiPagination ] = useState<IPagination>({
    next: undefined,
    previous: undefined
  })

  const extractPageNumberFromURL = (url: string | null) => (isNaN(Number(url)) ? Number(url?.replace('\D+', '')) : undefined)

  useEffect(() => {
    const cachedPeople = JSON.parse(localStorage.getItem(`swCache.https://swapi.dev/api/people/?page=${page}`)!)
    
    if(!cachedPeople) {
      People.getPage(page!).then((res: PeopleResponse) => {
        const results = res.results
        setCharacters(results)
        setApiPagination({
          next: extractPageNumberFromURL(res.next),
          previous: extractPageNumberFromURL(res.previous)
        })
      })
    } else {
      setCharacters(cachedPeople.results)
      setApiPagination({
        next: extractPageNumberFromURL(cachedPeople.next),
        previous: extractPageNumberFromURL(cachedPeople.previous)
      })
    }

  }, [page])

  const handleNextPageClick = () => {
    setPage(apiPagination.next)
  }
  const handlePrevPageClick = () => {
    setPage(apiPagination.previous)
  }

  return (
    <>
      <ul>
        {characters?.map((character, index) => (
          <CharactersCard
            key={index}
            birth_year={character.birth_year}
            name={character.name}
            species={character.species}
          />
        ))}
      </ul>

      {}
      <button onClick={handlePrevPageClick}>
          Previous
      </button>
      <button onClick={handleNextPageClick}>
          Next
      </button>
    </>
  )
}

export default CharactersList