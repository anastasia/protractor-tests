var Org, fibrous, mongoose, orgs, seedOrgs, _;

Org = require("./models/organization");

mongoose = require("mongoose");

fibrous = require("fibrous");

_ = require("underscore");

require("./goose");

orgs = [
  {
    name: 'newsbound',
    owner_id: '1234',
    max_publish: 999999,
    stacks_published: 2
  }, {
    name: 'awesomeOrg',
    owner_id: '5678',
    max_publish: 3,
    stacks_published: 0
  }, {
    name: 'newOrg',
    owner_id: '9012',
    max_publish: 0,
    stacks_published: 0
  }, {
    name: 'oldOrg',
    owner_id: '3456',
    max_publish: 8,
    stacks_published: 8
  }
];

seedOrgs = fibrous(function() {
  var org, _results;
  Org.sync.remove({});
  _results = [];
  for (_ in orgs) {
    org = orgs[_];
    _results.push(console.log(org));
  }
  return _results;
});

console.log("seeding local database");

seedOrgs(function() {
  return console.log('orgs seeded');
});

//# sourceMappingURL=seed.js.map
