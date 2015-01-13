mongoose      = require 'mongoose'
Organization  = require './app/db/models/organization'
express       = require 'express'
fibrous       = require 'fibrous'
http          = require 'http'

app           = express()

server = http.createServer(app)
app.use express.static(__dirname + '/app')

server.listen 8000, ->
  console.log 'Server running at PORT 8000'

app.get '/', (req, res) ->

  orgsObj = Organization.sync.find {}, (err, orgs) ->
    orgMap = {}

    orgs.forEach (org) ->
      orgMap[org.name] = org
    return orgMap

  res.render 'index.html', {orgs: orgsObj}