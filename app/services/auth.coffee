"use strict"

angular.module "ss.services"
.service "ss.services.auth", ["$q", "$http", "ss.services.base", "$location", "$rootScope", "localStorageService",
($q, $http, baseService, $location, $rootScope, localStorage)->
    class auth
        authKey = "auth"

        user: null

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
            userData = this.getUser()
            if userData
                return true
            else
                return false
        getUser: ()->
            if !user
                user = localStorage.get authKey
            return user
    new auth

]
