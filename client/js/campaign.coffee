angular.module('app')
    .controller 'CampaignListController', ($scope, CampaignDataService) ->
        $scope.campaigns = CampaignDataService.all()

    .controller 'CampaignDetailController', ($scope, $routeParams, CampaignDataService) ->
        $scope.campaign = CampaignDataService.get $routeParams.name
#    .controller 'CampaignListController', ($scope,DataService) ->
#        Dataservice.query().then (val) -> $scope.campaigns = val

#    .controller 'CampaignDetailController', ($scope,$routeParams,DataService) ->
#        DataService.get($routeParams.name)?.then (val) ->
#            $scope.campaign = val
