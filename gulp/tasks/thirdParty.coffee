"use strict"

gulp = require "gulp"
concat = require "gulp-concat"

paths = require("../config").paths

gulp.task "thirdParty", ["thirdPartyJs", "thirdPartyCss", "thirdPartyFonts"]

gulp.task "thirdPartyJs",[],()->
    gulp.src paths.thirdParty.js
    .pipe concat "thirdParty.js"
    .pipe gulp.dest paths.dist.js

gulp.task "thirdPartyCss", [], ()->
    gulp.src paths.thirdParty.css
    .pipe concat "thirdParty.css"
    .pipe gulp.dest paths.dist.css

gulp.task "thirdPartyFonts", [], ()->
    gulp.src paths.thirdParty.fonts
    .pipe gulp.dest paths.dist.css + "/assets"

    gulp.src paths.thirdParty.themes
    .pipe gulp.dest paths.dist.css + "/themes"
