## interconnexion de conteneurs

Branchement du système récipient (linking) est en outre le mappage de port, mais une autre application avec un récipient de manière interactive.

Le système crée un tunnel entre la source et le conteneur de réception, le récipient de réception peut voir les informations spécifiées dans le conteneur blindé.

### conteneur de dénomination personnalisée

Le système de connexion est effectuée sur la base du nom du conteneur. Donc, vous devez d'abord personnaliser un conteneur de dénomination amicale.

Bien que lorsque le conteneur est créé, le système attribue un nom par défaut. conteneur de dénomination personnalisée présente deux avantages:

* nom personnalisé, relativement facile à retenir, comme un conteneur d'application Web, nous pouvons lui donner le nom web
* Lorsque vous voulez vous connecter à d'autres conteneurs, ils peuvent servir de point de référence utile, telles que la connexion à la cuve de conteneur Web db

Utilisez --name marque pour conteneur de dénomination personnalisée.
```
$ sudo docker run -d -P --name web training/webapp python app.py
```

Utilisez `docker ps` de vérifier le nom du jeu.
```
$ sudo docker ps -l
CONTAINER ID  IMAGE                  COMMAND        CREATED       STATUS       PORTS                    NAMES
aed84ee21bde  training/webapp:latest python app.py  12 hours ago  Up 2 seconds 0.0.0.0:49154->5000/tcp  web
```
Vous pouvez également utiliser `docker inspect` pour voir le nom du navire
```
$ sudo docker inspect -f "{{ .Name }}" aed84ee21bde
/web
```
Remarque: Le nom du conteneur est unique. Si vous avez nommé un navire appelé le Web, si vous souhaitez réutiliser ce nom lorsque le Web,
vous devez utiliser `docker rm` pour enlever le récipient du même nom créé plus tôt.

Dans l'exécution `docker run` de temps si vous ajoutez `--rm` marque, le conteneur sera retiré immédiatement après la résiliation.
Remarque, `--rm` et `-d` paramètre ne peuvent être utilisés simultanément.

###interconnexion de conteneurs

Utilisez `--link` paramètre permet l'interaction entre la sécurité des conteneurs.

Ci-dessous pour créer un nouveau conteneur de base de données.
```
$ sudo docker run -d --name db training/postgres
```
Pour supprimer un conteneur Web précédemment créé
```
$ docker rm -f web
```
Ensuite, créez un nouveau conteneur Web, et le connecter au conteneur db
```
$ sudo docker run -d -P --name web --link db:db training/webapp python app.py
```
À ce stade, db conteneur conteneur Web et d'établir des interconnexions.

`--link` paramètre de format est `--link name:alias`, qui `name` le nom du navire doit être liée, `alias` est l'alias pour cette connexion.

Utilisez `docker ps` pour afficher la connexion de conteneurs
```
$ docker ps
CONTAINER ID  IMAGE                     COMMAND               CREATED             STATUS             PORTS                    NAMES
349169744e49  training/postgres:latest  su postgres -c '/usr  About a minute ago  Up About a minute  5432/tcp                 db, web/db
aed84ee21bde  training/webapp:latest    python app.py         16 hours ago        Up 2 minutes       0.0.0.0:49154->5000/tcp  web
```
Vous pouvez voir le conteneur de dénomination personnalisée, db et web, noms db listes de conteneurs db sont également Web / db.
Ceci indique un lien vers un récipient de db conteneur Web, navires porte-conteneurs Web seront autorisés à accéder à des informations db.

Docker entre deux récipients interconnectés crée un tunnel sécurisé, et ne correspond pas à leur port d'accueil de l'hôte.
Et non utilisé dans un conteneur de démarrage lorsque db `-p` et `-P` marque, évitant ainsi l'exposition à la base de données de port réseau externe.

Docker deux façons d'ouvrir les informations de connexion du conteneur:

* Variables d'environnement
* Mise à jour `/etc/hosts` fichier

Utilisez `env` commande pour voir les variables d'environnement de conteneur Web
```
$ sudo docker run --rm --name web2 --link db:db training/webapp env
. . .
DB_NAME=/web2/db
DB_PORT=tcp://172.17.0.5:5432
DB_PORT_5000_TCP=tcp://172.17.0.5:5432
DB_PORT_5000_TCP_PROTO=tcp
DB_PORT_5000_TCP_PORT=5432
DB_PORT_5000_TCP_ADDR=172.17.0.5
. . .
```
`DB_début` de la variable d'environnement qui est relié au récipient de bande pour une utilisation de conteneurs db préfixe alias de connexion majuscules.

En plus des variables environnementales, Docker ajouter également des informations de l'hôte du conteneur parent `/etc/hosts` fichier.
Voici le conteneur parent fichier hosts web
```
$ sudo docker run -t -i --rm --link db:db training/webapp /bin/bash
root@aed84ee21bde:/opt/webapp# cat /etc/hosts
172.17.0.7  aed84ee21bde
. . .
172.17.0.5  db
```
Il ya deux hôtes, le premier est un conteneur Web, conteneur Web avec id comme l'hôte de son nom, le second est le conteneur de db IP et nom d'hôte.
Vous pouvez installer la commande ping pour tester la connectivité avec récipient db dans le conteneur Web.
```
root@aed84ee21bde:/opt/webapp# apt-get install -yqq inetutils-ping
root@aed84ee21bde:/opt/webapp# ping db
PING db (172.17.0.5): 48 data bytes
56 bytes from 172.17.0.5: icmp_seq=0 ttl=64 time=0.267 ms
56 bytes from 172.17.0.5: icmp_seq=1 ttl=64 time=0.250 ms
56 bytes from 172.17.0.5: icmp_seq=2 ttl=64 time=0.256 ms
```
Utilisez Ping pour conteneur de db de test, il se résoudre à `172.17.0.5`.

*Remarque: Le miroir officiel de ubuntu est pas installé par défaut de ping, besoin d'installer.

Les utilisateurs peuvent se connecter de multiples sous-conteneurs au conteneur parent, par exemple, peut relier conteneur Web multiple de la db.
