exports.verifyLogin = verifyLogin;
exports.verifyRegister = verifyRegister;

function verifyLogin(req, res, next){
    if ((req.body.email == "admin@software.dell.com") && (req.body.password == "admin"))
        res.status(200).send({"success":true, "data": {"action": "admin"}});
    else
        res.status(200).send({
            "success": false,
            "data":null,
            "message":"用户名或者密码不匹配。"
        });
}

function verifyRegister(req, res, next){
    if (req.body.types == 0)
        res.status(200).send({"success":true, "data": null});
    else
        res.status(200).send({
            "success": false,
            "data":null,
            "message":"不支持这种类型的用户注册。"
        });

}
