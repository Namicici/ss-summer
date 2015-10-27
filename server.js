
var http = require("http");
var url = require("url");
var bodyParser = require("body-parser");
var express = require("express");
var port = 8080;

var router = require("./server/router")

var app = express();

//app.setHeaders("Content-Type", "text/html");

app.use("/", express.static(__dirname));
app.get("/", function(req, res){
    res.redirect("/");
});


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }))

app.use(function(req, res, next){
    router.route(app);
    next();
});

var server = app.listen(port, function(){
    console.log("Express server listen on %s:%s", server.address().address, server.address().port);
});

