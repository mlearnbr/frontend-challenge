export interface CharacterBasicInfos {
  id: string,
  name: string,
  birth_year: string
};

export interface Character {
  name: string,
  birth_year: string,
  eye_color: string,
  gender: string,
  hair_color: string,
  height: string,
  mass: string,
  skin_color: string,
  films: string[],
  homeworld: string,
  species: string[]
};