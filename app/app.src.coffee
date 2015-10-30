"use strict"

angular.module "ss", [
    "ui.router",
    "LocalStorageModule",
    "ss.components",
    "ss.views",
    "ss.services"
]

.run ["$rootScope", "ss.services.auth", "$location", "$state", ($rootScope, authService, $location, $state)->
    ###
    $rootScope.$on "$stateChangeStart" ,(event,toState,toParams, fromState, fromParams)->
        if not authService.isLogin()
            $location.path '/login'
    ###
    $rootScope.$on "$locationChangeStart", (event, next, current)->
        restrictedPage = ["/login", "/signup"].indexOf($location.path()) != -1
        if restrictedPage and not authService.isLogin()
            $location.path "/login"
]

.config ["$stateProvider", "$urlRouterProvider", "localStorageServiceProvider", ($stateProvider, $urlRouterProvider, localStorageServiceProvider)->

    localStorageServiceProvider.setPrefix "ss"

    $urlRouterProvider.otherwise "/"

    $stateProvider
    .state "home",
        url: "/"
        templateUrl: "app/views/home/home.html"
        controller: "ss.views.home"
    .state "main",
        url: "/dashboard"
        templateUrl: "app/views/main/main.html"
        controller: "ss.views.main"
    .state "main.dashboard",
        url: "/menu"
        templateUrl: "app/views/dashboard/dashboard.html"
        controller: "ss.views.dashboard"

    .state "main.menu",
        url: "/menu/:action/:target"
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

    .state "register",
        url: "/register"
        templateUrl: "app/views/register/register.html"
        controller: "ss.views.register"
]
