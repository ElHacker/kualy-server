form = require 'express-form'
field = form.field

module.exports = form(
  field('name')
    .trim()
    .notEmpty()
    .maxLength(20)
    .is(/[\w\s]+/)

  field('username')
    .trim()
    .notEmpty()
    .maxLength(15)

  field('bio')
    .trim()
    .notEmpty()
    .maxLength(200)

  field('email')
    .trim()
    .isEmail()
)
