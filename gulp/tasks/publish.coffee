"use strict"

gulp = require "gulp"

gulp.task "publish", ["usemin"], ()->
    gulp.src ["app/**/*.html", "app/**/*.png"]
    .pipe gulp.dest "output/app"

    gulp.src ["js/**/*.*.js", "!js/mocks.libs.js"]
    .pipe gulp.dest "output/js"

    gulp.src ["css/**/*"]
    .pipe gulp.dest "output/css"

    gulp.src ["languages/**/*"]
    .pipe gulp.dest "output/languages"

    gulp.src ["images/**/*"]
    .pipe gulp.dest "output/images"

    gulp.src ["index.html"]
    .pipe gulp.dest "output/"
