# setup the root module
angular.module 'app', []

# routes
angular.module('app')
    .config [
        '$routeProvider',
        ($routeProvider) ->
            $routeProvider
                .when '/campaigns',
                    templateUrl: 'campaign-list.html'
                    controller: 'CampaignListController'
                .when '/campaigns/:campaignID',
                    templateUrl: 'campaign-detail.html'
                    controller: 'CampaignDetailController'
                .otherwise
                    redirectTo: '/campaigns'
    ]

# root controller
angular.module('app')
    .controller 'RootController', ($scope) ->
        $scope.content = 'Hello world'
        $scope.app_title = 'Yay angular'

        console.log 'this is a test'
