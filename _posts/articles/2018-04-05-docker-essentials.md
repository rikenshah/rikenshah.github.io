---
layout: post
title: Docker Essentials
excerpt: "Introduction to containers with Docker"
categories: articles
tags: [docker,linux]
author: riken_shah
comments: true
share: true
modified: 2018-04-05T14:18:57-04:00
published: true
---

### Introduction

- Containers are a group of processes that run in isolation.
- Use shared kernel but isolated _namespaces_. `cgroups` are the ones which control the memory allocation etc.
- VM runs on hypervisor, it operates full blown OS, hence very sluggish.
- Containers are much more lightweight and hence fast to start. Hence we get benefits of VM without the disadvantages.
- Container can be run on top of existing VMs.
- `namespaces` and `cgroups` have been here for 10 years. But became the popular technology only with docker.
- Docker enables *build once, deploy anywhere*, removes *works on my machine* problem. 
- Better resource utilization, many containers on one VM.
- Standard interface to operations interface.
- Ecosystem and tooling for docker (like container orchestration).

### Commands and Explanations

- `docker container run -t ubuntu top`, start a docker container with latest ubuntu image. 
	- `-t` flag is for pseudo TTY, required for `top` to run correctly.
- Running `top` actually only sees the local namespace.
- `docker run` command will first result in a `docker pull` command to download the ubuntu image on local machine. Once it is downloaded the container will be started.
- `docker container exec` is a way to *enter* the running container's namespace with a new process.
- `docker container ls` gives all the information (including container id) about running containers.
- `docker container exec -it <ID> bash` will enable us *enter* the containers namespace with `bash` process.

### Multiple containers

- The Docker Store is the public central registry for Docker images. Anyone can share images here publicly. The Docker Store contains community and official images that can also be found directly on the Docker Hub.
- *Certified* images are enterprise ready. *Store* images are verified and scanned for security vulnerabilities. You should be agnostic of *Community* images.
- `docker container run --detach --publish 8080:80 --name nginx nginx`. 
	- The --detach flag will run this container in the background. The publish flag publishes port 80 in the container (the default port for nginx), using port 8080 on our host.
	- The container otherwise has its own network stack separate from host.
	- See documentation of verified images to have more information about particular images.
	- `--name` will assign a custom name, else docker will give a random name. Name can be used instead of `id` in further steps.
	- If it is the first time you are running the nginx container, it will pull down the nginx image from the Docker Store. Subsequent containers created from the Nginx image will use the existing image located on your host.
- Similarly you can run multiple containers with such commands and then see all the information using `docker container ls` command.
- While running images directly from the Docker Store can be useful at times, it is more useful to create custom images, and refer to official images as the starting point for these images.
- `docker container stop [container id/name]` can be used to stop containers. A list of `ids/names` can be provided to stop multiple containers at once.
- `docker system prune` is a really handy command to clean up your system. It will remove any stopped containers, unused volumes and networks, and dangling images.

### Creating custom images

- Supposing we are deploying a flask app (`app.py`).
- A sample `Dockerfile`.
```
FROM python:3.6.1-alpine
RUN pip install flask
CMD ["python","app.py"]
COPY app.py /app.py
```
- First line specifies the starting point for `Dockerfile`.  Every Dockerfile must start with a FROM line that is the starting image to build your layers on top of.
- If no tag (`3.6.1`) is specified, it will take the latest version.
- `alpine` is an ultra light weight linux distro.
- Preferably use *docker hub* or non-community *docker store* images for base images since they are verified and safe to use.
- Use official image that closely matches your needs.
- The RUN command executes commands needed to set up your image for your application, such as installing packages, editing files, or changing file permissions. In this case we are installing flask. The RUN commands are executed at build time, and are added to the layers of your image.
- CMD is the command that is executed when you start a container. Here we are using CMD to run our python app.
- There can be only one CMD per Dockerfile. If you specify more thane one CMD, then the last CMD will take effect. Hence CMD of parent is overriden.
- Last line, his copies the app.py in the local directory (where you will run `docker image build`) into a new layer of the image. This instruction is the last line in the Dockerfile.
- Layers that change frequently, such as copying source code into the image, should be placed near the bottom of the file to take full advantage of the Docker layer cache. This allows us to avoid rebuilding layers that could otherwise be cached.
- For instance, if there was a change in the FROM instruction, it would invalidate the cache for all subsequent layers of this image.
- Although we have speicified CMD above the file copy command, still CMD runs only when the container starts and not when it builds.
- See [full list](https://docs.docker.com/engine/reference/builder/) of commands for `Dockerfile`.
- Build image using `docker image build -t python-hello-world .` Then do `docker image ls` to see that image shows up in the list. The base iamge will also be in the list.
- Now can be run using `docker run -p 5001:5000 -d python-hello-world`. 
- If you want to see logs from your application you can use the `docker container logs [container id/name]` command. By default, `docker container logs` prints out what is sent to standard out by your application. 
- The `Dockerfile` is how you create reproducible builds for your application. A common workflow is to have your CI/CD automation run `docker image build` as part of its build process. Once images are built, they will be sent to a central registry, where they can be accessed by all environments (such as a test environment) that need to run instances of that application.

### Pushing to central registry

- Docker hub is a free service to publicly store available images, or you can pay to store private images.
- `docker login` to login to the remote docker registry.
- The Docker Hub naming convention is to tag your image with [dockerhub username]/[image name]. `docker tag python-hello-world [dockerhub username]/python-hello-world`.
- Once you have a properly tagged image, use the `docker push [username]/[imagename]` command to push your image to the Docker Hub registry. 
- Anyone can now do `docker pull` to deploy your image to other environments.
- To deploy a change in the file, we need rebuild the image (after the change done in local file), then push it to the registry.
- Notice “Using cache” for Steps 1-3. These layers of the Docker image have already been built, and `docker image build` will use these layers from the cache, instead of rebuilding them.
- There is a caching mechanism in place for pushing layers too. Docker Hub already has all but one of the layers from an earlier push, so it only pushes the one layer that has changed.
- Hence it is important to optimize the `Dockefile` with most changeable layers on top (actually at bottom of `Dockerfile`).

##### Some technical details of layers

- One of the major design properties of Docker is its use of the union file system.
- Consider the Dockerfile that you created before:
```
FROM python:3.6.1-alpine
RUN pip install flask
CMD ["python","app.py"]
COPY app.py /app.py
```
- Each of these lines is a layer. Each layer contains only the delta, or changes from the layers before it. To put these layers together into a single running container, Docker makes use of the union file system to overlay layers transparently into a single view.
- Each layer of the image is read-only, except for the very top layer which is created for the container. The read/write container layer implements “copy-on-write” which means that files that are stored in lower image layers are pulled up to the read/write container layer only when edits are being made to those files. Those changes are then stored in the container layer. The “copy-on-write” function is very fast, and in almost all cases, does not have a noticeable effect on performance. You can inspect which files have been pulled up to the container level with the `docker diff` command.
- Since image layers are read-only, they can be shared by images and by running containers. For instance, creating a new python app with its own Dockerfile with similar base layers, would share all the layers that it had in common with the first python app.
- You can also experience the sharing of layers when you start multiple containers from the same image. Since the containers use the same read-only layers, you can imagine that starting up containers is very fast and has a very low footprint on the host.
- You may notice that there are duplicate lines in this Dockerfile and the Dockerfile you created earlier in this lab. Although this is a very trivial example, you can pull common lines of both Dockerfiles into a “base” Dockerfile, that you can then point to with each of your child Dockerfiles using the FROM command.
- Image layering enables the docker caching mechanism for builds and pushes. For example, the output for your last `docker push` shows that some of the layers of your image already exists on the Docker Hub.
- Remember to clean up the system using `docker system prune`.

### Orchestration

- Features of container orchestration
	- Cluster management
	- Scheduling
	- Service Discovery
	- Replication
	- Health Management
	- Declared desired state
		- Active reconcilation
- Examples
	- Docker swarm
	- Kubernetes
	- Mesos
- Also some hosted solutions
	- IBM cloud container service
	- Amazon ECS
	- Azure containers
	- Google containers
- The Docker Swarm schedules services using a declarative language. You declare the state, and the swarm attempts to maintain and reconcile to make sure the actual state equals the desired state.
- Docker Swarm is composed of manager and worker nodes. Only managers can maintain the state of the swarm and accept commands to modify it. Workers have high scalability and are only used to run containers. By default, managers can run containers as well.
- The routing mesh built into swarm means that any port that is published at the service level will be exposed on every node in the swarm. Requests to a published service port will be automatically routed to a container of the service that is running in the swarm.
- Managers implement the raft consensus algorithm, which requires that more than 50% of the nodes agree on the state that is being stored for the cluster. If you don’t achieve more than 50%, the swarm will cease to operate correctly.
- While you typically want to limit the number of manager nodes to no more than seven, you can scale the number of worker nodes much higher than that. Worker nodes can scale up into the 1000s of nodes. Worker nodes communicate using the gossip protocol, which is optimized to be highly performant under large traffic and a large number of nodes.

### References

1. [Docker Essentials](https://developer.ibm.com/courses/all/docker-essentials-extend-your-apps-with-containers/)





