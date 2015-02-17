var CoffeeScript, fibrous, mongoose, repl, vm;

vm = require('vm');

repl = require('repl');

fibrous = require('fibrous');

CoffeeScript = require('coffee-script');

mongoose = require('mongoose');

module.exports = {
  start: function() {
    var r;
    require('./globals');
    require('../app/db/goose.coffee');
    r = repl.start({
      prompt: "fibrous> ",
      "eval": fibrous(function(code, context, file) {
        code = CoffeeScript.compile(code, {
          filename: file,
          bare: true
        });
        return vm.runInContext(code, context, file);
      })
    });
    return r.on('exit', function() {
      return mongoose.disconnect();
    });
  }
};

//# sourceMappingURL=repl.js.map
