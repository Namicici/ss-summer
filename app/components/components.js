angular.module("ss.components", []);

"use strict";
angular.module("ss.components").directive("ssBasicTable", [
  function() {
    return {
      restrict: "EA",
      templateUrl: "basic-table/basic-table.html",
      scope: {
        ssHeaders: "=",
        ssDatas: "="
      },
      controller: ["$scope", function($scope) {}]
    };
  }
]);

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
      scope: {
        ssItems: "="
      },
      controller: [
        "$scope", function($scope) {
          var currentSection;
          currentSection = null;
          currentSection = $scope.ssItems[0];
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

"use strict";
angular.module("ss.components").directive("outsideClick", [
  '$document', '$parse', function($document, $parse) {
    return {
      link: {
        pre: function($scope, $element, $attributes) {},
        post: function($scope, $element, $attributes) {
          var onDocumentClick;
          onDocumentClick = function(event) {
            var child, children, i, isChild, isInside, isSelf, len;
            isChild = false;
            children = $element.children(event.target);
            for (i = 0, len = children.length; i < len; i++) {
              child = children[i];
              if (child === event.target) {
                isChild = true;
                return;
              }
            }
            isSelf = $element[0] === event.target;
            isInside = isChild || isSelf;
            if (!isInside) {
              return $scope.$apply($attributes.outsideClick);
            }
          };
          $document.on("click", onDocumentClick);
          return $element.on('$destroy', function() {
            return $document.off("click", onDocumentClick);
          });
        }
      }
    };
  }
]);
