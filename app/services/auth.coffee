"use strict"

angular.module "ss.services"
.service "ss.services.auth", ["$q", "$http", "ss.services.base", "$location", "$rootScope", "localStorageService",
($q, $http, baseService, $location, $rootScope, localStorage)->

        login: (userData)->
            self = this
            httpConfig =
                url: "/login.do"
                method: "post"
                data: {email: userData.username, password: userData.password}
            baseService.http httpConfig
]
