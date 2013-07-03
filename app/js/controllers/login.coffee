angular.module('app').controller 'LoginController', ($scope,$location,AuthenticationService) ->
    $scope.credentials =
        username: ''
        password: ''

    onLoginSuccess = (response) ->
        alert response.message
        $location.path '/home'

    $scope.login = ->
        AuthenticationService.login($scope.credentials).success onLoginSuccess