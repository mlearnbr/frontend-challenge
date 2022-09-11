export interface Species {
  species: string[]
}

export interface Films {
  films: string[]
}

export interface PeopleResponse {
  count: number
  next: string | null
  previous: string | null
  results: Character[]
}

export interface PartialCharacter extends Species{
  name: string
  birth_year: string
}

export interface Character extends PartialCharacter {
  eye_color: string
  gender: string
  hair_color: string
  height: string
  mass: string
  skin_color: string
  homeworld: string
  films: Films
}

export interface CharacterThumbnail {
  thumbnail: string
}