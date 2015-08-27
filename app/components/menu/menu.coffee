"use strict"

angular.module "ss.components"

.directive "ssMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "menu/menu.html"
    controller: ["$scope", ($scope)->
    ]
]
