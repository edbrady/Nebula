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
sudo docker run -it --rm -v "$PWD":/usr/src/app -p 3000:3000 nebula rails generate model Library

```
