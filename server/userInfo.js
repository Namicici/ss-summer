exports.user = getUserInfo;

function getUserInfo(req, res, next){
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

}
