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
