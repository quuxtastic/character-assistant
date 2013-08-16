angular.module('app').directive 'editable-text', ->
    return {
        restrict: 'E'
        templateUrl: '/partials/editable-text.html'

        replace: true
        link: (scope,element,attrs,controller) ->
            #
    }
