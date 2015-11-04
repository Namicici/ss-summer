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
                headers:'Content-Type':'application/x-www-form-urlencoded'
            return baseService.http httpConfig

        signUp: (user)->
            httpConfig =
                url: "/register.do"
                method: "post"
                data:{email: user.email, password: user.password, types: user.types}
                headers:'Content-Type':'application/x-www-form-urlencoded'
            return baseService.http httpConfig

        isLogin: ()->
            user = this.getUser()
            if user
                return true
            else
                return false

        getUser: ()->
            if !user
                user = $cookieStore.get this.authKey
            return user

        cacheUser: (user)->
            $cookieStore.put this.authKey, user
    new auth

]
