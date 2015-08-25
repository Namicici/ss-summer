"use strict"

angular.module "farmss.views"

.controller "farmss.views.home", ["$scope",($scope)->

    $scope.$on "farmss.components.header-menu.changed", (scope, item, subItem)->
        $scope.item = item
        $scope.subItem = subItem

]