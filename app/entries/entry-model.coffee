Joi = require 'joi'

module.exports = Joi.object().keys(
  title: Joi.string().required()
  source: Joi.string().required()
).unknown true
