import { useEffect, useState } from "react"
import CharactersList from "./components/CharactersList"
import Spinner from "./components/Spinner"
import thumbnailsAPI from "./services/thumbnails-api"

function App() {
  const [characterThumbnail, setCharacterThumbnail] = useState('')
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    thumbnailsAPI.getCharacterThumbnail('Luke Skywalker').then((res) => {
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
        <>
          <img src={characterThumbnail} alt="Character Thumbnail" />
          <CharactersList />
        </>
      )}
    </>
  )
}

export default App
