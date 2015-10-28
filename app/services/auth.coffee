"use strict"

angular.module "ss.services"
.service "ss.services.auth", ["$q", "$http", "ss.services.base", "$location", "$rootScope", "localStorageService",
($q, $http, baseService, $location, $rootScope, localStorage)->

    authKey = "auth"

    login: (userData)->
        self = this
        httpConfig =
            url: "/login.do"
            method: "post"
            data: {email: userData.username, password: userData.password}
        baseService.http httpConfig
        .then (data)->
            localStorage.set authKey, userData
            $location.path "/"

    isLogin: ()->
        userData = localStorage.get authKey
        if userData
            return true
        else
            return false

]
