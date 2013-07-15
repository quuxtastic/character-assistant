angular.module('app')
    .controller 'CampaignListController', ($scope) ->
        $scope.campaigns = [
            {
                name: 'test'
                snippet: 'test snippet'
                description: 'test description'

                thumbUrl: 'test thumb url.png'
            }
        ]
