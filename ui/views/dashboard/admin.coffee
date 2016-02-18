"use strict"

angular.module "ss.views"

.controller "ss.views.admin", ["$rootScope", "$scope", "ss.services.menus", "$http", "ss.services.auth", "ss.services.alertService", 
"ssLoading", "$location",
(rootScope, $scope, menuService, $http, authService, alertService, loading, $location)->
    $scope.visible = true
    $scope.firstLoad = true
    expandGroup = null
    getAllGroups = ()->
        promise = menuService.getMenus(-1)
        loading promise
        promise.then (data)->
            $scope.groups = data
        , (msg)->
            alertService.error msg.message
    getMenus = (parentId)->
        promise = menuService.getMenus(parentId)
        loading promise
        promise.then (data)->
            $scope.menus = data
        , (msg)->
            $scope.menus = []

            alertService.error msg.message
    getUser = ()->
        promise = menuService.getUser()
        loading promise
        promise.then (data)->
            $scope.user = data
        , (msg)->
            alertService.error msg.message
    getUser()
    getAllGroups()

    $scope.expandGroup = (group)->
        if expandGroup
            expandGroup.expand = false
        expandGroup = group
        group.expand = true
        getMenus group.id

    $scope.setBreadcrumb = (groupName, menuName)->
        $scope.groupName = groupName
        $scope.menuName = menuName

    $scope.$on "ss.components.header-menu.changed", (scope, item, subItem)->
        $scope.item = item
        $scope.subItem = subItem

    $scope.requests = requests

    ###
    $scope.requests = {
        header: "You have 2 requests"
        content:[
                img: "elliot.jpg"
                datetime: "3 hours ago"
                summary: "Elliot added jenny to group Cowarker"
            ,
                img: "jenny.jpg"
                datetime: "23 hours ago"
                summary: "Jenny added sissy to group A"
        ]
    }
    ###

    $scope.mailNotifications = {
        header: "You have 4 messages"
        content: [
                img: "elliot.jpg"
                datetime: "12 minutes ago"
                summary: "Imrich sent you a message"
            ,
                img: "jenny.jpg"
                datetime: "46 minutes ago"
                summary: "Bill sent you a message"
            ,
                img: "jenny.jpg"
                datetime: "46 minutes ago"
                summary: "Bill sent you a message"
            ,
                img: "jenny.jpg"
                datetime: "46 minutes ago"
                summary: "Bill sent you a message"
        ]
    }

    $scope.notifications = {
        header: "You have 3 notifications"
        content: [
                img: "elliot.jpg"
                datetime: "12 minutes ago"
                summary: "Imrich sent you a message"
            ,
                img: "jenny.jpg"
                datetime: "46 minutes ago"
                summary: "Bill sent you a message"
            ,
                img: "jenny.jpg"
                datetime: "46 minutes ago"
                summary: "Bill sent you a message"
        ]
    }

    $scope.setNotePanelVisible = (isRequestNote, isMailNote, isNotificationNote)->
        $scope.requestNote = isRequestNote
        if $scope.requestNote
            $scope.pannelData = $scope.requests
        $scope.mailNote = isMailNote
        if $scope.mailNote
            $scope.pannelData = $scope.mailNotifications
        $scope.notificationNote = isNotificationNote
        if $scope.notificationNote
            $scope.pannelData = $scope.notifications

]
