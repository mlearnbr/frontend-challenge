import Planet from "../entities/Planets";

import getPlanets from "../repositories/getPlanetsRepository ";

const getPlanetsService = async () => {
  const repositoryResponse = await getPlanets();
  if (repositoryResponse.status) {
    return setPlanets(repositoryResponse.data);
  }

  return { message: "Failed to make the request." };
};

function setPlanets(planets) {
  const objectPlanets = planets.results.map(
    (planets) => new Planet(planets.name, planets.url)
  );

  return objectPlanets;
}

export default getPlanetsService;
