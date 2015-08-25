"use strict"

angular.module "farmss", [
    "ngRoute",
    "farmss.components",
    "farmss.views"
]

.config ["$routeProvider", ($routeProvider)->
    $routeProvider
    .when "/",
        templateUrl: "./views/home/home.html"
        controller: "farmss.views.home"
    .when "/views/main",
        templateUrl: "./views/main/main.html"
]




