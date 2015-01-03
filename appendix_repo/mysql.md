## [MySQL](https://registry.hub.docker.com/_/mysql/)

### Données de base
[MySQL](https://en.wikipedia.org/wiki/MySQL) est une implémentation de base de données relationnelle open source. L'entrepôt offre différentes versions de miroir MySQL, y compris 5,6 série, la série 5.7.

###Utilisation

Défaut de `3306` pour commencer l'orifice de base de données.
```
$ sudo docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
```
Ensuite, vous pouvez utiliser d'autres applications de se connecter au conteneur.
```
$ sudo docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql
```
Ou par `mysql`.
```
$ sudo docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```

### Dockerfile
* [Version 5.6](https://github.com/docker-library/mysql/blob/7461a52b43f06839a4d8723ae8841f4cb616b3d0/5.6/Dockerfile)
* [Version 5.7](https://github.com/docker-library/mysql/blob/7461a52b43f06839a4d8723ae8841f4cb616b3d0/5.7/Dockerfile)
