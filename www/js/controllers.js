angular.module('starWarsApp.controllers', [])

.controller('charsListController', function($scope, Char) {
  $scope.currentPage = 1;

  $scope.chars = []
  $scope.hasNext = true

  $scope.loadMore = function(){
    if ($scope.hasNext) {
      Char.all($scope.currentPage).then(function(response){
        $scope.currentPage++;
        $scope.chars = $scope.chars.concat(response.results);
        if (response.next == 'null') $scope.hasNext = false
      });
      $scope.$broadcast('scroll.infiniteScrollComplete');
    }
  }

  $scope.$on('$stateChangeSuccess', function() {
    $scope.loadMore();
  });
})

.controller('charsDetailController', function($scope) {
  console.log('charsDetailController')
})
