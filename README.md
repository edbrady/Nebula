# Nebula

## Purpose
This is a very basic Ruby on Rails video library app with authentication mechanisms.


## Docker
Once [Docker is installed](http://docs.docker.com/v1.8/installation/), you can run this app by building the image and 
then running it in a container.

```
docker build -t nebula
docker run -it --rm -p 3000:3000 nebula
```

Note: if you are running Ubuntu you will likely need to use 'sudo' to run docker commands.

You can mount the local app folder into the container when you launch it with:


```
docker run -it --rm -v "$PWD":/usr/src/app -p 3000:3000 nebula
```

You can run commands in the container:


```
docker run -it --rm -p 3000:3000 nebula bundle exec rake db:migrate
docker run -it --rm -v "$PWD":/usr/src/app -p 3000:3000 nebula rails generate model Library

```


## Getting Started
You can use the following commands to get this app up and running. This guide assumes you are using a Linux based host. If you are running Docker on Ubuntu, you may need to use 'sudo' for all docker commands. Replace '/my/video/folder' with the location of your videos.

```
git clone git@github.com:edbrady/Nebula.git
cd Nebula
docker build -t nebula .
docker run -it nebula bundle exec rake db:migrate
docker run -it -v /my/video/folder:/usr/src/app:ro nebula bundle exec rake library:import
docker run -d --name nebula -v /my/video/folder:/usr/src/app/assets/videos:ro -p 3000:3000 nebula
```
Now you can go to http://localhost:3000/ and you will be prompted with a login page. Click the link to create a new account, and then start browsing your library.


## Dependencies
This app currently has a couple dependencies that tie it to a *nix based OS. It is highly recommended that the app be run inside of a Docker container. If you run it outside of Docker you will need the following packages (standard on any Linux platform)
- file
- cut
