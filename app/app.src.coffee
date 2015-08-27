"use strict"

angular.module "ss", [
    "ngRoute",
    "ss.components",
    "ss.templates",
    "ss.views"
]

.config ["$routeProvider", ($routeProvider)->
    $routeProvider
    .when "/",
        templateUrl: "./views/home/home.html"
        controller: "ss.views.home"
    .when "/views/user",
        templateUrl: "./views/user/user.html"
        controller: "ss.views.user"
]
