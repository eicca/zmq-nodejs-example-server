zmq     = require 'zmq'

class WeatherServer

  weatherData = { Berlin: 'sunny', Moscow: 'cloudy' }

  responder = zmq.socket('rep')

  constructor: (address) ->
    responder.bind address

  weatherFor = (location) ->
    data = weatherData[location]
    if data
      body: data, status: 'ok'
    else
      error: 'unknown location', status: 'err'

  responder.on 'message', (msg) ->
    location = msg.toString()
    responder.send(JSON.stringify(weatherFor(location)))

module.exports = WeatherServer
