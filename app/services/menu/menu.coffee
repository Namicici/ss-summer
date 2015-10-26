"use strict"

angular.module "ss.services"
.service "ss.services.menus", ["ss.services.base", (baseService)->
    get: ()->
        httpConfig =
            method: "GET"
            url: "module/layout/menu/query"
        return baseService.http httpConfig
]
