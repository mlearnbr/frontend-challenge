angular.module('starWarsApp.services', [])

.factory('Char', function($http) {
  BASE_URL = 'http://swapi.co/api/people/';

  var people = []

  return {
    all: function(num_page) {
      return $http.get(BASE_URL + '?page=' + num_page).then(function(response){
        return response.data
      })
    },
    get: function(personId) {
      return $http.get("http://swapi.co/api/people/" + personId).then(function(response){
        console.log(response)
      })
    }
  }
});
