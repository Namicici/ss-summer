"use strict"

angular.module "farmss", [
    "ngRoute",
    "farmss.components"
]

.config ["$routeProvider", ($routeProvider)->
    $routeProvider
    .when "/",
        templateUrl: "./views/home.html"
    .when "/views/main",
        templateUrl: "./views/main.html"
]



