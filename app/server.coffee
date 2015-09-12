Hapi = require 'hapi'
Q = require 'q'
logger = new (require "./logger") "Server"

class Server
  constructor: (@config_)->
    @server_ = new Hapi.Server()
    @server_.connection @config_
    @pluginPromises_ = []
    @started_ = false

  registerPlugin: (options)->
    deferred = Q.defer()
    if @started_
      deferred.reject "Server already starded"
      return deferred.promise
    @pluginPromises_.push deferred.promise
    @server_.register options, (err) ->
      if err
        logger.error err
        return deferred.reject err
      deferred.resolve()
    return deferred.promise

  registerRoute: (options)->
    @server_.route options if not @started_

  start: (options)->
    if not @started_
      Q.all(@pluginPromises_)
      .then =>
        @server_.start () =>
          logger.debug 'Server running at:', @server_.info.uri
      .catch (err) ->
        logger.error "Could not start server: ", err

module.exports = Server
