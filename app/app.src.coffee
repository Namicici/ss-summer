"use strict"

angular.module "ss", [
    "ui.router",
    "LocalStorageModule",
    "ss.components",
    "ss.views",
    "ss.services"
]

.run ["$rootScope", "ss.services.auth", "$location", ($rootScope, authService, $location)->
]

.config ["$stateProvider", "$urlRouterProvider", "localStorageServiceProvider", ($stateProvider, $urlRouterProvider, localStorageServiceProvider)->

    localStorageServiceProvider.setPrefix "ss"

    $urlRouterProvider.otherwise "/"

    $stateProvider
    .state "main",
        url: "/"
        templateUrl: "app/views/main/main.html"
        controller: "ss.views.main"
    .state "main.dashboard",
        url: "menu"
        templateUrl: "app/views/dashboard/dashboard.html"
        controller: "ss.views.dashboard"

    .state "main.menu",
        url: "menu/:action/:target"
        templateUrl: ($stateParams)->
            console.log "templateurl: " + $stateParams.target
            return "app/views/menus/" + $stateParams.target + ".html"

        controller: ["$stateParams", ($stateParams)->
            console.log "controller: " + $stateParams.action
            return "ss.views." + $stateParams.action
        ]

    .state "user",
        url:"/user"
        templateUrl: "app/views/user/user.html"
        controller: "ss.views.user"

    .state "login",
        url:"/login"
        templateUrl: "app/views/login/login.html"
        controller: "ss.views.login"
]
