express       = require 'express'
fibrous       = require 'fibrous'
http          = require 'http'
exphbs        = require 'express3-handlebars'
Organization  = require './app/db/models/organization'

# route :
# serve index.handlebars page
# ogr

app = express()

app.configure ->
  app.use fibrous.middleware
  app.use express.bodyParser()
  app.engine 'handlebars', exphbs({layout: false})

  app.set 'view engine', 'handlebars'
  app.set 'views', __dirname + '/views'
  app.use express.logger('dev')

app.get '/', (req, res) ->
  console.log 'hello!'
  orgs = Organization.sync.find({}, null)
  res.render 'index', {orgs:orgs}

# express        = require 'express'
# exphbs         = require 'express3-handlebars'

# fibrous        = require 'fibrous'

# app    = express()
server = http.createServer(app)

#   app.use express.static(__dirname + '/app')

#   app.use app.router
#   app.use (err, req, res, next) ->
#     if err
#       res.json(500, {error:err})
#     else
#       next()

# app.get '/', (req, res) ->
#   console.log 'request', req.body
#   orgs = Organization.sync.find({}, null)

#   res.render 'index', {orgs: orgs}


server.listen 8000, ->
  console.log 'Server running at PORT 8000'
