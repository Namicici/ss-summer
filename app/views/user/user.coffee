"use strict"

angular.module "ss.views"

.controller "ss.views.user", ["$scope", "$location",($scope, $location)->
    $scope.departments = [
            displayName: "卫生局"
            url: "/health"
        ,
            displayName: "经济贸易"
            url: "/economicTrade"
        ,
            displayName: "施工单位"
            url: "/construction"
        ,
            displayName: "公路管理局"
            url: "/road"
        ,
            displayName: "地方税务局"
            url: "/tex"
        ,
            displayName: "城管局"
            url: "/city"
        ,
            displayName: "粮食局"
            url: "/rice"
        ,
            displayName: "文化局"
            url: "/culture"
        ,
            displayName: "房产管理局"
            url: "/house"
        ,
            displayName: "农业机械管理局"
            url: "/farmMachine"
        ,
            displayName: "商业管理办公室"
            url: "/business"
        ,
            displayName: "工商行政管理局"
            url: "/industry"
        ,
            displayName: "民政局"
            url: "/civil"
        ,
            displayName: "教育体育局"
            url: "/education"
        ,
            displayName: "地震局"
            url: "/earthquake"
        ,
            displayName: "农业局"
            url: "/agriculture"
    ]

    $scope.basicTableHeaders = ["审批事项编号", "审批事项名称", "受理部门", "办事指南", "在线咨询", "网上办理"]

    $scope.dealTabs = [
            displayName: "全部事项"
            name: "all"
        ,
            displayName: "面向个人审批事项"
            name: "person"
        ,
            displayName: "面向企业审批事项"
            name: "enterprise"
        ,
            displayName: "面向机关审批事项"
            name: "office"
    ]
    $scope.currentSelectedTab = $scope.dealTabs[0]

    $scope.allDatas = [
        [
                type:"text"
                label: "IQOIS"
            ,
                type: "text"
                label: "地震监测设施和地震观测环境保护范围内建设工程审批"
            ,
                type: "text"
                label: "地震局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "GHDIS"
            ,
                type: "text"
                label: "建设项目选址意见书"
            ,
                type: "text"
                label: "规划建设局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "IQO25"
            ,
                type: "text"
                label: "建设工程抗震设防要求确定"
            ,
                type: "text"
                label: "地震局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "GHD25"
            ,
                type: "text"
                label: "建设工程招标投标情况书备案"
            ,
                type: "text"
                label: "规划建设局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "IQOIB"
            ,
                type: "text"
                label: "实施大型爆破作业备案"
            ,
                type: "text"
                label: "地震局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "GHD2B"
            ,
                type: "text"
                label: "建设工程设计方案审查"
            ,
                type: "text"
                label: "规划建设局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ],[
                type: "text"
                label: "GHD65"
            ,
                type: "text"
                label: "建设用地规划许可证"
            ,
                type: "text"
                label: "规划建设局"
            ,
                type: "icon"
                label: "file text outline icon"
            ,
                type: "icon"
                label: "comments outline icon"
            ,
                type: "icon"
                label: "laptop icon"
        ]
    ]
    $scope.locateToDepartment = (department)->
        $scope.currentDepartment = department

    $scope.$on "ss.components.menu.selected", (scope, section)->
        $scope.currentSection = section

    $scope.selectTab = (tabData)->
        $scope.currentSelectedTab = tabData
]
