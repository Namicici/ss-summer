"use strict"

angular.module "ss.components"

.directive "ssTab", [()->
    restrict: "EA"
    transclude: true
    templateUrl: "ui/components/tab/tab.html"
    controller: ["$scope", ($scope)->
        panes = $scope.panes = []

        $scope.select = (pane) ->
            angular.forEach panes, (pane)->
                pane.selected = false

            pane.selected = true

        this.addPane = (pane)->
            if panes.length is 0
                $scope.select pane
            panes.push pane
        true
    ]
]
