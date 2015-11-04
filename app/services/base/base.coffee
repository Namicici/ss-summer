"use strict"

angular.module "ss.services"
.service "ss.services.base", ["$q", "$http", ($q, $http)->
    class baseService
        http:(httpConfig)->
            deferred = $q.defer()

            if httpConfig.data and httpConfig.headers and httpConfig.headers['Content-Type']=='application/x-www-form-urlencoded'
                httpConfig['transformRequest']= transformRequest

            $http httpConfig
            .success (data)->
                if !data.success
                    msg = {}
                    msg.code = data.code
                    msg.message = data.message
                    deferred.reject msg
                else
                    deferred.resolve data.data
            , (data, statusCode)->
                msg = {}
                msg.code = statusCode
                msg.message = data.message
                deferred.reject msg
            deferred.promise
    new baseService
]

