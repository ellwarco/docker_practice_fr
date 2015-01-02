## Utilisez superviseur pour gérer le processus

Docker récipient ouvert en un seul processus est lancé, par exemple, les services d'un démon SSH ou Apache.
Cependant, nous avons souvent besoin d'ouvrir de multiples services sur une seule machine, ce qui peut avoir de nombreuses façons,
le plus simple est de mettre plus d'une commande de démarrage à un script de démarrage qui, lorsqu'il est activé directement lancer le script,
l'autre est les outils de gestion de processus d'installation.

Cette section va utiliser les outils de gestion des processus pour gérer superviseur de conteneurs multiples processus.
Superviseur peut mieux contrôler l'utilisation, la gestion et redémarrer le processus que nous voulons exécuter.
Ici, nous vous montrons comment utiliser les services de ssh et apache.

## Configuration

D'abord créer un Dockerfile, le contenu et l'interprétation de chaque pièce est la suivante.
```
FROM ubuntu:13.04
MAINTAINER examples@docker.com
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
```

### superviseur d'installation

Installez ssh, apache et le superviseur.
```
RUN apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
```

Voici installer le logiciel 3, également créé deux services d'annuaire de ssh et le superviseur besoin.
```
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
```
Ajouter un fichier de configuration supervisord et copiez le fichier de configuration dans le répertoire correspondant.
```
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
```
这里我们映射了 22 和 80 端口，使用 supervisord 的可执行路径启动服务。


### superviseur contenu du profil
```
[supervisord]
nodaemon=true
[program:sshd]
command=/usr/sbin/sshd -D

[program:apache2]
command=/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"
```
Le fichier de configuration contient des répertoires et des processus, le premier alinéa supervsord configurer le logiciel lui-même,
en utilisant les paramètres nodaemon à courir. La deuxième section contient deux services devraient être contrôlés.
Chaque section contient un catalogue de services et de démarrer le service de commande.

### Utilisation

Créer un miroir.
```
$ sudo docker build -t test/supervisord .
```
Lancer conteneur de superviseur.
```
$ sudo docker run -p 22 -p 80 -t -i test/supervisords
2013-11-25 18:53:22,312 CRIT Supervisor running as root (no user in config file)
2013-11-25 18:53:22,312 WARN Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
2013-11-25 18:53:22,342 INFO supervisord started with pid 1
2013-11-25 18:53:23,346 INFO spawned: 'sshd' with pid 6
2013-11-25 18:53:23,349 INFO spawned: 'apache2' with pid 7
```
Utilisez `docker run` pour démarrer le conteneur que nous avons créé. Utilisation de plusieurs `-p` pour cartographier plusieurs ports,
afin que nous puissions accéder simultanément le service ssh et apache.

Vous pouvez utiliser cette méthode pour créer une image de base seul service de ssh, après avoir créé un miroir peut être utilisé comme une base
pour la création de cette image
