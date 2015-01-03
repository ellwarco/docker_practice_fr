## [WordPress](https://registry.hub.docker.com/_/wordpress/)

### Données de base

[WordPress](https://en.wikipedia.org/wiki/WordPress) est un Blog cadre de la source et de la gestion de contenu système ouvert,
qui est basé sur PHP et MySQL. L'entrepôt fournit WordPress version 4.0 de l'image.

### Utilisation

conteneur Démarrer besoin du soutien de MySQL, le port par défaut est `80`.
```
$ sudo docker run --name some-wordpress --link some-mysql:mysql -d wordpress
```
Lorsque vous démarrez WordPress conteneur peut spécifier un nombre de paramètres environnementaux, y compris
* `-e WORDPRESS_DB_USER=...` La valeur par défaut est "root"
* `-e WORDPRESS_DB_PASSWORD=...` La valeur par défaut est de se connecter mysql contenant les variables d'environnement MYSQL_ROOT_PASSWORD valeur
* `-e WORDPRESS_DB_NAME=...` La valeur par défaut est "wordpress"
* `-e WORDPRESS_AUTH_KEY=...` , `-e WORDPRESS_SECURE_AUTH_KEY=...`, `-e WORDPRESS_LOGGED_IN_KEY=...`, `-e WORDPRESS_NONCE_KEY=...`,
`-e WORDPRESS_AUTH_SALT=...`, `-e WORDPRESS_SECURE_AUTH_SALT=...` , `-e WORDPRESS_LOGGED_IN_SALT=...` , `-e WORDPRESS_NONCE_SALT=...`
la valeur par défaut est une chaîne aléatoire sha1

### Dockerfile
* [Version 4.0](https://github.com/docker-library/wordpress/blob/aee00669e7c43f435f021cb02871bffd63d5677a/Dockerfile)
