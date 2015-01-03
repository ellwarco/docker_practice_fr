## [CentOS](https://registry.hub.docker.com/_/centos/)

### Données de base

[CentOS](https://en.wikipedia.org/wiki/CentOS) est une distribution Linux populaire, qui est compatible avec la plupart des paquets série de RedHat.
L'entrepôt fournit CentOS 5-7 chaque version du miroir.

### Utilisation

La valeur par défaut va commencer un environnement CentOS minimisé.
```
$ sudo docker run --name some-centos -i -t centos bash
bash-4.2#
```

### Dockerfile
* [Version CentOS 5](https://github.com/CentOS/sig-cloud-instance-images/blob/2e5a9c4e8b7191b393822e4b9e98820db5638a77/docker/Dockerfile)
* [Version CentOS 6](https://github.com/CentOS/sig-cloud-instance-images/blob/8717e33ea5432ecb33d7ecefe8452a973715d037/docker/Dockerfile)
* [Version CentOS 7](https://github.com/CentOS/sig-cloud-instance-images/blob/af7a1b9f8f30744360a10fe44c53a1591bef26f9/docker/Dockerfile)
