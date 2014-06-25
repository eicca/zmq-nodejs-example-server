zmq = require 'zmq'

class WeatherClient

  requester = zmq.socket('req')
  responses = []

  constructor: (address) ->
    requester.connect(address)

  requester.on 'message', (msg) ->
    callback = responses.shift()
    callback.apply(this, arguments)

  performRequest = (req, callback) ->
    responses.push(callback)
    requester.send(req)

  getWeatherData: (location, callback) ->
    performRequest location, (msg) ->
      data = JSON.parse(msg.toString())
      if data?.error
        callback(null, data.error)
      else
        callback(data, null)

module.exports = WeatherClient
