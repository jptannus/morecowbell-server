class Database
  constructor: (@dbPlugin_)->
    @db_ = @dbPlugin_.db

  entries: ()->
    return @db_.collection "entries"

  newId: (id)->
    ObjectID = @dbPlugin_.ObjectID
    return new ObjectID id

module.exports = Database
