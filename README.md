Docker Image for Redis 2.8.14
=============================

What does this Docker image contains?
-------------------------------------
This Docker image contains a Redis 2.8.14 server compiled from source and
designed to use with data persistence in the host.

Usage Pattern
-------------
Build the image directly from GitHub (this can take a while):

    docker build -t="geographica/postgresql-9.1.2-postgis-1.5.8"
	https://github.com/GeographicaGS/Docker-PostgreSQL-9.1.2-PostGIS-1.5.8.git

or pull it from Docker Hub:

    docker pull geographica/postgresql-9.1.2-postgis-1.5.8

Create a folder in the host to contain the data storage. We like to persist the
data storage in the host and not in the container:

    mkdir /whatever/redis-2.8.14

Copy the desired Redis __.conf__ file to the folder with the mandatory name
__redis.conf__, keeping in mind that the __dir__ directive should point to
__/data__, the mount point in the container for the data storage. To start the
container:

    docker run -t -i -p 6379:6379 -v /whatever/redis-2.8.14/:/data/
    geographica/redis:2.8.14

In this case, the container will retain control of the console, and, when exited
with __Ctrl-C__, will perform a clean shutdown of the database. The host can
check the Redis log on the host data storage.

Also we can access it in interactive mode:

    docker run -t -i -p 6379:6379 -v /whatever/redis-2.8.14/:/data/
    geographica/redis:2.8.14 /bin/bash

where we can start the server with:

    redis-server /data/redis.conf

and inspect the database with __redis_cli__.

