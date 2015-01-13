mongoose = require 'mongoose'

MONGO_URL = 'mongodb://localhost/organizations'

unless mongoose.connection.db
  mongoose.connect(MONGO_URL)
