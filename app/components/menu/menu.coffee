"use strict"

angular.module "farmss.components"

.directive "ssMenu", ["$location",($location)->
    restrict: "EA"
    templateUrl: "components/menu/menu.html"
    controller: ["$scope", ($scope)->
    ]
]
