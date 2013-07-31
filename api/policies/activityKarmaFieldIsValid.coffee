form = require 'express-form'
field = form.field

module.exports = form(
  field('userId')
    .isInt()
)
