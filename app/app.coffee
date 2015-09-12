Hapi = require "hapi"
Q = require "q"
logger = new (require "./logger") "App"
Config = require "./config.json"

# Create server
Server = new (require "./server") Config.server

# MongoDB
Server.registerPlugin
  register: require "hapi-mongodb"
  options: Config.mongodb

# Good
Server.registerPlugin
  register: require "good"
  options: Config.good

# Routes registry
Server.registerRoute require "./entries/entries-endpoint.coffee"

# Server start
Server.start()
