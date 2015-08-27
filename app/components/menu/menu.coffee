"use strict"

angular.module "farmss.components"

.directive "ssMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "menu/menu.html"
    controller: ["$scope", ($scope)->
    ]
]
