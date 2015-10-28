module.exports =
    paths:
        clean:
            js: ["./js"]
            css: ["./css"]
            publish: ["./output"]
        source:
            templates: ["app/**/*.html"]
            sass: "sass/app.scss"
            coffee: ["app/app.src.coffee", "app/**/module.coffee", "app/**/*.coffee", "!app/**/*.e2e.coffee", "!app/**/*.spec.coffee"]
            testCoffee: [ "app/**/*.spec.coffee"]
            scenarioCoffee: ["app/**/*.e2e.coffee"]
        dist:
            js: "./js"
            css: "./css"
            publish: "./output"
        thirdParty:
            js: ["libs/angular.min.js", "libs/angular-route.min.js", "libs/angular-ui-router.min.js", "libs/angular-local-storage.min.js"]
            css:["libs/semantic.min.css"]
            fonts:["libs/assets/**/*.*"]
            themes: ["libs/themes/**/*.*"]
        server: "server.coffee"

