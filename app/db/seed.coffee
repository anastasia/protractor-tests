Org      = require "./models/organization"
mongoose = require "mongoose"
fibrous  = require "fibrous"
_        = require "underscore"

require "./goose"
orgs = [
    name: 'newsbound',
    owner_id: '1234',
    max_publish: 999999,
    stacks_published: 2,
  ,
    name: 'awesomeOrg',
    owner_id: '5678',
    max_publish: 3,
    stacks_published: 0,
  ,
    name: 'newOrg',
    owner_id: '9012',
    max_publish: 0,
    stacks_published: 0,
  ,
    name: 'oldOrg',
    owner_id: '3456',
    max_publish: 8,
    stacks_published: 8
]

# seedExplainers = fibrous ->
#   for _, explainer of explainers
#     stack = Stack.sync.findOneAndUpdate {slug: explainer.slug},
#       {upsert: true}
#     try
#       stack.sync.import()
#       console.log "Added/updated: #{stack.slug}"
#     catch e
#       console.log "Caught error: #{e}"

seedOrgs = fibrous ->
  Org.sync.remove({})
  for _, org of orgs
    console.log org
    # org = User.sync.register(new User({email:user.email}), user.password)
    # console.log 'added user: ',user.email

# connectHeroku = fibrous ->
#   mg = mongoose.sync.disconnect()
#   console.log "connecting to heroku: ",config.keys.DB_PRODUCTION
#   mongoose.connect(config.keys.DB_PRODUCTION)

# connectHerokuAcceptance = fibrous ->
#   mg = mongoose.sync.disconnect()
#   console.log "connecting to heroku acceptance: ",config.keys.DB_ACCEPTANCE
#   mongoose.connect(config.keys.DB_ACCEPTANCE)


console.log "seeding local database"
seedOrgs () -> console.log 'orgs seeded'
# seedExplainers(disconnect)


