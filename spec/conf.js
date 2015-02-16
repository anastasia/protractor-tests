exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  capabilities: {
    'browserName': 'chrome'
  },
  keepAlive: true,
  allScriptsTimeout: 11000,
  specs: ['./tests/*.coffee'],
  baseUrl: 'http://localhost:' + (process.env.PORT || '8000'),
  framework: 'jasmine',
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
}

