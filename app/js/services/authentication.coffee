angular.module('app').factory 'AuthenticationService', ($http) ->
    return {
        login: (credentials) ->
            return $http.post '/login', credentials
        logout: ->
            return $http.post '/logout'
    }
