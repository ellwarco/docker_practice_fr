## Configuration de pont Docker0

Service Docker par défaut crée un `docker0` pont (sur lequel il ya une `docker0` d'interface interne), il est dans la couche du noyau connectivité
à autre carte physique ou virtuel, qui sera l'hôte local et tous les conteneurs sont placés sur le même réseau physique.

Docker défaut spécifié `docker0` adresse IP et sous-réseau Interface masque, de sorte que vous pouvez communiquer avec l'autre à travers le pont,
il donne le MTU (interface de l'unité de transmission maximale permet la réception) entre l'hôte et le conteneur est généralement 1500 octets,
ou de l'hôte le réseau hôte de routage valeurs par défaut de soutien. Ces valeurs peuvent être configurés dans le service démarre.

* `--bip=CIDR` - adresse IP ainsi que le masque formats, comme 192.168.1.5/24
* `--mtu=BYTES` - pour remplacer la configuration par défaut Docker MTU

DOCKER_OPTS peut également être configuré dans le fichier de configuration, puis redémarrez le service.
En raison de l'actuel pont est le pont Docker Linux, les utilisateurs peuvent utiliser `brctl show` pour afficher les informations de connexion pont et le port.
```
$ sudo brctl show
bridge name     bridge id               STP enabled     interfaces
docker0         8000.3a1d7362b4ee       no              veth65f9
                                             vethdda6
```
* Note: `brctl` commande dans Debian, Ubuntu peut utiliser `sudo apt-get install bridge-utils` installer.

Chaque fois que vous créez un nouveau conteneur lorsque, Docker choisir parmi les adresses disponibles dans une adresse IP libre affecté à port à conteneurs eth0.
Utilisez le hôte local `docker0` interface IP que la passerelle par défaut pour tous les conteneurs.
```
$ sudo docker run -i -t --rm base /bin/bash
$ ip addr show eth0
24: eth0: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 32:6f:e0:35:57:91 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.3/16 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::306f:e0ff:fe35:5791/64 scope link
       valid_lft forever preferred_lft forever
$ ip route
default via 172.17.42.1 dev eth0
172.17.0.0/16 dev eth0  proto kernel  scope link  src 172.17.0.3
$ exit
```
