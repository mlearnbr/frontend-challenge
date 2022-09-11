import { memo, useEffect, useState } from "react"
import { ISpecie } from "swapi-ts"
import thumbnailsAPI from "../../services/thumbnails-api"
import { PartialCharacter } from "../../typings/characters"
import placeholder from "../../assets/placeholder.png"
import Spinner from "../Spinner"

function CharactersCard({ name, species, birth_year }: PartialCharacter) {
  const [characterThumbnail, setCharacterThumbnail] = useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [charSpecie, setCharSpecie] = useState('')

  useEffect(() => {
    setIsLoading(true)
    thumbnailsAPI.getCharacterThumbnail(name).then((res) => {
      setCharacterThumbnail(res.thumbnail !== 'undefined' ? res.thumbnail : placeholder)
      setIsLoading(false)
    })
  }, [name])

  useEffect(() => {
    if (species.length !== 0) {
      fetch(species[0])
        .then(res => res.json())
        .then((res: ISpecie) => {
          setCharSpecie(res.name)
        })
    } else {
      setCharSpecie('')
    }
  }, [species])


  return (
    <>
      {isLoading && <Spinner />}
      <a href="#">
        <li>
          {!isLoading && (
            <img src={characterThumbnail} alt="Character Thumbnail" width={200} height={150} />
          )}
          <p>name: {name}</p>
          <p>species: {charSpecie}</p>
          <p>birth year: {birth_year}</p>
        </li>
      </a>
    </>
  )
}

export default memo(CharactersCard)