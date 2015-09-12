class Logger
  constructor: (@name)->

  checkDigit: (value)->
    return if value >= 10 then value else "0" + value

  buildDate: ()->
    now = new Date()
    hours = @checkDigit now.getHours()
    minutes = @checkDigit now.getMinutes()
    seconds = @checkDigit now.getSeconds()
    time = "#{hours}:#{minutes}:#{seconds}"
    day = @checkDigit now.getDate()
    month = @checkDigit now.getMonth() + 1
    year = now.getFullYear()
    date = "#{day}/#{month}/#{year}"
    return "[#{time} #{date}]"

  buildArguments: (list)->
    arg = ["#{@buildDate()} - [#{@name}]:"]
    for argument in list
      arg.push argument
    return arg

  debug: ()->
    console.log.apply null, @buildArguments arguments

  error: ()->
    console.error.apply null, @buildArguments arguments

module.exports = Logger
