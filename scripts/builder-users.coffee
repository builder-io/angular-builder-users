angular.module('builder.users', ['builder'])
  .run ($rootScope, builderUser) ->
    $rootScope.builder.user = builderUser
