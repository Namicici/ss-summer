"use strict"

angular.module "farmss.components"

.directive "ssFrame", [()->
    restrict: "EA"
    templateUrl: "components/frame/frame.html"
    controller: ["$scope", ($scope)->
        $scope.$on "farmss.components.header-menu.changed", (scope, item, subItem)->
            $scope.item = item
            $scope.subItem = subItem
    ]
]
