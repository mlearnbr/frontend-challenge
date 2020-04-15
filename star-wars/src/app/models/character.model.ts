import { Film } from './film.model'

export class Character {
  id: string
  name: string
  birthYear: string
  eyeColor?: string
  gender?: string
  hairColor?: string
  height?: number
  mass?: number
  skinColor?: string
  homeworld?: string
  films?: Film[]
  species: string[]
}

