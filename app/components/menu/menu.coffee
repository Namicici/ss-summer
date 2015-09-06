"use strict"

angular.module "ss.components"

.directive "ssMenu", ["$location", ($location)->
    restrict: "EA"
    templateUrl: "menu/menu.html"
    controller: ["$scope", ($scope)->
        currentSection = null
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
        currentSection = $scope.sections[0]

        $scope.locateToSection = (section)->
            if currentSection
                currentSection.active = false
            currentSection = section
            currentSection.active = true
            $scope.$emit "ss.components.menu.selected", section
            #$location.path currentSection.url
    ]
]
