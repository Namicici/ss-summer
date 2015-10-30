"use strict"

angular.module "ss.views"

.controller "ss.views.register", ["$scope", "$location", "$http", "ss.services.auth","localStorageService",
($scope, $location, $http, authService, localStorage)->
    $scope.back = ()->
        $location.path "/login"

    $scope.submit = (email, password)->
        authService.signUp
            email: email
            password: password
            types: -1
        .then (data)->
            localStorage.set authService.authKey, {email:email, password:password}
            $location.path "/login"
        , (msg)->
]
