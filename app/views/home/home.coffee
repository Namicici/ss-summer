"use strict"

angular.module "ss.views"

.controller "ss.views.home", ["$scope",($scope)->

    $scope.$on "ss.components.header-menu.changed", (scope, item, subItem)->
        $scope.item = item
        $scope.subItem = subItem
        $scope.sections = [
                displayName:"首页"
                url: "#home"
                active: true
            ,
                displayName: "办事大厅"
                url: "#deal"
                active: false
            ,
                displayName: "公告大厅"
                url: "#announce"
                active: false
            ,
                displayName: "监督大厅"
                url: "#supervise"
                active: false
            ,
                displayName: "咨询与服务"
                url: "#service"
                active: false
            ,
                displayName: "使用指南"
                url: "#guide"
                active: false
        ]

    $scope.requests = [
            img: "elliot.jpg"
            datetime: "3 hours ago"
            summary: "Elliot added jenny to group Cowarker"
        ,
            img: "jenny.jpg"
            datetime: "23 hours ago"
            summary: "Jenny added sissy to group A"

    ]

]
