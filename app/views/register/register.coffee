"use strict"

angular.module "ss.views"

.controller "ss.views.register", ["$scope", "$location", "$http", "ss.services.auth","localStorageService",
($scope, $location, $http, authService, localStorage)->
    $scope.back = ()->
        $location.path "/login"

    $scope.submit = (email, password, type)->
        authService.signUp
            email: email
            password: password
            types: type
        .then (data)->
            $location.path "/login"
        , (msg)->
]
