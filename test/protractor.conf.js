var jasmineReporters = require('jasmine-reporters');//2.x

exports.config = {

    allScriptsTimeout: 11000,

    specs: [
      "../js/scenario.js"
    ],

    chromeOnly: true,

    capabilities: {
        'browserName': 'chrome'
    },

    framework: 'jasmine2',
    onPrepare: function () {
        jasmine.getEnv().addReporter(new jasmineReporters.JUnitXmlReporter({ savePath: 'test_results', filePrefix: 'e2e-tests', consolidateAll: true }));
    },
    jasmineNodeOpts: {
        defaultTimeoutInterval: 30000
    }
};
