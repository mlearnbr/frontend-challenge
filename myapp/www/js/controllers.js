angular.module('starWarsApp.controllers', [])

.controller('charsListController', function($scope, Char) {
  $scope.currentPage = 1;
  $scope.chars = [];
  $scope.hasNext = false;

  $scope.loadMore = function(){
    $scope.currentPage++;
    Char.all($scope.currentPage).then(function(response){
      $scope.chars.push(response.results);
      if (response.next == 'null')
        $scope.hasNext = false
    });
})

.controller('charsDetailController', function($scope) {
  console.log('charsDetailController')
})
