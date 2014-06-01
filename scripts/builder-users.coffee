angular.module('builder.users', ['builder']).run ($rootScope) ->
  $rootScope.builder.user =
    current: ->
      Parse.User.current()

    login: ->
      
    signup: ->
