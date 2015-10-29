"use strict"

angular.module "ss.services"
.service "ss.services.menus", ["ss.services.base", (baseService)->
    getMenus: (parentId)->
        httpConfig =
            method: "GET"
            url: "/dashboard/menu/#{parentId}"
        return baseService.http httpConfig

    getUser: ()->
        httpConfig =
            method: "GET"
            url: "/dashboard.me"
        return baseService.http httpConfig
]
