"use strict"

angular.module "ss.services"
.service "ss.services.auth", ["$q", "$http", "ss.services.base", "$location", "$rootScope", "localStorageService",
($q, $http, baseService, $location, $rootScope, localStorage)->
    class auth
        authKey: "auth"
        user: null

        login: (userData)->
            self = this
            httpConfig =
                url: "/login.do"
                method: "post"
                data: {email: userData.email, password: userData.password}
            return baseService.http httpConfig

        signUp: (userData)->
            httpConfig =
                url: "/register.do"
                method: "post"
                data:{email: userData.email, password: userData.password, types: userData.types}
            return baseService.http httpConfig

        isLogin: ()->
            userData = this.getUser()
            if userData
                return true
            else
                return false

        getUser: ()->
            if !user
                user = localStorage.get this.authKey
            return user
    new auth

]
