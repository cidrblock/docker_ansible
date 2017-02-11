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

```
➜  docker run --rm -it -v `pwd`:/working ansible-dev

running egg_info
creating lib/ansible.egg-info
writing requirements to lib/ansible.egg-info/requires.txt
writing lib/ansible.egg-info/PKG-INFO
writing top-level names to lib/ansible.egg-info/top_level.txt
writing dependency_links to lib/ansible.egg-info/dependency_links.txt
writing manifest file 'lib/ansible.egg-info/SOURCES.txt'
reading manifest file 'lib/ansible.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
no previously-included directories found matching 'v2'
no previously-included directories found matching 'docsite'
no previously-included directories found matching 'ticket_stubs'
no previously-included directories found matching 'packaging'
no previously-included directories found matching 'test'
no previously-included directories found matching 'hacking'
no previously-included directories found matching 'lib/ansible/modules/core/.git'
no previously-included directories found matching 'lib/ansible/modules/extras/.git'
writing manifest file 'lib/ansible.egg-info/SOURCES.txt'

Setting up Ansible to run out of checkout...

PATH=/ansible/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PYTHONPATH=/ansible/lib:
MANPATH=/ansible/docs/man:

Remember, you may wish to specify your host file with -i

Done!

➜  / ansible --version
ansible 2.2.1.0 (stable-2.2 04b2e1fbc0) last updated 2017/01/28 14:49:16 (GMT +000)
  lib/ansible/modules/core: (detached HEAD 59c9a6d3c2) last updated 2017/01/28 14:50:59 (GMT +000)
  lib/ansible/modules/extras: (detached HEAD c501e006ea) last updated 2017/01/28 14:51:00 (GMT +000)
  config file = /root/.ansible.cfg
  configured module search path = ['/modules/', '/vendor/f5-ansible/library']
```
