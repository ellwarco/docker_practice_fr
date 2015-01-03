## [Ubuntu](https://registry.hub.docker.com/_/ubuntu/)

### Données de base

[Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) est une des distributions Linux populaires, il est livré avec une partie de la plus récente version du logiciel souvent.
L'entrepôt fournit Ubuntu 12,04 à 14,10 chaque version du miroir.

### Utilisation

Lancer un défaut environnement Ubuntu est minimisé.
```
$ sudo docker run --name some-ubuntu -i -t ubuntu
root@523c70904d54:/#
```

### Dockerfile
* [Version 12.04](https://github.com/tianon/docker-brew-ubuntu-core/blob/2b105575647a7e2030ff344d427c3920b89e17a9/precise/Dockerfile)
* [Version 14.04](https://github.com/tianon/docker-brew-ubuntu-core/blob/2b105575647a7e2030ff344d427c3920b89e17a9/trusty/Dockerfile)
* [Version 14.10](https://github.com/tianon/docker-brew-ubuntu-core/blob/2b105575647a7e2030ff344d427c3920b89e17a9/utopic/Dockerfile)
