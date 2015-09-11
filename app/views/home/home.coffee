"use strict"

angular.module "ss.views"

.controller "ss.views.home", ["$scope",($scope)->

    $scope.$on "ss.components.header-menu.changed", (scope, item, subItem)->
        $scope.item = item
        $scope.subItem = subItem

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

    setNotePannelStyle = (right)->
        element = document.getElementById "ssNotePannel"
        element.style.top = "44px"
        element.style.left = "auto"
        element.style.bottom = "auto"
        element.style.right =  right

    $scope.setNotePanelVisible = (isRequestNote, isMailNote, isNotificationNote)->
        $scope.requestNote = isRequestNote
        if $scope.requestNote
            setNotePannelStyle "260px"
            $scope.pannelData = $scope.requests
        $scope.mailNote = isMailNote
        if $scope.mailNote
            setNotePannelStyle "200px"
            $scope.pannelData = $scope.mailNotifications
        $scope.notificationNote = isNotificationNote
        if $scope.notificationNote
            setNotePannelStyle "150px"
            $scope.pannelData = $scope.notifications

]
