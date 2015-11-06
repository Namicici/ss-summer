"use strict"

angular.module "ss.views"

.controller "ss.views.register", ["$scope", "$location", "$http", "ss.services.auth","localStorageService", "ss.services.alertService", "ssLoading",
($scope, $location, $http, authService, localStorage, alertService, loading)->
    $scope.back = ()->
        $location.path "/login"

    $scope.submit = (email, password, type)->
        promise = authService.signUp
            email: email
            password: password
            type: type
        loading promise
        promise.then (data)->
            $scope.error = false
            $location.path "/login"
        , (msg)->
            $scope.error = true
            $scope.errorMsg = msg.message
]
