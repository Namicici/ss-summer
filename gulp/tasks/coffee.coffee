"use strict"

gulp = require "gulp"
coffee = require "gulp-coffee"
concat = require "gulp-concat"
rename = require "gulp-rename"

paths = require("../config").paths

gulp.task "coffee", ["coffeeJs", "testCoffeeJs", "scenarioCoffeeJs", "karmaScenarioCoffeeJs"]

gulp.task "coffeeJs", [], ()->
    gulp.src paths.source.coffee
        .pipe coffee()
        .pipe concat "app.js"
        .pipe gulp.dest paths.dist.js

gulp.task "testCoffeeJs", [], ()->
    gulp.src paths.source.testCoffee
    .pipe coffee()
    .pipe concat "test.js"
    .pipe gulp.dest paths.dist.js

gulp.task "scenarioCoffeeJs", [], ()->
    gulp.src paths.source.scenarioCoffee
    .pipe coffee()
    .pipe concat "scenario.js"
    .pipe gulp.dest paths.dist.js

gulp.task "karmaScenarioCoffeeJs", [], ()->
    gulp.src paths.source.karmaScenarioCoffee
    .pipe coffee()
    .pipe concat "karmaScenario.js"
    .pipe gulp.dest paths.dist.js
