## [Nginx](https://registry.hub.docker.com/_/nginx/)

### Données de base

[Nginx](https://en.wikipedia.org/wiki/Nginx) est un serveur Web source ouverte et mise en œuvre efficace, soutenir HTTP, HTTPS, SMTP, POP3, IMAP et d'autres protocoles.
L'entrepôt fournit 1,0 ~ 1,7 Nginx chaque version du miroir.

### Utilisation

La commande suivante démarre comme un serveur statique de page.

```
$ sudo docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
```
Les utilisateurs ne peuvent pas utiliser cette cartographie en utilisant Dockerfile statique contenu de la page directement dans le miroir, le contenu de
```
FROM nginx
COPY static-html-directory /usr/share/nginx/html
```
Après la génération de la nouvelle image, et de commencer un récipient.
```
$ sudo docker build -t some-content-nginx .
$ sudo docker run --name some-nginx -d some-content-nginx
```
Les ports ouverts, et cartographiés à la section locale `8080` port.
```
sudo docker run --name some-nginx -d -p 8080:80 some-content-nginx
```

Nginx chemin du fichier de configuration par défaut est `/etc/nginx/nginx.conf`,
vous pouvez mapper à utiliser le fichier de configuration locale, par exemple
```
docker run --name some-nginx -v /some/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
```
Lorsque vous utilisez le fichier de configuration, afin de fonctionner correctement dans le conteneur, la nécessité de maintenir `daemon off;`。

### Dockerfile
* [Version 1 ~ 1.7](https://github.com/nginxinc/docker-nginx/blob/3713a0157083eb4776e71f5a5aef4b2a5bc03ab1/Dockerfile)
