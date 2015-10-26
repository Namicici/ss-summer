module.exports = (config)->
    config.set
        basePath: "../"
        frameworks: ["ng-scenario"]
        urlRoot: "/__karma/"
        autoWatch: true
        browsers: ["Chrome"]
        plugins:[
            "karma-chrome-launcher"
            'karma-ng-scenario'
        ]
        proxies:
            "/": "http://localhost:8080/"

        files: ["js/scenario.js"]
