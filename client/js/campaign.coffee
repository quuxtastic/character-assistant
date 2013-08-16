CampaignResource = $resource '/api/campaign/:name'

angular.module('app')
    .controller 'CampaignListController', ($scope) ->
        $scope.campaigns = [
            {
                name: 'test'
                snippet: 'test snippet'
                description: 'test description'
            }
        ]

angular.module('app')
    .controller 'CampaignDetailController', ($scope) ->
        $scope.campaign = CampaignResource.get name
