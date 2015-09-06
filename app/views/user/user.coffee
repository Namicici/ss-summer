"use strict"

angular.module "ss.views"

.controller "ss.views.user", ["$scope", "$location",($scope, $location)->
    $scope.departments = [
            displayName: "卫生局"
            url: "/health"
        ,
            displayName: "经济贸易"
            url: "/economicTrade"
        ,
            displayName: "施工单位"
            url: "/construction"
        ,
            displayName: "公路管理局"
            url: "/road"
        ,
            displayName: "地方税务局"
            url: "/tex"
        ,
            displayName: "城管局"
            url: "/city"
        ,
            displayName: "粮食局"
            url: "/rice"
        ,
            displayName: "文化局"
            url: "/culture"
        ,
            displayName: "房产管理局"
            url: "/house"
        ,
            displayName: "农业机械管理局"
            url: "/farmMachine"
        ,
            displayName: "商业管理办公室"
            url: "/business"
        ,
            displayName: "工商行政管理局"
            url: "/industry"
        ,
            displayName: "民政局"
            url: "/civil"
        ,
            displayName: "教育体育局"
            url: "/education"
        ,
            displayName: "地震局"
            url: "/earthquake"
        ,
            displayName: "农业局"
            url: "/agriculture"
    ]

    $scope.locateToDepartment = (department)->
        $scope.currentDepartment = department

    $scope.$on "ss.components.menu.selected", (scope, section)->
        $scope.currentSection = section

]
