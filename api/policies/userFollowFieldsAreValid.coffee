form = require 'express-form'
field = form.field

module.exports = form(
  field('idCause')
    .isInt()
)
