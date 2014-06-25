# ZeroMQ example server for lazy pirate pattern
## Description

This is an example implementation of nodejs server, which runs over 0mq protocol using tcp, and can serve (very limited) weather information. This example is complement to ruby zmq client for lazy pirate pattern: https://github.com/eicca/zmq-ruby-pirate-client

This repo also contains a client, but only for test purposes. This is **not reliable** client, which can't handle timeouts and make retries.

## Requirements

* node.js 0.8 or higher
* [ZeroMQ](http://zeromq.org/) library

The ZeroMQ library must be installed on your system in a well-known location like /usr/local/lib. This is the default for new ZeroMQ installs.

## Environment Variables

*  `HOST`
    * The host of the server
    * Default: `0.0.0.0`
*  `PORT`
    * TCP port of the server
    * Default: `5567`

## Installation
Make sure the ZeroMQ library is already installed on your system. For mac you can install it easily with the brew:
```
brew install zeromq
```

Then clone the repo and install dependencies.

Finally, copy and modify (if needed) the template for `env.js`:
```
cp env.js.template env.js
```

## Start application

```
npm start
```

## Tests

```
npm test
```
