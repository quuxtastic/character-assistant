angular.module('app')
    .factory 'RulesModuleService', ->
        _modules = []
        return {
            modules: -> _modules
        }
