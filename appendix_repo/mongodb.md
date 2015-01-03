## [MongoDB](https://registry.hub.docker.com/_/mongo/)

### Données de base

[MongoDB](https://en.wikipedia.org/wiki/MongoDB) est une implémentation de base de données NoSQL la source ouverte.
L'entrepôt fournit différentes versions MongoDB l'image 2.2 ~ 2.7 de.

### Utilisation

La valeur par défaut sera `27017` pour démarrer le port de base de données.
```
$ sudo docker run --name some-mongo -d mongo
```

Utiliser d'autres applications connectées au conteneur, vous pouvez utiliser
```
$ sudo docker run --name some-app --link some-mongo:mongo -d application-that-uses-mongo
```
Ou par `mongo`
```
$ sudo docker run -it --link some-mongo:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
```

### Dockerfile
* [Version 2.2](https://github.com/docker-library/mongo/blob/77c841472ccb6cc87fea1218269d097405edc6cb/2.2/Dockerfile)
* [Version 2.4](https://github.com/docker-library/mongo/blob/807078cb7b5f0289f6dabf9f6875d5318122bc30/2.4/Dockerfile)
* [Version 2.6](https://github.com/docker-library/mongo/blob/77c841472ccb6cc87fea1218269d097405edc6cb/2.6/Dockerfile)
* [Version 2.7](https://github.com/docker-library/mongo/blob/807078cb7b5f0289f6dabf9f6875d5318122bc30/2.7/Dockerfile)
