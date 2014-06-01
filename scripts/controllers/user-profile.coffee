angular.module('buidler.users')
  .controller 'builder.users.UserProfileCtrl', ($scope) ->
    $scope.$profile =
      foo: 'bar'
