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
  baseUrl: "http://localhost:8000"
}

// baseUrl: "http://localhost:3000"
// process.argv  — read command line properties
// argv[0] = generally node, process being run
// argv[1] = name of script being run


if (process.argv[3] == '--chrome') {
  exports.config.capabilities = browsers.chrome
} else {
  exports.config.multiCapabilities = [browsers.firefox, browsers.chrome]
}