"use strict"

angular.module "ss.components"

.directive "ssPane", [()->
    require: "^ssTab"
    restrict: "EA"
    transclude: true
    templateUrl: "ui/components/tab/pane.html"
    scope:
        title: "@"
    link: (scope, element, attrs, tabCtrl)->
        tabCtrl.addPane scope
]
