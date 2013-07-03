angular.module('app').controller 'HomeController', ($scope, $location, AuthenticationService) ->
    $scope.title = 'Home'
    $scope.message = 'Mouse Over these images to see a directive at work'

    onLogoutSuccess = (response) ->
        alert response.message
        $location.path '/login'

    $scope.logout = ->
        AuthenticationService.logout().success onLogoutSuccess
