exports.config = {
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

