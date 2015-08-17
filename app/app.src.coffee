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

    .when "/views/:parent/:child",
        templateUrl: (params)->
            return "./views/#{params.parent}/#{params.child}.html"
        controller: ["$routeParams",($routeParams)->
            return "farmss.views.#{$routeParams.parent}.#{$routeParams.child}"
        ]
]
