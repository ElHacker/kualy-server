form = require 'express-form'
field = form.field

module.exports = form(
  field('name')
    .trim()
    .required()
    .notEmpty()
    .maxLength(20)
    .is(/[\w\s]+/)

  field('username')
    .trim()
    .required()
    .notEmpty()
    .maxLength(15)

  field('bio')
    .trim()
    .notEmpty()
    .maxLength(200)

  field('email')
    .trim()
    .required()
    .notEmpty()
    .isEmail()
)
