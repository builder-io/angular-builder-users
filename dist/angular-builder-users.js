(function() {
  angular.module('builder.users', ['builder']).run(function($rootScope) {
    return $rootScope.builder.user = {
      current: function() {
        return Parse.User.current();
      }
    };
  });

}).call(this);
