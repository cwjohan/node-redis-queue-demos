node-redis-queue-demos
======================

Examples of how to use node-redis-queue.

##Install the source code

1. Run `git clone https://github.com/cwjohan/node-redis-queue-demos.git` to get a copy of the source code.
2. Run `npm install` to get the dependencies.

##Running the demos -- preliminary steps

1. Open two Git Bash console windows.
1. If redis-server is not already running, open an additional console window and run `redis-server` or `redis-server &` to start the Redis server in the background. The demos assume default login, no password.

##Running demo 01 -- Channel example

This demo shows how to send a series of URLs to a consumer process that computes an SHA1 value for each URL.

1. In the first console window Run `node worker01.js`. It will wait for some data to appear in the queue.
1. In the second console window, run `node provider01.js`, which will place four URLs in the queue. Shortly
   thereafter, the worker01 process will pick up the four URLs and display them, fetch a page body for each, and compute an SHA1 value for each.
1. Repeat step 2 a few times.
1. In the second console window, run `node provider01.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker01 process will stop.

##Running demo 02 -- Channel example

This demo shows how to send a series of URLs to a consumer process that computes an SHA1 value for each URL and returns the SHA1 result to the provider process.

1. In the first console window Run `node worker02.js`. It will wait for some data to appear in the queue.
1. In the second console window, run `node provider02.js 01`, which will place four URLs in the queue. Shortly
   thereafter, the worker02 process will pick up the four URLs, display them, fetch a page body for each, and compute an SHA1 value for each, and then return the SHA1 result to the provider02 instance, which will display the result.
1. Repeat step 2 a few times.
1. In the second console window, run `node provider02.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker02 process will stop.

##Running demo 03 -- WorkQueueMgr example

This demo shows how a worker can service multiple queues using WorkQueueMgr. The provider process, by default, sends three strings to one queue and three strings to the other.

1. In the first console window Run `node worker03.js`. It will wait for some data to appear in the queue.
1. In the second console window, run `node provider03.js`, which will place three strings in each queue. Shortly
   thereafter, the worker03 process will pick up the six strings from their respective queues and display them.
1. Repeat step 2 a few times.
1. In the second console window, run `node provider03.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker03 process will stop.

##Running demo 04 -- WorkQueueMgr example

This demo is almost the same as demo 02 but uses WorkQueueMgr rather than Channel. It shows how to send a series of URLs to a consumer process that computes an SHA1 value for each URL and returns the SHA1 result to the provider process.

1. In the first console window Run `node worker04.js`. It will wait for some data to appear in the queue.
1. In the second console window, run `node provider04.js 01`, which will place four URLs in the queue. Shortly
   thereafter, the worker04 process will pick up the four URLs, display them, fetch a page body for each, and compute an SHA1 value for each, and then return the SHA1 result to the provider04 instance, which will display the result.
1. Repeat step 2 a few times.
1. In the second console window, run `node provider04.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker04 process will stop.

To check out the arity feature, try the above again using `node worker04.js 3` in step 1. Observe that the worker will process three input requests in parallel and that the results may become available in a different order than the input requests.

To check out the timeout feature, try the above yet again using `node worker04.js 1 1`. Observe the timeout messages emitted
about once every second.

##Running Coffee

If you make any changes to the .coffee source code, you will want to
convert the .coffee files into .js files. To do so, run:
```
npm run coffee
```
