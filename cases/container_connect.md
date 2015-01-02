## interconnexion de conteneurs entre plusieurs hôtes physiques (conteneur exposé au réseau réel)

Docker carte pont par défaut est docker0. Ce est seulement quand tous le conteneur carte pont natif, par exemple, une carte réseau virtuelle
dans le vaisseau hôte appelé veth*** point de vue général et Docker vient de mettre toutes ces cartes pontées, comme suit:
```
[root@opnvz ~]# brctl show
bridge name     bridge id               STP enabled     interfaces
docker0         8000.56847afe9799       no              veth0889
                                             veth3c7b
                                             veth4061
```
Voir l'adresse dans le conteneur est généralement comme l'adresse suivante:
```
root@ac6474aeb31d:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
11: eth0: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 4a:7d:68:da:09:cf brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.3/16 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::487d:68ff:feda:9cf/64 scope link
       valid_lft forever preferred_lft forever
```
Donc, vous pouvez mettre ce réseau comme un réseau privé qui relie le réseau externe via nat, si vous souhaitez vous connecter au conteneur en dehors du réseau,
vous devez faire le mappage de port, à savoir l'argument -p.

Si les applications maison ou de faire plus d'un cluster hôte physique, vous pourriez avoir besoin d'un conteneur pour plusieurs groupe hôte physique à
un réseau physique dans le passé, alors vous devez être comblé au pont sur notre carte désignée.

### Topologie

NIC hôtes A et B sont fixés à une même commutateur de réseau local virtuel physique 101, ce pont est équivalent à une et trois ponts sur le même réseau physique,
tandis qu'un récipient, le récipient trois ou quatre dans le même récipient réseau physique, et ils peuvent communiquer entre eux, mais aussi avec le même VLAN 
d'autres machines physiques interconnectés. 
![Topologie physique](../_images/container_connect_topology.png)

### exemple ubuntu

Ici, par exemple pour créer de multiples récipients hôtes ubuntu réseau: Créer votre propre pont, éditer le fichier /etc/network/interface
```
auto br0
iface br0 inet static
address 192.168.7.31
netmask 255.255.240.0
gateway 192.168.7.254
bridge_ports em1
bridge_stp off
dns-nameservers 8.8.8.8 192.168.6.1
```
Le pont de défaut Docker est lié à ce nouveau top br0, de sorte qu'il sera sur l'emballage de la machine lié à Em1 cette carte un réseau physique correspondant.

ubuntu modifier le fichier /etc/default/docker, ajouter la dernière ligne
```
# Docker Upstart and SysVinit configuration file
# Customize location of Docker binary (especially for development testing).
#DOCKER="/usr/local/bin/docker"
# Use DOCKER_OPTS to modify the daemon startup options.
#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"

# If you need Docker to use an HTTP proxy, it can also be specified here.
#export http_proxy="http://127.0.0.1:3128/"

# This is also a handy place to tweak where Docker's temporary files go.
#export TMPDIR="/mnt/bigdrive/docker-tmp"

DOCKER_OPTS="-b=br0"
```

Docker commencer à utiliser le paramètre -b dans le récipient lorsqu'il est lié au réseau physique.
Après le redémarrage du service Docker, puis dans le récipient vous pouvez le voir, il a été lié au réseau physique de votre.

```
root@ubuntudocker:~# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                        NAMES
58b043aa05eb        desk_hz:v1          "/startup.sh"       5 days ago          Up 2 seconds        5900/tcp, 6080/tcp, 22/tcp   yanlx
root@ubuntudocker:~# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.7e6e617c8d53       no              em1
                                            vethe6e5
```
Ce conteneur est exposé directement au réseau physique, les conteneurs plusieurs hôtes physiques peuvent aussi éliminer l'Internet.
Il convient de noter que, si vous avez besoin pour assurer votre propre conteneur de la sécurité réseau.
