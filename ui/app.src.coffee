"use strict"

angular.module "ss", [
    "ui.router",
    "LocalStorageModule",
    "ngCookies",
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
        restrictedPage = ["/login", "/register"].indexOf($location.path()) == -1
        if restrictedPage and not authService.isLogin()
            $location.path "/login"
]

.config ["$stateProvider", "$urlRouterProvider", "localStorageServiceProvider", ($stateProvider, $urlRouterProvider, localStorageServiceProvider)->

    localStorageServiceProvider.setPrefix "ss"

    $urlRouterProvider.otherwise "/"

    $stateProvider
    .state "login",
        url:"/login"
        templateUrl: "ui/views/login/login.html"
        controller: "ss.views.login"

    .state "register",
        url: "/register"
        templateUrl: "ui/views/register/register.html"
        controller: "ss.views.register"

    .state "home",
        url: "/"
        templateUrl: "ui/views/home/home.html"
        controller: "ss.views.home"

    .state "dashboard",
        url: "/dashboard"

        templateProvider: ["ss.services.auth", "$http", "$templateCache", (authService, $http, $templateCache)->
            user = authService.getUser()
            if user
                path = "ui/views/dashboard/" + user.action + ".html"
                $http.get path, cache: $templateCache
                .then (html)->
                    return html.data
        ]

        controllerProvider: ["ss.services.auth", (authService)->
            user = authService.getUser()
            if user
                return "ss.views." + user.action
        ]

    .state "dashboard.manageMenus",
        url: "/manageMenus"
        templateUrl: "ui/views/manageMenus/manageMenus.html"
        controller: "ss.views.manageMenus"

    .state "dashboard.menu",
        url: "/menu/:action/:target"
        templateUrl: ($stateParams)->
            console.log "templateurl: " + $stateParams.target
            return "ui/views/menus/" + $stateParams.target + ".html"

        controller: ["$stateParams", ($stateParams)->
            console.log "controller: " + $stateParams.action
            return "ss.views." + $stateParams.action
        ]

    .state "user",
        url:"/user"
        templateUrl: "ui/views/user/user.html"
        controller: "ss.views.user"
]
