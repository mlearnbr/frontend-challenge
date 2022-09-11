import axios from 'axios'
import { CharacterThumbnail } from '../typings/characters'
const thumbnailsAPI = {
  getCharacterThumbnail: (character: string): Promise<CharacterThumbnail> => {
    const cachedThumb = localStorage.getItem(`${character}-thumb`)
    if(cachedThumb) {
      return Promise.resolve({
        thumbnail: cachedThumb
      }) 
    }
    return axios.get(`http://localhost:3333/character-thumbnail/${character}`).then((res) => {
      localStorage.setItem(`${character}-thumb`, res.data?.thumbnail)
      return res.data
    })
  }
}
export default thumbnailsAPI