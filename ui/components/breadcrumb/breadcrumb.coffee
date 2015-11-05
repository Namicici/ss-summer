"use strict"

angular.module "ss.components"

.directive "ssBreadcrumb", [()->
    restrict: "EA"
    templateUrl: "ui/components/breadcrumb/breadcrumb.html"
    scope:
        ssGroup: "="
        ssItem:"="
    link: (scope)->
        console.log scope.ssGroup
        console.log scope.ssItem
]
