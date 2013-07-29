form = require 'express-form'
field = form.field

module.exports = form(
  field('name')
    .required()

  field('username')
    .required()

  field('email')
    .required()
)
