form = require 'express-form'
field = form.field

module.exports = form(  # Form filter and validation middleware
  field('body')
    .trim()
    .required()
    .notEmpty()
    .maxLength(280)
    .is(/[a-z#@]+/i, "Formatting error")

  field('author')
    .required()
    .isInt()

  field('supportsCause')
    .required()
    .isInt()

  field('location')
    .trim()
    .is(/[\w\s]+/)

  field('mediaURL')
    .trim()
    .isUrl()

  field('mentions')
    .array()
    .isInt()

  field('repliesTo')
    .array()
    .isInt()
)
