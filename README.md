### Get Docker

Step through the getting started guide to install docker (note that you'll need docker toolbox if you don't have windows 10) here:

https://docs.docker.com/engine/getstarted/

This guide will also walk you through some basic docker commands and have you run a hello world docker image.

### Building and using this image
Pull this repo. Run docker build to create the image.  This will take a few minutes to complete.  `-t` tells docker to give the finished image a name for ease of use.

```
docker build -t ansible-dev .
```

You should now have an image called 'ansible-dev' that you can work with.  Verify this with `docker images`:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ansible-dev         latest              68dd3ba11803        9 seconds ago       472.1 MB
```

This image will now be a basic environment that you can launch whenever you want to run ansible.

```
docker run --rm -it -v `pwd`:/working ansible-dev
```
Now go into your working directory and you're all set.

The /working directory is a mount inside of the docker container of the directory from which the container was started.
