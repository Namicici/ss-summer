"use strict"

angular.module "ss.views"

.controller "ss.views.management", ["$scope", "ss.services.menus", "ss.services.alertService", "ssLoading",
($scope, menuService, alertService, loading)->
    getAllGroups = ()->
        promise = menuService.getMenus(-1)
        loading promise
        promise.then (data)->
            $scope.groups = data
            if $scope.groups.length <= 0
                $scope.status = 0 # create menus
            else
                $scope.status = 1 # read menus
        , (msg)->
            alertService.error msg.message

    getAllGroups()

    getMenus = (parentId)->
        promise = menuService.getMenus(parentId)
        loading promise
        promise.then (data)->
            $scope.menus = data
        , (msg)->
            alertService.error msg.message

]
