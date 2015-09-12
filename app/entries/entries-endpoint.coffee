Boom = require "boom"
Joi = require "joi"
Endpoint = require "../endpoint"
logger = new (require "../logger") "EntriesEndpoint"

class EntriesEndpoint extends Endpoint
  getEntries: (request, reply, db)=>
    logger.debug "getEntries"
    db.entries().find().toArray @responseCallback(request, reply)

  createEntry: (request, reply, db)=>
    logger.debug "createEntry"
    db.entries().insert
      title: request.payload.title
      source: request.payload.source
    , @responseCallback(request, reply)

  deleteEntry: (request, reply, db)=>
    logger.debug "deleteEntry"
    db.entries().remove { "_id" : db.newId(request.params.entryId) },
      @responseCallback(request, reply)

  getRoutes: ()->
    return [
      method: "GET",
      path:"/entries",
      handler: @getHandler @getEntries
    ,
      method: "POST",
      path:"/entries",
      handler: @getHandler @createEntry
      config:
        validate:
          payload: require "./entry-model"
    ,
      method: "DELETE",
      path:"/entries/{entryId}",
      handler: @getHandler @deleteEntry
      config:
        validate:
          params:
            entryId: Joi.string().required()
    ]

module.exports = (new EntriesEndpoint()).getRoutes()
