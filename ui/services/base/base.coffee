"use strict"

angular.module "ss.services"
.service "ss.services.base", ["$q", "$http", ($q, $http)->
    class baseService
        transformRequest:(data,headers)->
            if data
                rs= []
                rs.push encodeURIComponent(key)+ '='+encodeURIComponent(val) for key,val of data
                res= rs.join '&'

        http:(httpConfig, type)->
            self = this
            deferred = $q.defer()
            if !type || type != "upload"
                httpConfig['transformRequest']= self.transformRequest
            $http httpConfig
            .success (data)->
                if !data.success
                    msg = {}
                    msg.code = data.code
                    msg.message = data.message
                    deferred.reject msg
                else
                    deferred.resolve data.data
            .error (data, statusCode)->
                msg = {}
                msg.code = statusCode
                msg.message = data.message
                deferred.reject msg
            deferred.promise
    new baseService
]

