angular.module('buidler.users')
  .controller 'builder.users.UserSettingsCtrl', ($scope) ->
    $scope.$settings =
      foo: 'bar'
