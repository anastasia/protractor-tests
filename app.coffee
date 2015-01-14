Organization   = require './app/db/models/organization'
express        = require 'express'
exphbs         = require 'express3-handlebars'

errorHandler   = require 'error-handler'

http           = require 'http'
fibrous        = require 'fibrous'

app = module.exports = express()

server = http.createServer(app)


app.get '/', (req, res) ->
  # orgs = Organization.sync.find({}, null)

  Organization.find( {}, (err, orgs) ->
    orgMap = {}

    orgs.forEach (org) ->
      orgMap[org.name] = org
    console.log 'orgMap?',orgMap
    # return orgMap
  )
  res.render 'index'
# app.use express.bodyParser()
app.configure ->
  app.engine 'handlebars', exphbs({
    defaultLayout: 'main',
    layoutsDir:  __dirname + '/views'})

  app.set 'view engine', 'handlebars'
  app.set 'views', __dirname + '/views'

  app.use fibrous.middleware
  app.use express.static(__dirname + '/app')

server.listen 8000, ->
  console.log 'Server running at PORT 8000'
