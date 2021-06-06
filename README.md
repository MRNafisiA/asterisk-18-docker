# asterisk-18-docker

A Dockerfile and docker-compose to dockerize asterisk 18.04

## Build

put asterisk source file as directory named 'asterisk', next to the Dockerfile. run below command to build the image.

```angular2html
docker build -t YOUR_IMAGE_NAME:18.04 .
```

## Run

To run with docker-compose use below command.

```angular2html
docker-compose up -d
```

## Connect to Asterisk

use:

```angular2html
docker exec -it CONTAINER_NAME asterisk -rvvvvv
```

## Potential Bugs
* Interrupted sound or connection due to the dynamic assignment of RTP ports in VoIP systems
* Slow container creation for exposing wide range of ports.

## About Repo
It was just a 2 days hobby for me, but I’m interested in your problems and bugs. feel free to create issue.