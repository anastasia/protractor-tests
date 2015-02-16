exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  keepAlive: true,
  allScriptsTimeout: 11000,
  specs: ['./tests/*.coffee'],
  baseUrl: "http://localhost:5555",
  rootElement: '.my-app',
  framework: 'jasmine',
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
}

