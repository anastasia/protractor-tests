#!/usr/bin/env coffee
vm           = require 'vm'
repl         = require 'repl'
fibrous      = require 'fibrous'
CoffeeScript = require 'coffee-script'
mongoose     = require 'mongoose'


module.exports =
  start: ->
    require './globals'
    require '../app/db/goose.coffee'
    r = repl.start({
      prompt: "fibrous> ",
      eval: fibrous (code, context, file) ->
        code = CoffeeScript.compile(code, {filename: file, bare: true})
        return vm.runInContext(code, context, file)
    })
    r.on 'exit', ->
      mongoose.disconnect()
