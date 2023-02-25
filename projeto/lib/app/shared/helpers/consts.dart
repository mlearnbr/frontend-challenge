abstract class Api {
  /// A People resource is an individual person or character within the Star Wars universe.
  static const baseUrl = 'https://swapi.dev/api';

  // get all the people resources
  static const pathPeople = '/people/';

  // get all the people resources
  static const pathSpecie = '/specie/';

  // get a specific people resource
  static const pathOnePeaple = '/people/:id/';
}
