var http = require("http");
var url = require("url");
var bodyParser = require("body-parser");
var express = require("express");
var port = 8080;

var app = express();

app.use(bodyParser());

// why config like this. what's usage of the 'use'
app.use("/", express.static(__dirname));
app.get("/", function(req, res){
    res.redirect("/");
});

app.get("/api/view/model", function(req, res){
    res.send("<h1>Li Ping</h1>")
});

var server = app.listen(port, function(){
    console.log("Express server listen on %s:%s", server.address().address, server.address().port);
});
