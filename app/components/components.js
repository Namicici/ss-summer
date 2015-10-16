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
      controller: [
        "$scope", function($scope) {
          var copyDatas;
          copyDatas = $scope.ssDatas;
          return $scope.onPageChange = function(page) {
            return $scope.ssDatas = copyDatas.slice(0, +(page % 7) + 1 || 9e9);
          };
        }
      ]
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
      link: function($scope, $element, $attributes) {
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
    };
  }
]);

"use strict";
angular.module("ss.components").directive("ssPagination", [
  function() {
    return {
      restrict: "EA",
      templateUrl: "pagination/pagination.html",
      scope: {
        ssTotalPage: "=",
        onPageChange: "&ssChange"
      },
      controller: [
        "$scope", function($scope) {
          var initPageBox;
          $scope.currentPage = 1;
          $scope.pages = [];
          initPageBox = function() {
            var i, index, j, pages, ref;
            pages = [];
            if ($scope.ssTotalPage <= 7) {
              for (index = i = 1, ref = $scope.ssTotalPage; 1 <= ref ? i <= ref : i >= ref; index = 1 <= ref ? ++i : --i) {
                pages.push(index);
              }
            } else {
              if ($scope.currentPage < 7) {
                for (index = j = 1; j <= 7; index = ++j) {
                  pages.push(index);
                }
                pages.push("...");
              } else if ($scope.currentPage >= $scope.ssTotalPage - 2) {
                pages.push(1);
                pages.push(2);
                pages.push("...");
                pages.push($scope.currentPage - 2);
                pages.push($scope.currentPage - 1);
                pages.push($scope.currentPage);
                pages.push($scope.currentPage + 1);
                pages.push($scope.currentPage + 2);
              } else {
                pages.push(1);
                pages.push(2);
                pages.push("...");
                pages.push($scope.currentPage - 2);
                pages.push($scope.currentPage - 1);
                pages.push($scope.currentPage);
                pages.push($scope.currentPage + 1);
                pages.push($scope.currentPage + 2);
                pages.push("...");
              }
            }
            return $scope.pages = pages;
          };
          initPageBox();
          return $scope.setCurrentPage = function(page) {
            if (page === "...") {
              return;
            }
            if (page <= 0) {
              $scope.currentPage = 1;
            } else if (page > $scope.ssTotalPage) {
              $scope.currentPage = $scope.ssTotalPage;
            } else {
              $scope.currentPage = page;
            }
            initPageBox();
            return $scope.onPageChange({
              page: page
            });
          };
        }
      ]
    };
  }
]);
