winston = require 'winston'

logger = new winston.Logger
  transports: [
   new winston.transports.File
      filename: "./log/#{process.env.NODE_ENV}.log",
      json: false,
      level: 'info'
  ],
  exitOnError: false

module.exports = logger
