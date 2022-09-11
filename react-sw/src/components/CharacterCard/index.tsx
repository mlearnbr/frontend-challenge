import { memo, useContext, useEffect, useState } from "react"
import { ISpecie } from "swapi-ts"
import thumbnailsAPI from "../../services/thumbnails-api"
import { PartialCharacter } from "../../typings/characters"
import placeholder from "../../assets/placeholder.png"
import Spinner from "../Spinner"
import { Link } from "react-router-dom"
import { CharacterContext } from "../../contexts/CharacterContex"

interface Props extends PartialCharacter {
  selectCharacter: () => void
}

function CharactersCard({ name, species, birth_year, selectCharacter }: Props) {
  const [characterThumbnail, setCharacterThumbnail] = useState('')
  const [isLoading, setIsLoading] = useState(true)
  const [charSpecie, setCharSpecie] = useState('')
  const { state, dispatch } = useContext(CharacterContext)

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

  const handleClick = () => {
    selectCharacter()
    dispatch({type: "SET_THUMBNAIL", payload: {...state.character, thumbnail: characterThumbnail} })
  }

  return (
    <>
      {isLoading && <Spinner />}
      <Link to='person' onClick={handleClick}>
        <li>
          {!isLoading && (
            <img src={characterThumbnail} alt="Character Thumbnail" width={200} height={150} />
          )}
          <p>name: {name}</p>
          <p>species: {charSpecie}</p>
          <p>birth year: {birth_year}</p>
        </li>
      </Link>
    </>
  )
}

export default memo(CharactersCard)