function route(app){
    var menus = [{
        name: "home",
        displayName: "Home",
        icon: "home icon",
        expanded: false,
        children:[{
            name: "summer",
            displayName: "summer lu",
            icon: "home icon",
            active: false,
        },{
            name: "sissy",
            displayName: "sissy li",
            icon: "home icon",
            active: false,
        }]
    },{
        name: "users",
        displayName: "Users",
        icon: "users icon",
        expanded: false,
        children:[{
            name: "alex",
            displayName: "Alex lu",
            icon: "home icon",
            active: false,
        },{
            name: "jimmy",
            displayName: "Jimmy li",
            icon: "home icon",
            active: false,
        }]
    }];

    app.route("module/layout/menu/query")
    .get(function(req, res, next){
        res.json(menus);
        });
    /*app.get("module/layout/menu/query", function(req, res){
        res.send(menus);
    });*/
};

exports.route = route
