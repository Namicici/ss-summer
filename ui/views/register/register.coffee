"use strict"

angular.module "ss.views"

.controller "ss.views.register", ["$scope", "$location", "$http", "ss.services.auth","localStorageService", "ss.services.alertService",
($scope, $location, $http, authService, localStorage, alertService)->
    $scope.back = ()->
        $location.path "/login"

    $scope.submit = (email, password, type)->
        authService.signUp
            email: email
            password: password
            types: type
        .then (data)->
            $scope.error = false
            $location.path "/login"
        , (msg)->
            $scope.error = true
            $scope.errorMsg = msg.message
]
