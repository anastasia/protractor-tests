angular
.module('app', ['ngRoute'])
.config(['$routeProvider', ($routeProvider) ->
])
.controller 'MainController', ($scope) ->
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