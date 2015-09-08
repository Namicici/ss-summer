"use strict"

angular.module "ss.components"

.directive "ssMenu", ["$location", ($location)->
    restrict: "EA"
    templateUrl: "menu/menu.html"
    scope:
        ssItems: "="
    controller: ["$scope", ($scope)->
        currentSection = null
        currentSection = $scope.ssItems[0]

        $scope.locateToSection = (section)->
            if currentSection
                currentSection.active = false
            currentSection = section
            currentSection.active = true
            $scope.$emit "ss.components.menu.selected", section
            #$location.path currentSection.url
    ]
]
