"use strict"

angular.module "ss.components"

.directive "ssHeaderMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "header-menu/header-menu.html"
    scope:
        headers: "="
    controller: ["$scope", ($scope)->
        childItem = null
        $scope.locateToDashboard = ()->
            $location.path "menu"
        $scope.locate = (item, subItem)->
            if childItem
                childItem.active = false
            childItem = subItem
            childItem.active = true
            $scope.$emit "ss.components.header-menu.changed", item, subItem

    ]
]
