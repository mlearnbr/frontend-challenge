import axios from 'axios'
import { CharacterThumbnail } from '../typings/characters'
const thumbnailsAPI = {
  getCharacterThumbnail: (character: string): Promise<CharacterThumbnail> => {
    return axios.get(`http://localhost:3333/character-thumbnail/${character}`).then((res) => {
      return res.data
    })
  }
}
export default thumbnailsAPI