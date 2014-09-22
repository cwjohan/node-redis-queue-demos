'use strict'
SHA1 = require('./lib/tinySHA1.r4.js').SHA1
request = require 'request'
redis = require 'redis'
RedisQueue = require 'node-redis-queue'
redisPort = 6379
redisHost = '127.0.0.1'
redisQueueName = 'urlq'
redisQueueTimeout = 1
redisClient = null
myQueue = null

redisClient = redis.createClient redisPort, redisHost
myQueue = new RedisQueue redisClient, redisQueueTimeout

myQueue.on 'end', () ->
  console.log 'worker01 detected Redis connection ended'
  process.exit()

myQueue.on 'error', (error) ->
  console.log 'worker01 stopping due to: ' + error
  process.exit()

myQueue.on 'timeout', ->
  console.log 'worker01 timeout'

myQueue.on 'message', (queueName, url) ->
  console.log 'worker01 processing URL "' + url + '"'
  if url is '***stop***'
    console.log 'worker01 stopping'
    process.exit()
  request url, (error, response, body) ->
    if not error and response.statusCode is 200
      console.log url + ' SHA1 = ' + SHA1 body
    else
      console.log error

myQueue.monitor redisQueueName

