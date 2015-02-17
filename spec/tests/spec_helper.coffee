process.env.PORT = process.env.PORT || 8000
process.env.NODE_PATH = '../../app'

http     = require 'http'
mongoose = require 'mongoose'
fibrous  = require 'fibrous'

require 'jasmine-only'
require 'fibrous/lib/jasmine_spec_helper'

# server = {}
db = {}

befores = []
beforeAll = (before) ->
  befores.push before

afters = []
afterAll = (after) ->
  afters.push after

# Use Jasime reporter to implement once-per entire suite setup and teardown
jasmine.getEnv().addReporter {
  reportRunnerStarting: (runner) ->
    befores.forEach (before) -> before()
  reportRunnerResults: (runner) ->
    afters.forEach (after) -> after()
}

global.beforeAll = beforeAll
global.afterAll = afterAll

beforeAll ->
  console.log 'beforeAll, before get'
  MONGO_URL = 'mongodb://localhost/protractor_app'
  mongoose.connect MONGO_URL unless mongoose.connection.db
  db = mongoose.connection

process.on 'uncaughtException', (err) ->
  console.error 'uncaughtException'
  console.error err.message
  console.error err.orgStatusMessage
  browser.end (err, res) ->
    process.exit(1)

