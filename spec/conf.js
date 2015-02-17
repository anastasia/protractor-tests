exports.config = {
  allScriptsTimeout: 11000,

  specs: [
    './tests/*.coffee'
  ],

  directConnect: true,

  capabilities: {
    'browserName': 'chrome'
  },

  baseUrl: 'http://localhost:3300',

  framework: 'jasmine',

  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  },
  onPrepare: function() {
    browser.driver.get('http://localhost:3300')
    browser.driver.findElement(By.id('importantbutton'))
    browser.driver.wait(function(){
      return browser.driver.getCurrentUrl().then(function(url){
        console.log('currentUrl:', url)
        return url
      });
    });
  }

}

