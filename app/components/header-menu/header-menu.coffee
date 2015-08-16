"use strict"

angular.module "farmss.components"

.directive "ssHeaderMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "components/header-menu/header-menu.html"
    scope:
        headers: "="
    controller: ["$scope", ($scope)->
        $scope.locate = (item, subItem)->
            $location.path "/views/#{item.name}/#{subItem.name}"

        $scope.headers = [
            name: "home"
            displayName: "home"
            icon: "home icon"
            expanded: false
            children:[
                name: "summer"
                displayName: "summer lu"
                icon: "home icon"
            ,
                name: "sissy"
                displayName: "sissy li"
                icon: "home icon"
            ]
        ,
            name: "firstChild"
            displayName: "Fitst Child"
            icon: "home icon"
            expanded: false
            children:[
                name: "alex"
                displayName: "Alex lu"
                icon: "home icon"
            ,
                name: "jimmy"
                displayName: "Jimmy li"
                icon: "home icon"
            ]
        ]
    ]
]