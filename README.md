node-redis-queue-demos
======================

Examples of how to use node-redis-queue.

##Install the source code

1. Run `git clone https://github.com/cwjohan/node-redis-queue-demos.git` to get a copy of the source code.
2. Run `npm install` to get the dependencies.

##Run the demo 01 code

1. Open three Git Bash console windows.
2. In the first console window, if redis-server is not already running, then run `redis-server &` to run it
in the background.
3. In a second console window, run `node worker01.js`. It will wait for some data to appear in the queue.
4. In the third console window, run `node provider01.js`, which will place four URLs in the queue. Shortly
   thereafter, the worker01 process will pick up the four items and display them.
5. Repeat step 4.
6. In the third console window, run `node provider01.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker01 process will stop.

Note that, when running worker01, one optionally may use a 'mem' and verbose parameters to monitor memory usage.
For example:

`node worker01.js mem verbose | grep '>>>' | tee memusage.out`

##Run the demo 02 code

1. Open three Git Bash console windows.
2. In the first console window, if redis-server is not already running, then run `redis-server &` to run it
in the background.
3. In a second console window, run `node worker02.js`. It will wait for some data to appear in the queue.
4. In the third console window, run `node provider02.js 01 clear`, which will clear the URL and result queues and
place four items in the URL queue. Shortly thereafter, the worker02 process will pick up the four items, display them,
compute an SHA1 value for each one and return it and the SHA1 value in the result queue to be consumed by provider02.
5. Repeat `node provider02 01' a few times.
6. In the third console window, run `node provider01.js stop`, which will put a stop command in the URL queue. Shortly
   thereafter, the worker01 process will stop.

Note that, when running worker02, one optionally may use a 'mem' and verbose parameters to monitor memory usage.
For example:

`node worker01.js mem verbose | grep '>>>' | tee memusage.out`

##Run the demo 03 and demo 04 code

These are run in a similar manner to the above examples. See the source code comments in each for more detailed
instructions. Also, be sure to try out multiple providers and workers running in different console windows.
Using mulitple worker instances results in better performance.

##Running Coffee

If you make any changes to the .coffee source code, you will want to
convert the .coffee files into .js files. To do so, run:
```
npm run-script coffee
```
