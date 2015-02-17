exports.config = {
  allScriptsTimeout: 11000,

  specs: [
    './tests/*.coffee'
  ],

  capabilities: {
    'browserName': 'chrome'
  },

  baseUrl: 'http://localhost:3300',

  framework: 'jasmine',

  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }

}

