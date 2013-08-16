#angular.module('app')
#    .controller 'CharacterListController', ($scope, DataService) ->
 #       DataService.query().then (val) -> $scope.characters = val
#
 #   .controller 'CharacterDetailController', ($scope, $routeParams, DataService) ->
 #       DataService.get($routeParams.name)?.then (val) ->
  #          $scope.character = val
