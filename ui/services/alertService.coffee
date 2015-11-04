"use strict"

angular.module "ss.services"
.factory "ss.services.alertService", ["$q", "$http", "$timeout", "$rootScope", "$compile", "$document", ($q, $http, $timeout, $rootScope, $compile, $document)->
    getDocument = (args, type)->
        deferred = $q.defer()
        $timeout ()->
            setAlerts args, type, deferred
        , 0
        return deferred.promise

    alertService = ()->
        return getDocument arguments

    alertService.info = ()->
        return getDocument arguments, "info"

    alertService.warning = ()->
        return getDocument arguments, "warning"

    alertService.error = ()->
        return getDocument arguments, "error"

    alertService.success = ()->
        return getDocument arguments, "success"

    setAlerts = (args, type, deferred)->
        msg = args[0]
        #element = "<ss-message ss-title='#{type}' ss-content='#{msg}' ss-type='#{type}'></ss-message>"
        element = document.createElement "ss-message"
        element.setAttribute "ss-title", type
        element.setAttribute "ss-content", msg
        element.setAttribute "ss-type", type
        scope = $rootScope.$new()
        element = $compile(angular.element element)(scope)
        parentElem = document.getElementById("ss-main-content")
        parentElem = angular.element parentElem
        $timeout ()->
            parentElem.append element
            deferred.resolve(1)
        , 0
    return alertService
]

