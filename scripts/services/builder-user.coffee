angular.module('builder.users').service 'builderUser', ->
  current: ->
    Parse.User.current()

  login: ->

  signup: ->
