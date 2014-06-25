expect    = require 'expect.js'
supertest = require 'supertest'
_         = require 'underscore'

Server    = require '../weather_server'
Client    = require '../weather_client'

server = new Server 'tcp://0.0.0.0:5566'
client = new Client 'tcp://0.0.0.0:5566'

describe 'single query tests', ->

  it 'responds with json for known location', (done) ->
    client.getWeatherData 'Berlin', (data) ->
      expect(data).to.be.an('object')
      expect(data.body).to.be('sunny')
      done()

  it 'responds with error message for unknown location', (done) ->
    client.getWeatherData 'abcd', (data, error) ->
      expect(data).to.be(null)
      expect(error).to.contain('unknown')
      done()

describe 'load test', ->

  it 'handles big amount of connected clients', (done) ->

    respCounter = 0
    total = 50

    _(total).times ->
      client = new Client 'tcp://0.0.0.0:5566'
      client.getWeatherData 'invalid location', ->
      client.getWeatherData 'Berlin', (data, error) ->
        expect(error).to.be(null)
        respCounter += 1
        done() if respCounter == total
