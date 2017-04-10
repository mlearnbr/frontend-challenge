angular.module('starWarsApp', ['ionic', 'starWarsApp.controllers', 'starWarsApp.services'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider

  .state('charsList', {
    url: '/chars',
    templateUrl: 'templates/chars-list.html',
    controller: 'charsListController'
  })

  .state('charsDetail', {
    url: '/chars/:id',
    templateUrl: 'templates/char-detail.html',
    controller: 'charsDetailController'
  })

  $urlRouterProvider.otherwise('/chars');

});
