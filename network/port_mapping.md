## L'accès externe au récipient

Conteneur peut fonctionner certaines applications de réseau, de rendre ces applications peuvent également être consultés à l'extérieur,
par `-P` ou `-p` paramètre pour spécifier le mappage de port.

Lors de l'utilisation de la marque de `-P`, Docker une carte aléatoire `49000~49900` port à l'intérieur des ports de réseau ouvert de conteneurs.

Utilisez `docker ps` vous pouvez le voir, l'hôte local est mappé à 49155 5000 conteneurs du port.
A cet accès à la machine de cas pour accéder au port 49 115 Interface d'applications web du récipient.
```
$ sudo docker run -d -P training/webapp python app.py
$ sudo docker ps -l
CONTAINER ID  IMAGE                   COMMAND       CREATED        STATUS        PORTS                    NAMES
bc533791f3f5  training/webapp:latest  python app.py 5 seconds ago  Up 2 seconds  0.0.0.0:49155->5000/tcp  nostalgic_morse
```
De même, en `docker logs` commande de l'application pour visualiser les informations.
```
$ sudo docker logs -f nostalgic_morse
* Running on http://0.0.0.0:5000/
10.0.2.2 - - [23/May/2014 20:16:31] "GET / HTTP/1.1" 200 -
10.0.2.2 - - [23/May/2014 20:16:31] "GET /favicon.ico HTTP/1.1" 404 -
```
-p (minuscule), vous pouvez spécifier le port à cartographier, et seulement à un port désigné peut être lié à un conteneur.
Les formats supportés sont `ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort`.

### Tous cartographie adresse de l'interface

Utilisation `hostPort:containerPort` forme mappé port local 5000 vers le port 5000 du récipient peut être effectuée
```
$ sudo docker run -d -p 5000:5000 training/webapp python app.py
```
À ce défaut se liera toutes les adresses locales sur toutes les interfaces.

### Mappé vers le port spécifié de l'adresse indiquée

Vous pouvez utiliser le `ip:hostPort:containerPort` le format carte spécifié pour utiliser une adresse spécifique, comme 127.0.0.1 adresse localhost
```
$ sudo docker run -d -p 127.0.0.1:5000:5000 training/webapp python app.py
```
### Correspond à ne importe quelle adresse de port spécifié

Utilisez `ip::containerPort` ne importe quel port localhost contraignant 5000 au port de conteneurs, l'hôte local attribue automatiquement un port.
```
$ sudo docker run -d -p 127.0.0.1::5000 training/webapp python app.py
```
Vous pouvez également utiliser des balises pour spécifier le port UDP udp
```
$ sudo docker run -d -p 127.0.0.1:5000:5000/udp training/webapp python app.py
```
### Voir la carte configuration de port

Utilisez `docker port` pour afficher la configuration de port de la carte actuelle, vous pouvez également afficher la liaison adresse
```
$ docker port nostalgic_morse 5000
127.0.0.1:49155.
```
Remarque:

* Conteneur possède son propre réseau interne et l'adresse IP (utilisant `docker inspect` peuvent obtenir toutes les variables, Docker peut aussi avoir une configuration de réseau variable.)
* L'option -p peut être utilisée plusieurs fois pour lier plusieurs ports
Comme
```
$ sudo docker run -d -p 5000:5000  -p 3000:80 training/webapp python app.py
```
