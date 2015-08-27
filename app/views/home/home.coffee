"use strict"

angular.module "ss.views"

.controller "ss.views.home", ["$scope",($scope)->

    $scope.$on "ss.components.header-menu.changed", (scope, item, subItem)->
        $scope.item = item
        $scope.subItem = subItem

]
