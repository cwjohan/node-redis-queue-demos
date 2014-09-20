node-redis-queue-demos
======================

Examples of how to use node-redis-queue.

##Install the source code

1. Run `git clone https://github.com/cwjohan/node-redis-queue-demos.git` to get a copy of the source code.
2. Run `npm install` to get the dependencies.

##Run the demo 01 code

1. Open two Git Bash console windows.
2. In one of the console windows, run `redis-server &` to start the Redis server in the background.
3. Run `node lib/work01.js` in the first console window. It will wait for some data to appear in the queue.
4. In the second console window, run `node lib/provider01.js`, which will place two items in the queue. Shortly
   thereafter, the worker01 process will pick up the two items and display them.
5. Repeat step 4.
6. In the second console window, run `node lib/provider01.js stop`, which will put a stop command in the queue. Shortly
   thereafter, the worker01 process will stop.

Note that, when running worker01, one optionally may use a 'mem' parameter to monitor memory usage. For example:

`node worker01.js mem | grep '>>>' | tee memusage.out`

##Running Coffee

If you make any changes to the source code, you will want to
convert the .coffee files into .js files. To do so, run:
```
npm run-script coffee
```
