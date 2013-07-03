angular.module('app').directive 'showsMessageWhenHovered', ->
    return (scope, element, attributes) ->
        originalMessage = scope.message
        element.bind 'mouseenter', ->
            scope.message = attributes.message
            scope.$apply()
        element.bind 'mouseleave', ->
            scope.message = originalMessage
            scope.$apply()
