express       = require 'express'
fibrous       = require 'fibrous'
http          = require 'http'
exphbs        = require 'express3-handlebars'
Organization  = require './app/db/models/organization'

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3300
  app.use express.static(__dirname + '/app')
  app.use fibrous.middleware
  app.use express.bodyParser()
  app.engine 'handlebars', exphbs({layout: false})

  app.set 'view engine', 'handlebars'
  app.set 'views', __dirname + '/views'
  app.use (err, req, res, next) ->
    if err
      res.json(500, {error:err})
    else
      next()

app.get '/', (req, res) ->
  console.log 'hello!'
  orgs = Organization.sync.find({}, null)
  res.render 'index', {orgs:JSON.stringify(orgs)}

# server = http.createServer(app)
# TODO: error out if not connected to db

http.createServer(app).listen app.get('port'), ->
  console.log "listening on port", app.get('port')

