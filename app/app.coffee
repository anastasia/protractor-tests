angular.module('myApp', ['ngRoute'])
.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      # template: '<div> hi there</div>'
      templateUrl: 'partials/main.tpl.html'
      controller: 'MainController'
    })

.controller 'MainController', ($scope) ->
  $scope.sometext = "click here"
  $scope.clicked = false
  $scope.changeText = ->

    $scope.clicked = !$scope.clicked
    $scope.sometext = if $scope.clicked then "hooray you clicked!" else "click here"
  $scope.orgs = [
      name: 'newsbound',
      owner_id: '1234',
      max_publish: 999999,
      stacks_published: 2,
    ,
      name: 'awesomeOrg',
      owner_id: '5678',
      max_publish: 3,
      stacks_published: 0,
    ,
      name: 'newOrg',
      owner_id: '9012',
      max_publish: 0,
      stacks_published: 0,
    ,
      name: 'oldOrg',
      owner_id: '3456',
      max_publish: 8,
      stacks_published: 8
  ]

  return
