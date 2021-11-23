import Films from "../entities/Films";

import getFilms from "../repositories/getFilmsRepository";

const getFilmsService = async () => {
  const repositoryResponse = await getFilms();
  if (repositoryResponse.status) {
    return setFilms(repositoryResponse.data);
  }

  return { message: "Failed to make the request." };
};

function setFilms(films) {
  const objectFilms = films.results.map(
    (films) => new Films(films.title, films.characters, films.url)
  );

  return objectFilms;
}

export default getFilmsService;
