"use strict"

angular.module "ss.components"

.directive "ssPagination", [()->
    restrict: "EA"
    templateUrl: "pagination/pagination.html"
    scope:
        ssTotalPage: "="
    controller: ["$scope", ($scope)->
        $scope.currentPage = 1
        $scope.pages = []
        initPageBox = (totalPage)->
            pages = []
            if totalPage <= 6
                for index in [1..totalPage]
                    pages.push index
            else
                if $scope.ssTotalPage - 6 >= $scope.currentPage
                    pages.push 1
                    if $scope.currentPage == 1 or $scope.currentPage == 2
                        pages.push 2
                        pages.push "..."
                    else
                        pages.push "..."
                        pages.push $scope.currentPage
                    pages.push "..."
                    pages.push totalPage - 1
                    pages.push totalPage
                else
                    pages.push totalPage - 5
                    pages.push totalPage - 4
                    pages.push totalPage - 3
                    pages.push totalPage - 2
                    pages.push totalPage - 1
                    pages.push totalPage
            $scope.pages = pages
        initPageBox $scope.ssTotalPage

        $scope.setCurrentPage = (page)->
            if page == "..."
                return
            if page <= 0
                $scope.currentPage = 1
            else if page > $scope.ssTotalPage
                $scope.currentPage = $scope.ssTotalPage
            else
                $scope.currentPage = page
            initPageBox $scope.ssTotalPage
    ]

]
