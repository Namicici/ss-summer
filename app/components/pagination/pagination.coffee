"use strict"

angular.module "ss.components"

.directive "ssPagination", [()->
    restrict: "EA"
    templateUrl: "pagination/pagination.html"
    scope:
        ssTotalPage: "="
        onPageChange: "&ssChange"
    controller: ["$scope", ($scope)->
        $scope.currentPage = 1
        $scope.pages = []
        initPageBox = ()->
            pages = []
            if $scope.ssTotalPage <= 7
                for index in [1..$scope.ssTotalPage]
                    pages.push index
            else
                if $scope.currentPage < 7
                    for index in [1..7]
                        pages.push index
                    pages.push "..."
                else if $scope.currentPage >= $scope.ssTotalPage - 2
                    pages.push 1
                    pages.push 2
                    pages.push "..."
                    pages.push $scope.ssTotalPage - 4
                    pages.push $scope.ssTotalPage - 3
                    pages.push $scope.ssTotalPage - 2
                    pages.push $scope.ssTotalPage - 1
                    pages.push $scope.ssTotalPage
                else
                    pages.push 1
                    pages.push 2
                    pages.push "..."
                    pages.push $scope.currentPage - 2
                    pages.push $scope.currentPage - 1
                    pages.push $scope.currentPage
                    pages.push $scope.currentPage + 1
                    pages.push $scope.currentPage + 2
                    pages.push "..."

            $scope.pages = pages
        initPageBox()

        $scope.setCurrentPage = (page)->
            if page == "..."
                return
            if page <= 0
                $scope.currentPage = 1
            else if page > $scope.ssTotalPage
                $scope.currentPage = $scope.ssTotalPage
            else
                $scope.currentPage = page
            initPageBox()
            $scope.onPageChange page: page
    ]

]
