"use strict"

angular.module "ss.views"

.controller "ss.views.login", ["$scope", "$location", "$http", "ss.services.auth",($scope, $location, $http, authService)->
    $scope.logon = (username, password)->
        authService.login
            username: username
            password: password

]

