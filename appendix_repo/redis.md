## [Redis](https://registry.hub.docker.com/_/redis/)

### Données de base

[Redis](https://en.wikipedia.org/wiki/Redis) est une implémentation de base de données clé-valeur de la mémoire open source.
L'entrepôt fournit Redis 2,6 ~ 2.8.9 toutes les versions du miroir.

### Utilisation

Défaut de `6379` du port pour démarrer la base de données.
```
$ sudo docker run --name some-redis -d redis
```
Il peut également permettre [un stockage persistant](http://redis.io/topics/persistence)。
```
$ sudo docker run --name some-redis -d redis redis-server --appendonly yes
```
L'emplacement de stockage de données par défaut dans le `VOLUME/data`. Vous pouvez utiliser `--volumes-from some-volume-container`
ou `-v /docker/host/dir:/data` pour stocker des données localement.

Utiliser d'autres applications connectées au conteneur, vous pouvez utiliser
```
$ sudo docker run --name some-app --link some-redis:redis -d application-that-uses-redis
```
Ou par `redis-cli`
```
$ sudo docker run -it --link some-redis:redis --rm redis sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'
```

### Dockerfile
* [Version 2.6](https://github.com/docker-library/redis/blob/02d9cd887a4e0d50db4bb085eab7235115a6fe4a/2.6.17/Dockerfile)
* [Version 2.8](https://github.com/docker-library/redis/blob/d0665bb1bbddd4cc035dbc1fc774695fa534d648/2.8.13/Dockerfile)
