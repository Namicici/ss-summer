function route(app){
    var groups =
    {
        "message": "query  succeed.",
        "data":[
        {
            "id": 86,
            "text": "用户管理",
            "iconCls": "icon_user",
            "checked": null,
            "leaf": null,
            "parentId": -1, // 父菜单节点, -1表示当前节点为根节点
            "attributes": {
                "id": 86,
                "name": "用户管理",
                "description": "用户管理菜单项",
                "resourceId": "RESOURCE_MENU_USERS",
                "types": 0,
                "active": false,
                "display": false,
                "action": "module/user", // 用户管理界面的action地址
                "hrefTarget": null,
                "handler": null,
                "iconCls": "icon_user",
                "orders": 1,
                "editorId": null,
                "perspectiveId": null,
                "viewpartId": null
          },
          "state": "closed"
        },

        {
            "id": 87,
            "text": "菜单管理",
            "iconCls": "icon_menu",
            "checked": null,
            "leaf": null,
            "parentId": -1, // 父菜单节点, -1表示当前节点为根节点
            "attributes": {
                "id": 87,
                "name": "菜单管理",
                "description": "菜单管理菜单项",
                "resourceId": "RESOURCE_MENU_MENUS", // 菜单管理界面的action地址
                "types": 0,
                "active": false,
                "display": false,
                "action": "module/menu",
                "hrefTarget": null,
                "handler": null,
                "iconCls": "icon_menu",
                "orders": 1,
                "editorId": null,
                "perspectiveId": null,
                "viewpartId": null
          },
          "state": "closed"
        }
      ],
        "code": "",
        "success": true
    };
    var menus =
    {
        "message": "query  succeed.",
        "data":[
        {
            "id": 100,
            "text": "访客",
            "iconCls": "icon_user",
            "checked": null,
            "leaf": null,
            "parentId": 86, // 父菜单节点, -1表示当前节点为根节点
            "attributes": {
                "id": 100,
                "name": "访客",
                "description": "可访问网站的普通用户",
                "resourceId": "RESOURCE_MENU_USERS",
                "types": 0,
                "active": false,
                "display": false,
                "action": "guests", // 用户管理界面的action地址
                "hrefTarget": "guests",
                "handler": null,
                "iconCls": "icon_user",
                "orders": 1,
                "editorId": null,
                "perspectiveId": null,
                "viewpartId": null
          },
          "state": "closed"
        },

        {
            "id": 101,
            "text": "编辑",
            "iconCls": "icon_menu",
            "checked": null,
            "leaf": null,
            "parentId": 86, // 父菜单节点, -1表示当前节点为根节点
            "attributes": {
                "id": 101,
                "name": "编辑",
                "description": "可发布信息的用户",
                "resourceId": "RESOURCE_MENU_MENUS", // 菜单管理界面的action地址
                "types": 0,
                "active": false,
                "display": false,
                "action": "writer",
                "hrefTarget": "writer",
                "handler": null,
                "iconCls": "icon_menu",
                "orders": 1,
                "editorId": null,
                "perspectiveId": null,
                "viewpartId": null
          },
          "state": "closed"
        }
      ],
        "code": "",
        "success": true
    };
    app.get("/dashboard/menu/:parentId", function(req, res, next){
        if (req.param("parentId") == -1)
            res.status(200).send(groups);
        else if (req.param("parentId") == 86)
            res.status(200).send(menus);
    });


    app.post("/login.do", function(req, res, next){
        res.status(200).send({"success":true});
    });

    app.get("/dashboard.me", function(req, res, next){
        var user = {
            "message": "您已经登录.",
            "data": {
                "id": 11,
                "name": "admin",
                "description": "admin user",
                "password": "",
                "head": null,
                "types": 0,
                "age": 0,
                "sex": 0,
                "country": null,
                "realName": null,
                "firstName": null,
                "lastName": null,
                "address": null,
                "company": null,
                "mobile": null,
                "telephone": null,
                "email": "admin@email.com",
                "postal": null,
                "birthday": null,
                "lastChange": null,
                "lastLogin": null,
                "createDate": "Oct 22, 2015 2:04:39 PM",
                "active": false,
                "display": false,
                "ssn": null,
                "ca": null,
                "resourceId": "USER_ADMIN",
                "menuId": null,
                "perspectiveId": null,
                "roles": null,
                "groupxs": null,
                "organs": null
            },
            "code": "",
            "success": true
            };
        res.status(200).send(user);
    });
};

exports.route = route
