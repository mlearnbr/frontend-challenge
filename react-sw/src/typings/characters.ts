export interface Species {
  species: ['']
}

export interface Films {
  films: ['']
}

export interface PartialCharacter {
  name: string
  species: Species
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