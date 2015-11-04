"use strict"

gulp = require "gulp"
copy = require "gulp-copy"
del = require "del"

gulp.task "publish", ["usemin"], ()->
    #outPath = "F:\Git\workshop-j2ee\workshop-j2ee\workshop-j2ee-web\workshop-j2ee-web-app\src\main\webapp\resources\app"
    outPath = "output"
    gulp.src ["ui/**/*.html", "ui/**/*.png"]
    .pipe gulp.dest outPath + "/ui"

    gulp.src ["js/**/*.js", "!js/mocks.libs.js"]
    .pipe gulp.dest outPath + "/js"

    gulp.src ["css/**/*"]
    .pipe gulp.dest outPath + "/css"

    gulp.src ["languages/**/*"]
    .pipe gulp.dest outPath + "/languages"

    gulp.src ["images/**/*"]
    .pipe gulp.dest outPath + "/images"

    gulp.src ["index.html"]
    .pipe gulp.dest outPath + "/"

###
gulp.task "cleanDirectToFolder", [], ()->
    path = "F:/Git/workshop-j2ee/workshop-j2ee/workshop-j2ee-web/workshop-j2ee-web-app/src/main/webapp/resources/app"
    del path

gulp.task "directTo", ["publish", "cleanDirectToFolder"], ()->
    path = "./../../workshop-j2ee/workshop-j2ee/workshop-j2ee-web/workshop-j2ee-web-app/src/main/webapp/resources/app"
    gulp.src "./output/"
    .pipe copy gulp.dest path
###
