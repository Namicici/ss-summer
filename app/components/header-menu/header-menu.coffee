"use strict"

angular.module "farmss.components"

.directive "ssHeaderMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "components/header-menu/header-menu.html"
    scope:
        headers: "="
    controller: ["$scope", ($scope)->
        childItem = null
        $scope.locate = (item, subItem)->
            if childItem
                childItem.active = false
            childItem = subItem
            childItem.active = true
            $scope.$emit "farmss.components.header-menu.changed", item, subItem

        $scope.headers = [
            name: "home"
            displayName: "Home"
            icon: "home icon"
            expanded: false
            children:[
                name: "summer"
                displayName: "summer lu"
                icon: "home icon"
                active: false
            ,
                name: "sissy"
                displayName: "sissy li"
                icon: "home icon"
                active: false
            ]
        ,
            name: "users"
            displayName: "Users"
            icon: "users icon"
            expanded: false
            children:[
                name: "alex"
                displayName: "Alex lu"
                icon: "home icon"
                active: false
            ,
                name: "jimmy"
                displayName: "Jimmy li"
                icon: "home icon"
                active: false
            ]
        ]

    ]
]
