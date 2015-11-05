"use strict"

angular.module "ss.views"

.controller "ss.views.login", ["$scope", "$location", "$http", "ss.services.auth","localStorageService",
($scope, $location, $http, authService, localStorage)->
    $scope.login = (email, password)->
        authService.login
            email: email
            password: password
        .then (data)->
            $scope.error = false
            authService.cacheUser {email:email, password:password, action: data.action}
            $location.path "/dashboard"
        , (msg)->
            $scope.error = true
            $scope.errorMsg = msg.message

    $scope.locateToSignUp = ()->
        $location.path "/register"
]

