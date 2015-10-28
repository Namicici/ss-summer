"use strict"

angular.module "ss.components"

.directive "ssBasicTable", [()->
    restrict: "EA"
    templateUrl: "app/components/basic-table/basic-table.html"
    scope:
        ssHeaders: "="
        ssDatas: "="
    controller: ["$scope", ($scope)->
        copyDatas = $scope.ssDatas

        $scope.onPageChange = (page)->
            $scope.ssDatas = copyDatas[0..page%7]
    ]
]
