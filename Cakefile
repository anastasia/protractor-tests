{spawn} = require "child_process"
repl = require './lib/repl'
mongoose = require 'mongoose'

MOCHA = './node_modules/.bin/mocha'
MOCHA_ENV =
  NODE_PATH: 'app'
  NODE_ENV: 'test'
MOCHA_ARGS = [
  '--reporter', 'list'
  '--compilers', 'coffee:coffee-script'
  '--require' , 'should'
  '--recursive'
  '--timeout', '10000'
  '--colors'
]

option '-a', '--all', 'Run all tests (defaults to exclude remote)'
option '-r', '--remote', 'Run remote tests'
option '-g', '--grep [MATCHER]', 'Run tests matching passed string (overrides remote options)'

REMOTE = ["--grep","remote tests"]
NO_REMOTE = REMOTE.concat "-i"

task 'test', 'run tests', (options) ->
  process.env[key] = value for key, value of MOCHA_ENV
  args = MOCHA_ARGS.concat ['spec']

  if options.grep
    args = args.concat("--grep", options.grep)
  else
    if options.remote
      args = args.concat(REMOTE)
    else if options.all
      args = args
    else
      args = args.concat(NO_REMOTE)


  mocha = spawn MOCHA, args, stdio: 'inherit'
  mocha.on 'close', (exitCode) ->
    process.exit(exitCode)

task 'console', 'run console', ->
  repl.start()


