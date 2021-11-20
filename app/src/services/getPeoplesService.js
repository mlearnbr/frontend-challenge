import People from "../entities/People";

import getPeople from "../repositories/getPeoplesRepository";

const getPeopleService = async () => {
  const repositoryResponse = await getPeople();
  if (repositoryResponse.status) {
    return setPeople(repositoryResponse.data);
  }

  return { message: "Failed to make the request." };
};

function setPeople(peoples) {
  const objectPeoples = peoples.results.map(
    (people) => new People(people.name, people.birth_year, people.gender)
  );

  return objectPeoples;
}

export default getPeopleService;
