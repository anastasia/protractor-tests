mongoose  = require 'mongoose'
Schema    = mongoose.Schema
OrganizationSchema = new Schema({
  name:
    type: String
    default: ''
  owner_id:
    type: String
    default: ''
  max_publish:
    type: Number
    default: 0
  stacks_published:
    type: Number
    default: 0
  })

module.exports = mongoose.model('Organization', OrganizationSchema)