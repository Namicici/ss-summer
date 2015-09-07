"use strict"

angular.module "ss.components"

.directive "ssBasicTable", [()->
    restrict: "EA"
    templateUrl: "basic-table/basic-table.html"
    scope:
        ssHeaders: "="
        ssDatas: "="
    controller: ["$scope", ($scope)->
    ]
]
