# setup the root module
angular.module 'app', []

# routes
angular.module('app').config ($routeProvider) ->
    $routeProvider
        .when '/campaign',
            templateUrl: 'campaign-list.html'
            controller: 'CampaignListController'
        .when '/campaign/:name',
            templateUrl: 'campaign-detail.html'
            controller: 'CampaignDetailController'

 #       .when '/character',
 #           templateUrl: 'character-list.html'
 #           controller: 'CharacterListController'
 #       .when '/character/:name'
 #           templateUrl: 'character-detail.html'
 #           controller:'CharacterDetailController'

        .otherwise
            redirectTo: '/campaign'

# root controller
angular.module('app').controller 'RootController', ($scope) ->
