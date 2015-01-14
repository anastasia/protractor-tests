var browsers = {
  firefox: {
    name: 'firefox',
    browserName: 'firefox'
  },
  chrome: {
    name: 'chrome',
    browserName: 'chrome'
  }
}
exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['./tests/*.coffee'],
  baseUrl: "http://localhost:8000",
  rootElement: '.my-app',
  jasmineNodeOpts: {
    showColors: true
  }
}

if (process.argv[3] == '--chrome') {
  exports.config.capabilities = browsers.chrome
} else {
  exports.config.multiCapabilities = [browsers.firefox, browsers.chrome]
}