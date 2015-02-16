angular.module('myGreatApp', ['ngRoute'])
.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      controller: 'MainController'
      templateUrl: 'partials/main.tpl.html'
    })
.controller 'MainController', ($scope) ->
  $scope.orgs = window.config.orgs
  $scope.sometext = "click here"
  $scope.clicked = false

  $scope.changeText = ->
    $scope.clicked = !$scope.clicked
    $scope.sometext = if $scope.clicked then "hooray you clicked!" else "click here"

  return
