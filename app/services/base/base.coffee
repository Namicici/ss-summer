"use strict"

angular.module "ss.services"
.service "ss.services.base", ["$q", "$http", ($q, $http)->
    class baseService
        http:(httpConfig)->
            deferred = $q.defer()
            $http httpConfig
            .then (data)->
                if !data.success
                    msg = {}
                    msg.code = data.code
                    msg.message = data.message
                    deferred.reject msg
                else
                    deferred.resove data.data
            , (data, statusCode)->
                msg = {}
                msg.code = statusCode
                msg.message = data.message
                deferred.reject msg
            deferred.promise
    new baseService
]

