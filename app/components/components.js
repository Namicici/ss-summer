angular.module("ss.components", []);

"use strict";
angular.module("ss.components").directive("ssHeaderMenu", [
  "$location", function($location) {
    return {
      restrict: "EA",
      templateUrl: "header-menu/header-menu.html",
      scope: {
        headers: "="
      },
      controller: [
        "$scope", function($scope) {
          var childItem;
          childItem = null;
          $scope.locate = function(item, subItem) {
            if (childItem) {
              childItem.active = false;
            }
            childItem = subItem;
            childItem.active = true;
            return $scope.$emit("ss.components.header-menu.changed", item, subItem);
          };
          return $scope.headers = [
            {
              name: "home",
              displayName: "Home",
              icon: "home icon",
              expanded: false,
              children: [
                {
                  name: "summer",
                  displayName: "summer lu",
                  icon: "home icon",
                  active: false
                }, {
                  name: "sissy",
                  displayName: "sissy li",
                  icon: "home icon",
                  active: false
                }
              ]
            }, {
              name: "users",
              displayName: "Users",
              icon: "users icon",
              expanded: false,
              children: [
                {
                  name: "alex",
                  displayName: "Alex lu",
                  icon: "home icon",
                  active: false
                }, {
                  name: "jimmy",
                  displayName: "Jimmy li",
                  icon: "home icon",
                  active: false
                }
              ]
            }
          ];
        }
      ]
    };
  }
]);

"use strict";
angular.module("ss.components").directive("ssMenu", [
  "$location", function($location) {
    return {
      restrict: "EA",
      templateUrl: "menu/menu.html",
      controller: [
        "$scope", function($scope) {
          var currentSection;
          currentSection = null;
          $scope.sections = [
            {
              displayName: "首页",
              url: "#home",
              active: true
            }, {
              displayName: "办事大厅",
              url: "#deal",
              active: false
            }, {
              displayName: "公告大厅",
              url: "#announce",
              active: false
            }, {
              displayName: "监督大厅",
              url: "#supervise",
              active: false
            }, {
              displayName: "咨询与服务",
              url: "#service",
              active: false
            }, {
              displayName: "使用指南",
              url: "#guide",
              active: false
            }
          ];
          currentSection = $scope.sections[0];
          return $scope.locateToSection = function(section) {
            if (currentSection) {
              currentSection.active = false;
            }
            currentSection = section;
            currentSection.active = true;
            return $scope.$emit("ss.components.menu.selected", section);
          };
        }
      ]
    };
  }
]);
