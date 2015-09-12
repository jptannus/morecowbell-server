Hapi = require "hapi"
Q = require "q"

Server = new (require "./server")
  host: "localhost"
  port: 8000

# MongoDB
Server.registerPlugin
  register: require("hapi-mongodb")
  options:
    "url": "mongodb://localhost:27017/morecowbell"
    "settings":
      "db":
        "native_parser": false

###
  Routes registry
###
Server.registerRoute require "./entries/entries-endpoint.coffee"

###
  Server start
###
Server.start()
