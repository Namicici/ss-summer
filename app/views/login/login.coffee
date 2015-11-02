"use strict"

angular.module "ss.views"

.controller "ss.views.login", ["$scope", "$location", "$http", "ss.services.auth","localStorageService",
($scope, $location, $http, authService, localStorage)->
    $scope.login = (email, password)->
        authService.login
            email: email
            password: password
        .then (data)->
            authService.cacheUser {email:email, password:password}
            $location.path "/dashboard"

    $scope.locateToSignUp = ()->
        $location.path "/register"
]

