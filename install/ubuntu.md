## Ubuntu série Docker d'installation

### Grâce au système livré avec l'installation du paquet

Ubuntu 14.04 système de libération vient déjà avec forfait Docker qui peut être installé directement.
```
$ sudo apt-get update
$ sudo apt-get install -y docker.io
$ sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
$ sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
```

Si vous utilisez un système d'exploitation qui vient avec l'installation du paquet Docker,
version actuellement installée est plus 0.9.1. Pour installer la version mise à jour, vous pouvez utiliser les sources Docker à sens unique.

### Installer la dernière version par source Docker

Pour installer la dernière version du Docker, vous devez d'abord installer le support apt-transport-https, suivi par l'addition à la source d'installation.
```
$ sudo apt-get install apt-transport-https
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
$ sudo bash -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
$ sudo apt-get update
$ sudo apt-get install lxc-docker
```

### Avant la version 14.04

Si il est une version antérieure du système Ubuntu, vous devez mettre à jour le noyau.
```
$ sudo apt-get update
$ sudo apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring
$ sudo reboot
```
Ensuite, répétez les étapes ci-dessus.

Démarrez le service Docker après l'installation.
```
$ sudo service docker start
```
