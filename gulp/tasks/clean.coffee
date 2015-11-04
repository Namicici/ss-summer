"use strict"

gulp = require "gulp"
del = require "del"

paths = require("../config").paths

gulp.task "clean", ["clean:js", "clean:css", "clean:output"]

gulp.task "clean:js", [], ()->
    del paths.clean.js

gulp.task "clean:css", [], ()->
    del paths.clean.css

gulp.task "clean:output",[],()->
    del paths.clean.publish
    #del "F:\Git\workshop-j2ee\workshop-j2ee\workshop-j2ee-web\workshop-j2ee-web-app\src\main\webapp\resources\app"
