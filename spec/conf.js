exports.config = {
  allScriptsTimeout: 11000,
  args: {
    directConnect: true,
    chromeDriver: '../node_modules/chromedriver/lib/chromedriver/chromedriver'
  },
  specs: ['./tests/*.coffee'],
  baseUrl: "http://localhost:5555",
  rootElement: '.my-app',
  framework: 'jasmine',
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
}

