"use strict"

angular.module "ss.services"
.service "ss.services.auth", ["$q", "$http", "ss.services.base", "$location", "$rootScope", "localStorageService", "$cookieStore",
($q, $http, baseService, $location, $rootScope, localStorage, $cookieStore)->
    class auth
        authKey: "ss.auth"
        user: null

        login: (user)->
            self = this
            httpConfig =
                url: "/login.do"
                method: "post"
                data: {email: user.email, password: user.password}
            return baseService.http httpConfig

        signUp: (user)->
            httpConfig =
                url: "/register.do"
                method: "post"
                data:{email: user.email, password: user.password, types: user.types}
            return baseService.http httpConfig

        isLogin: ()->
            user = this.getUser()
            if user
                return true
            else
                return false

        getUser: ()->
            if !user
                authData = $cookieStore.get this.authKey
                if authData
                    index = authData.indexOf ":"
                    user = {}
                    user.email = authData.slice 0, index
                    user.password = authData.slice index + 1, authData.length
            return user

        cacheUser: (user)->
            authData = user.email + ":" + user.password
            $cookieStore.put this.authKey, authData
    new auth

]
