Boom = require "boom"

getEntries = (request, reply) ->
  db = request.server.plugins['hapi-mongodb'].db
  ObjectID = request.server.plugins['hapi-mongodb'].ObjectID

  db.collection('entries').find().toArray (err, result)->
    if err
      console.log "Mongo error", err
      return reply(Boom.internal('Internal MongoDB error', err))
    reply(result)

module.exports =
  method: "GET",
  path:"/entries",
  handler: getEntries
