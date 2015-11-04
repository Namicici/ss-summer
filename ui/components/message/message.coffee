"use strict"

angular.module "ss.components"

.directive "ssMessage", ["$timeout", ($timeout)->
    restrict: "EA"
    templateUrl: "ui/components/message/message.html"
    scope:
        ssTitle: "@"
        ssContent: "@"
        ssType:"@"
    link: (scope, element, attr)->
        scope.$watch "ssType", (newValue, oldValue)->
            if scope.ssType == "info"
                scope.ssIcon = "info circle"
                scope.color = "blue"
            else if scope.ssType == "warning"
                scope.ssIcon = "warning circle"
                scope.color = "Orange"
            else if scope.ssType == "error"
                scope.ssIcon = "remove circle"
                scope.color = "red"
            else
                scope.ssIcon = "info circle"
                scope.color = "green"

        scope.close = ()->
            element.remove()
            return

        $timeout ()->
            scope.close()
        , 5000
]
