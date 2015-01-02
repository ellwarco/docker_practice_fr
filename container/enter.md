## Dans le récipient

En utilisant le `-d` paramètre va commencer dans le fond après que le récipient.
Parfois besoin d'entrer dans le navire à opérer, il ya une variété de méthodes, y compris l'utilisation de `docker attach` commande ou `nsenter` outils.

### commande attach
`docker attach` propre commande d'un Docker. Les exemples suivants de la façon d'utiliser cette commande.
```
$ sudo docker run -idt ubuntu
243c32535da7d142fb0e6df616a3c3ada0b8ab417937c853a9e1c251f499f550
$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
243c32535da7        ubuntu:latest       "/bin/bash"         18 seconds ago      Up 17 seconds                           nostalgic_hypatia
$sudo docker attach nostalgic_hypatia
root@243c32535da7:/#
```
Mais l'utilisation de la commande `attach` commande parfois pas commode. Lorsque plusieurs fenêtres attachent simultanément à un même récipient,
lorsque toutes les fenêtres sont affichées simultanément. Quand une fenêtre est bloqué en raison de la commande, d'autres fenêtres ne peuvent pas exécuter l'opération.

### commande nsenter
#### Installation

`nsenter` outil dans le paquet util-linux contient la version 2.23. Si votre paquet util-linux système sans cette commande,
vous pouvez installer de la source conformément à la méthode suivante.
```
$ cd /tmp; curl https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz | tar -zxf-; cd util-linux-2.24;
$ ./configure --without-ncurses
$ make nsenter && sudo cp nsenter /usr/local/bin
```

#### Utilisation

`nsenter` espace de noms peut accéder à un autre processus. nsenter veulent travailler doivent avoir les privilèges root.
Malheureusement, Ubuntu 14.4 utilise toujours util-linux 2.20. Installez la dernière version de util-linux (2,24) La version, suivez ces étapes:
```
$ wget https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz; tar xzvf util-linux-2.24.tar.gz
$ cd util-linux-2.24
$ ./configure --without-ncurses && make nsenter
$ sudo cp nsenter /usr/local/bin
```
Afin de se connecter au conteneur, vous devez également savoir PID du premier conteneur de processus, vous pouvez obtenir grâce à la commande suivante.
```
PID=$(docker inspect --format "{{ .State.Pid }}" <container>)
```
Grâce à ce PID, vous pouvez vous connecter au conteneur
```
$ nsenter --target $PID --mount --uts --ipc --net --pid
```
Voici un exemple complet.
```
$ sudo docker run -idt ubuntu
243c32535da7d142fb0e6df616a3c3ada0b8ab417937c853a9e1c251f499f550
$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
243c32535da7        ubuntu:latest       "/bin/bash"         18 seconds ago      Up 17 seconds                           nostalgic_hypatia
$ PID=$(docker-pid 243c32535da7)
10981
$ sudo nsenter --target 10981 --mount --uts --ipc --net --pid
root@243c32535da7:/#
```
Plus simplement, il est recommandé que vous téléchargez
[.bashrc_docker](https://github.com/yeasy/docker_practice/raw/master/_local/.bashrc_docker) .bashrc dans.
```
$ wget -P ~ https://github.com/yeasy/docker_practice/raw/master/_local/.bashrc_docker;
$ echo "[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker" >> ~/.bashrc; source ~/.bashrc
```
Ce document définit un certain nombre de facile à utiliser Docker commandes telles `docker-pid` PID peut obtenir un récipient et
`docker-enter` dans le conteneur ou peut exécuter des commandes directement dans le récipient.
```
$ echo $(docker-pid <container>)
$ docker-enter <container> ls
```
