"use strict"

angular.module "ss.views"

.controller "ss.views.user", ["$scope",($scope)->
    $scope.departments = ["卫生局", "经济贸易", "施工单位", "公路管理局"]

]
