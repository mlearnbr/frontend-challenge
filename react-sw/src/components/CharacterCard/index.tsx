import { useEffect, useState } from "react"
import thumbnailsAPI from "../../services/thumbnails-api"
import { PartialCharacter } from "../../typings/characters"
import Spinner from "../Spinner"

function CharactersCard({ name, species, birth_year }: PartialCharacter) {
  const [characterThumbnail, setCharacterThumbnail] = useState('')
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    thumbnailsAPI.getCharacterThumbnail(name).then((res) => {
      setCharacterThumbnail(res.thumbnail)
    })
  }, [])

  useEffect(() => {
    if(characterThumbnail !== '') {
      setIsLoading(false)
    }
  }, [characterThumbnail])

  return (
    <>
      {isLoading && <Spinner />}
      {!isLoading && (
        <li>
          <img src={characterThumbnail} alt="Character Thumbnail" />
          <p>name: {name}</p>
          <p>species: {species?.species}</p>
          <p>birth year: {birth_year}</p>
        </li>
      )}
    </>
  )
}

export default CharactersCard