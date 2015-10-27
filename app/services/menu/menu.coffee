"use strict"

angular.module "ss.services"
.service "ss.services.menus", ["ss.services.base", (baseService)->
    get: (parentId)->
        httpConfig =
            method: "GET"
            url: "/module/layout/menus/#{parentId}"
        return baseService.http httpConfig
]
