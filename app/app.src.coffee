"use strict"

angular.module "farmss", [
    "ngRoute",
    "farmss.views",
    "farmss.components"
]
.config ["$routeProvider", ($routeProvider)->
    $routeProvider
    .when "/",
        templateUrl:"./views/home/home.html"
        controller:"farmss.views.home"
    .when "/views/:header/:subHeader",
        templateUrl: (params)->
            return "./views/#{params.header}/#{params.subHeader}.html"
        controller: ["$routeParams",($routeParams)->
            return "farmss.views.#{$routeParams.header}.#{$routeParams.subHeader}"
        ]
]
