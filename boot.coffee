require './env'

# Setup the default node env.
process.env.NODE_ENV ?= 'development'

logger        = require './logger'
WeatherServer = require './weather_server'

host          = process.env.HOST || '0.0.0.0'
port          = process.env.PORT || 5567

address = "tcp://#{host}:#{port}"

logger.info 'Starting the server...'
app = new WeatherServer(address)
logger.info "Server is started. Listening on address: #{address}."
