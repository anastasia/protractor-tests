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
  browsers: {
    chrome: {
      name: 'chrome',
      browserName: 'chrome'
    }
  },
  specs: ['./tests/*.coffee'],
  baseUrl: "http://localhost:5555",
  rootElement: '.my-app',
  jasmineNodeOpts: {
    showColors: true
  }
}

