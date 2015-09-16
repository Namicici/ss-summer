http = require "http"
url = require "url"
bodyParser = require "body-parser"
express = require "express"
port = 8080

app = express()

app.use bodyParser()

# why config like this. what's usage of the 'use'
app.use "/app", express.static __dirname + "/app"
app.get "/", (req, res)->
    res.redirect "/app"

app.get "/api/view/model", (req, res)->
    res.send "<h1>Li Ping</h1>"

server = app.listen port, ()->
    console.log "Express server listen on %s:%s", server.address().address, server.address().port
