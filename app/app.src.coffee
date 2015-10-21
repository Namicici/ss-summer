"use strict"

angular.module "ss", [
    "ui.router",
    "ss.components",
    "ss.templates",
    "ss.views"
]

.config ["$stateProvider", "$urlRouterProvider", ($stateProvider, $urlRouterProvider)->

    $urlRouterProvider.otherwise "/"

    $stateProvider
    .state "main",
        url: "/"
        templateUrl: "./views/main/main.html"
        controller: "ss.views.main"
    .state "main.dashboard",
        url: "module/layout/menu"
        templateUrl: "./views/dashboard/dashboard.html"
        controller: "ss.views.dashboard"
    .state "main.menu",
        url: "module/layout/menu/:name"
        templateUrl: ($stateParams)->
            console.log "templateurl: " + $stateParams.name
            return "./views/menus/" + $stateParams.name + ".html"
        controller: ["$stateParams", ($stateParams)->
            console.log "controller: " + $stateParams.name
            return "ss.views." + $stateParams.name
        ]
    .state "user",
        url:"views/user"
        templateUrl: "./views/user/user.html"
        controller: "ss.views.user"
    ###
    .when "/views/user/deal",
        templateUrl: "./views/user/deal/deal.html"
        controller: "ss.views.deal"
    ###
]
