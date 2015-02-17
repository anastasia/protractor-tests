angular.module('myApp', ['ngRoute']).config(function($routeProvider) {
  return $routeProvider.when('/', {
    controller: 'MainController',
    templateUrl: 'partials/main.tpl.html'
  });
}).controller('MainController', function($scope) {
  $scope.orgs = window.config.orgs;
  $scope.sometext = "click here";
  $scope.clicked = false;
  $scope.changeText = function() {
    $scope.clicked = !$scope.clicked;
    return $scope.sometext = $scope.clicked ? "hooray you clicked!" : "click here";
  };
});

//# sourceMappingURL=app.js.map
