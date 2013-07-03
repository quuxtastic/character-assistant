angular.module("app",[]).run ($rootScope) ->
    $rootScope.log = (stuff) -> console.log(stuff)
    $rootScope.alert = (stuff) -> alert(stuff)