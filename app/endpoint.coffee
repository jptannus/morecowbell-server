Database = require "./database"

class Endpoint
  sendResponse: (request, reply, err, result)->
    if err
      # Boom handles the logging of the error
      return reply(Boom.internal('Internal server error', err))
    reply(result)

  responseCallback: (request, reply)=>
    return (err, result)=>
      @sendResponse request, reply, err, result

  getHandler: (handler)->
    return (request, reply)->
      db = new Database request.server.plugins['hapi-mongodb']
      handler request, reply, db

module.exports = Endpoint
