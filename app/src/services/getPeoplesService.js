import People from "../entities/People";

import getPeople from "../repositories/getPeoplesRepository";
import getSpeciesService from "../services/getSpeciesService";
import getFilmsServices from "../services/getFilmsServices";
import getPlanetsServices from "./getPlanetsServices";

const getPeopleService = async () => {
  const speciesList = await getSpeciesService();
  const species = speciesList ? speciesList : [];

  const filmsList = await getFilmsServices();
  const films = filmsList ? filmsList : [];

  const planetsList = await getPlanetsServices();
  const planets = planetsList ? planetsList : [];

  const repositoryResponse = await getPeople();
  if (repositoryResponse.status) {
    return setPeople(repositoryResponse.data, species, planets, films);
  }

  return { message: "Failed to make the request." };
};

function getFilmPeople(film, peopleFilms) {
  const arrayFilms = [];
  return arrayFilms.push(
    peopleFilms.filter((peopleFilm) => peopleFilm === film)
  );
}

function setPeople(peoples, species, planets, films) {
  const objectPeoples = peoples.results.map(
    (people) =>
      new People(
        people.name,
        people.birth_year,
        people.eye_color,
        people.gender,
        people.hair_color,
        people.height,
        people.mass,
        people.skin_color,
        people.homeworld,
        films.filter((film) => getFilmPeople(film, people.films)),
        species.filter((specie) => people.species[0] === specie.url),
        planets.filter((planet) => people.homeworld === planet.urlPlanet)
      )
  );
  return objectPeoples;
}

export default getPeopleService;
