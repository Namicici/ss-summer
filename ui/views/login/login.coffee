"use strict"

angular.module "ss.views"

.controller "ss.views.login", ["$scope", "$location", "$http", "ss.services.auth","localStorageService", "ssLoading",
($scope, $location, $http, authService, localStorage, loading)->
    $scope.login = (email, password)->
        promise = authService.login
            email: email
            password: password
        loading promise
        promise.then (data)->
            $scope.error = false
            authService.cacheUser {email:email, password:password, action: data.action}
            $location.path "/dashboard"
        , (msg)->
            $scope.error = true
            $scope.errorMsg = msg.message

    $scope.locateToSignUp = ()->
        $location.path "/register"
]

