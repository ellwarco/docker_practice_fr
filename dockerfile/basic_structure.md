## La structure de base

Dockerfile déclarations de la ligne de commande en ligne, et le soutien à `#` début de la ligne de commentaire.

En général, Dockerfile divisé en quatre parties: les informations d'image de base lorsque les informations de mainteneur,
mode d'emploi et un récipient pour commencer miroir exécuter des instructions.

Comme
```
# This dockerfile uses the ubuntu image
# VERSION 2 - EDITION 1
# Author: docker_user
# Command format: Instruction [arguments / command] ..

# Base image to use, this must be set as the first line
FROM ubuntu

# Maintainer: docker_user <docker_user at email.com> (@docker_user)
MAINTAINER docker_user docker_user@email.com

# Commands to update the image
RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Commands when creating a new container
CMD /usr/sbin/nginx
```
Parmi eux, un départ doit préciser le nom est basé sur le miroir, puis les informations des instructions du responsable recommandé.

Le dos est en miroir instructions exploitation, tels que `RUN` commande, `RUN` commande d'exécuter des commandes de suivi miroir.
Chaque exécuter un `RUN` commande, ajouter un nouveau miroir de la couche et soumettre.

Enfin, le `CMD` commande pour spécifier la commande à exécuter lorsque le conteneur.

Voici un exemple plus complexe
```
# Nginx
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER Victor Vieux <victor@docker.com>

RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server

# Firefox over VNC
#
# VERSION               0.3

FROM ubuntu

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir /.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'

EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]

# Multiple images example
#
# VERSION               0.1

FROM ubuntu
RUN echo foo > bar
# Will output something like ===> 907ad6c2736f

FROM ubuntu
RUN echo moo > oink
# Will output something like ===> 695d7793cbe4

# You᾿ll now have two images, 907ad6c2736f with /bar, and 695d7793cbe4 with
# /oink.
```
