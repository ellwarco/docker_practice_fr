## [Node.js](https://registry.hub.docker.com/_/node/)

### Données de base

[Node.js](https://en.wikipedia.org/wiki/Node.js) est une plate-forme évolutive de développement de logiciels serveur et réseau basé sur JavaScript.
L'entrepôt fournit Node.js 0,8 ~ 0,11 pour chaque version du miroir.

### Utilisation

Créez un Dockerfile dans le projet.
```
FROM node:0.10-onbuild
# replace this with your application's default port
EXPOSE 8888
```
Ensuite, créez un miroir et commencer à conteneur
```
$ sudo docker build -t my-nodejs-app
$ sudo docker run -it --rm --name my-running-app my-nodejs-app
```

Vous pouvez également exécuter directement un conteneur simple.
```
$ sudo docker run -it --rm --name my-running-script -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp node:0.10 node your-daemon-or-script.js
```

### Dockerfile
* [Version 0.8](https://github.com/docker-library/node/blob/d017d679e92e84a810c580cdb29fcdbba23c2bb9/0.8/Dockerfile)
* [Version 0.10](https://github.com/docker-library/node/blob/913a225f2fda34d6a811fac1466e4f09f075fcf6/0.10/Dockerfile)
* [Version 0.11](https://github.com/docker-library/node/blob/d017d679e92e84a810c580cdb29fcdbba23c2bb9/0.11/Dockerfile)
