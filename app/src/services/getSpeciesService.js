import Species from "../entities/Species";

import getSpecies from "../repositories/getSpeciesRepository";

const getSpeciesService = async () => {
  const repositoryResponse = await getSpecies();
  if (repositoryResponse.status) {
    return setSpecies(repositoryResponse.data);
  }

  return { message: "Failed to make the request." };
};

function setSpecies(species) {
  const objectSpecies = species.results.map(
    (specie) => new Species(specie.name, specie.url)
  );

  return objectSpecies;
}

export default getSpeciesService;
