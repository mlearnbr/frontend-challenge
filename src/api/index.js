import { api } from "./api";

const getCharacterFilm = async (url) => {
  const response = await api.get(url);
  return response.data.title;
}

const getNameInfo = async (url) => {
  const response = await api.get(url);
  return response;
}

const getAllChars = async () => {
  const LIMIT = 3;
  let index = 1;
  let all = []

  while (index <= LIMIT) {
    const {data} = await api.get(`people/?page=${index}`)
    all = [...all, data.results];
    index += 1 ;
  }

  const allCharacters = all.flatMap((characters) => characters);

  const filteredCharacterData = allCharacters.map((char) => {
    return {name: char.name, species: char.species[0], birth_year: char.birth_year}
  })

  const resultSpeciePromise = filteredCharacterData.map(async (e) => {
    const response = await getNameInfo(e.species)
    return {...e, species: response.data.name || 'Unknown'};
  })

  const result = await Promise.all(resultSpeciePromise)
  return result;
}


const getCharByName = async (id) => {
  const response = await api.get(`people/${id}`);
  return response.data;
}

export {
  getAllChars,
  getCharByName,
  getCharacterFilm,
  getNameInfo
};
