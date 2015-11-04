module.exports =
    paths:
        clean:
            js: ["./js"]
            css: ["./css"]
            publish: ["./output"]
        source:
            templates: ["ui/**/*.html"]
            sass: "sass/app.scss"
            coffee: ["ui/app.src.coffee", "ui/**/module.coffee", "ui/**/*.coffee", "!ui/**/*.e2e.coffee", "!ui/**/*.spec.coffee"]
            testCoffee: [ "ui/**/*.spec.coffee"]
            scenarioCoffee: ["e2e/*.e2e.coffee", "!e2e/*.karma.e2e.coffee"]
            karmaScenarioCoffee: ["e2e/*.karma.e2e.coffee"]
        dist:
            js: "./js"
            css: "./css"
            publish: "./output"
        thirdParty:
            js: ["libs/angular.min.js", "libs/angular-route.min.js", "libs/angular-ui-router.min.js", "libs/angular-local-storage.min.js", "libs/angular-cookies.min.js"]
            css:["libs/semantic.min.css"]
            fonts:["libs/assets/**/*.*"]
            themes: ["libs/themes/**/*.*"]
        server: "server.coffee"

