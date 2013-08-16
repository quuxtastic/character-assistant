angular.module('app').service 'CampaignDataService', ->
    _campaigns = [
        {
            name: 'foo'
            blurb: 'Lorem ipsum dolor sit amet'
            info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.'
        },
        {
            name: 'bar'
            blurb: 'Lorem ipsum dolor sit amet'
            info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.'
        },
        {
            name: 'baz'
            blurb: 'Lorem ipsum dolor sit amet'
            info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.'
        }
    ]

    @all = -> _campaigns

    @get = (name) ->
        for c in _campaigns
            if c.name == name
                return c

#@get = (name) ->


#angular.module('app').service 'DataService', ($q) =>
#    _testdata = []

#    @get_campaign = (name) ->
 #       v = $q.defer()
 #       v.resolve(_testdata[])

 #   @get = (id) ->
 #       v = $q.defer()
 #       v.resolve(_testdata[id])
 #       return v
