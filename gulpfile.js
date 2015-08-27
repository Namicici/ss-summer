var gulp = require("gulp");
var coffee = require("gulp-coffee");
var sass = require("gulp-sass");
var concat = require("gulp-concat");
var del = require("del");
var rename = require("gulp-rename");
var minifycss = require("gulp-minify-css");
var uglify = require("gulp-uglify");
var templateCache = require("gulp-angular-templatecache");

gulp.task("clean:out", function(cb){
    del("./out", cb);
});

gulp.task("clean:js", function(cb){
    del(["./app/components/components.js", "./app/components/templates.js"], cb);
});

gulp.task("compile:scripts", function(){
    gulp.src("./app/components/**/*.coffee")
        .pipe(coffee({bare: true}))
        .pipe(concat("components.js"))
        .pipe(gulp.dest("./app/components"))
    gulp.src("./app/components/**/*.html")
        .pipe(templateCache("templates.js", {
            standalone: true,
            module: "ss.templates"
        }))
        .pipe(gulp.dest("./app/components"))
});

gulp.task("compile:coffee", function(){
    gulp.src("./*.coffee")
        .pipe(coffee({bare: true}))
        .pipe(gulp.dest("./out"))
    gulp.src("./server/*.coffee")
        .pipe(coffee({bare: true}))
        .pipe(gulp.dest("./out/server"))
    gulp.src(["./app/*.coffee", "./app/views/**/*.coffee"])
        .pipe(coffee({bare: true}))
        .pipe(concat("app.min.js"))
        .pipe(gulp.dest("./out/app"))
});

gulp.task("copy:thirdParty", function(){
    gulp.src(["./node_modules/angular/angular.min.js",
        "./node_modules/angular-route/angular-route.min.js",
        "./node_modules/jquery/dist/jquery.min.js",
        "./node_modules/semantic-ui-css/semantic.min.js"])
        .pipe(concat("thirdParty.js"))
        .pipe(gulp.dest("./out/app"))
    gulp.src("./node_modules/semantic-ui-icon/assets/**/*")
        .pipe(gulp.dest("./out/app/assets"))
    gulp.src(["./node_modules/semantic-ui-css/semantic.min.css",
        "./node_modules/semantic-ui-icon/icon.min.css"])
        .pipe(concat("thirdParty.css"))
        .pipe(gulp.dest("./out/app"))
    gulp.src("./app/components/*.js")
        .pipe(concat("templates.js"))
        .pipe(gulp.dest("./out/app"))
});

gulp.task("copy:view", function(){
    gulp.src("./app/views/**/*.html")
        .pipe(gulp.dest("./out/app/views"))
    gulp.src("./app/*.html")
        .pipe(gulp.dest("./out/app"))
    gulp.src("./app/images/*.*")
        .pipe(gulp.dest("./out/app/images"))
});

gulp.task("sass", function(){
    gulp.src("./app/sass/app.scss")
        .pipe(sass({errLogToConsole: true}))
        .pipe(rename({suffix: ".min"}))
        .pipe(minifycss())
        .pipe(gulp.dest("./out/app"))
});

gulp.task("watch", function(){
    gulp.watch(["./app/sass/*.scss", "./app/sass/**/*.scss", "./app/*.coffee", "./app/**/*.coffee", "./app/*.html", "./app/**/*.html"], ["build"])
});

gulp.task("minify:js", function(){
    gulp.src("./out/app/*.js")
        .pipe(uglify())
        .pipe(gulp.dest("./out/app"))
    gulp.src("./app/lib/*.js")
        .pipe(concat("thirdParty.js"))
        .pipe(uglify())
        .pipe(gulp.dest("./out/app"))
});

gulp.task("copy", function(){
    gulp.start("copy:thirdParty", "copy:view")
});

gulp.task("compile", function(){
    gulp.start("compile:scripts", "compile:coffee")
});

gulp.task("build", ["clean:out"], function(){
    gulp.start("sass", "compile", "copy")
});
