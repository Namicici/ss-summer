angular.module("ss.templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("basic-table/basic-table.html","\r\n<table class=\"ui very basic table\">\r\n    <thead>\r\n        <tr>\r\n            <th ng-repeat=\"header in ssHeaders\">{{header}}</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr ng-repeat=\"data in ssDatas\">\r\n            <td ng-repeat=\"field in data\">\r\n                <div ng-if=\"field.type==\'text\'\">{{field.label}}</div>\r\n                <div ng-if=\"field.type==\'icon\'\">\r\n                    <i class=\"{{field.label}}\"></i>\r\n                </div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n");
$templateCache.put("header-menu/header-menu.html","<div class=\"ui inverted vertical\">\r\n    <div class=\"item\" ng-repeat = \"item in headers\">\r\n        <div class=\"header\">\r\n            <i class=\"{{item.icon}}\"></i>\r\n            {{item.displayName}}\r\n        </div>\r\n        <div class=\"menu\" ng-repeat=\"subItem in item.children\">\r\n            <a class=\"item\" ng-click = \"locate(item, subItem)\" ng-class=\"{\'active\': subItem.active}\">\r\n                {{subItem.displayName}}\r\n            </a>\r\n        </div>\r\n    </div>\r\n</div>\r\n");
$templateCache.put("menu/menu.html","<div class=\"ui red segment\">\r\n  <div class=\"ui secondary six item menu\">\r\n    <a class=\"item\" ng-click=\"locateToSection(section)\" ng-repeat=\"section in sections\" ng-class=\"{\'active\': section.active}\">{{section.displayName}}</a>\r\n  </div>\r\n</div>\r\n");}]);