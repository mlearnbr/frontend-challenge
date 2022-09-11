import axios from 'axios'
import { PartialCharacter } from '../typings/characters'

export const swAPI = {
  getAllPartialPeople: (): Promise<PartialCharacter> => {
    return axios.get('https://swapi.dev/api/people').then((res) => {
      return res.data.results
    })
  }
}