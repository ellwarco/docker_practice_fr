## Construire rapidement l'isolement base Docker environnement de développement

Utilisez `Dockerfile` fichier pour spécifier votre environnement d'application,
il peut être copié pour une utilisation dans ne importe quel endroit:
```
FROM python:2.7
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
```
Dans `fig.yml` fichiers d'application désigné en utilisant différents services,
afin qu'ils puissent fonctionner ensemble dans un environnement autonome:
```
web:
  build: .
  command: python app.py
  links:
   - db
  ports:
   - "8000:8000"
db:
  image: postgres
```
*Remarque ne avez pas besoin d'installer Postgres supplémentaires up!*

Ensuite, exécutez la commande `fig up`, puis Fig va démarrer et exécuter votre application jusqu'à.

![Docker](../_images/fig-example-large.gif)

Fig commandes disponibles sont:
* Démarrer, arrêter, et les services de reconstruction
* services de l'Etat de l'exécution Voir
* Vérifier le fonctionnement du service de journal d'entrée
* Service pour envoyer des commandes

##Démarrage rapide

Nous essayons de faire une base applications Python Web se exécutant sur fig. Cette expérience suppose que vous savez déjà quelques connaissances en Python,
si vous n'êtes pas familier avec, mais de toute évidence quelque chose ne ya pas de problème conceptuel.

Tout d'abord, installer [Docker et figure](install.md)

Créez un répertoire pour votre projet
```
$ mkdir figtest
$ cd figtest
```
Entrez le répertoire, créer `app.py` , ce est celui qui permet une augmentation de la valeur sur le cadre d'application web simple Redis basée sur Flask.
```
from flask import Flask
from redis import Redis
import os
app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    redis.incr('hits')
    return 'Hello World! I have been seen %s times.' % redis.get('hits')

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
```
Dans `requirements.txt` désigné Python dépendances de fichiers de l'application.
```
flask
redis
```
Ensuite, nous voulons créer une application qui contient toutes les dépendances de Docker miroir ici expliquera comment par `Dockerfile` pour créer le fichier.
```
FROM python:2.7
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
```
Le contenu de la première ci-dessus pour dire Docker installer Python à l'intérieur du récipient, ainsi que Python chemin de code dépendances.
Pour plus d'informations sur [Dockerfile peut voir des miroirs pour créer](../image/create.md) et [utiliser Dockerfile](../dockerfile/README.md)

Ensuite, nous avons passé `fig.yml` spécifier une plage de fichier services:
```
web:
  build: .
  command: python app.py
  ports:
   - "5000:5000"
  volumes:
   - .:/code
  links:
   - redis
redis:
  image: redis
  ```
Ceci spécifie les deux services:

* services Web à travers le répertoire courant `Dockerfile` créés. Et illustre l'exécution à l'intérieur du conteneur python `app.py` commande port à conteneurs
de transfert 5000 port ouvert 5000 à l'hôte local, la connexion de service Redis, et le répertoire courant pour monter à l'intérieur du récipient,
de sorte que nous ne pouvons pas reconstruire le miroir peut également être directement en utilisant le code.
* redis services, nous utilisons l'image commune [Redis](https://registry.hub.docker.com/_/redis/).
* Maintenant, si vous exécutez `fig up` commande, il va tirer miroir redis, démarrer tous les services.

```
$ fig up
Pulling image redis...
Building web...
Starting figtest_redis_1...
Starting figtest_web_1...
redis_1 | [8] 02 Jan 18:43:35.576 # Server started, Redis version 2.8.3
web_1   |  * Running on http://0.0.0.0:5000/
```
L'application Web a été lancé à l'intérieur de votre démon docker écoute sur le port 5000 (si vous devez utiliser boot2docker,
effectuez `boot2docker ip`, verra son adresse).

Si vous souhaitez exécuter votre service dans le fond, vous pouvez effectuer `fig up` lorsque la commande a ajouté `-d` paramètre,
puis utilisez le `fig ps` pour voir quels sont les processus en cours d'exécution.

```
$ fig up -d
Starting figtest_redis_1...
Starting figtest_web_1...
$ fig ps
        Name                 Command            State       Ports
-------------------------------------------------------------------
figtest_redis_1   /usr/local/bin/run         Up
figtest_web_1     /bin/sh -c python app.py   Up      5000->5000/tcp
```
`fig run` commande peut aider pour votre service pour envoyer des commandes.
Par exemple: vous pouvez obtenir de voir les variables des services Web de l'environnement:
```
$ fig run web env
```
Aide commande l'exécution `fig --help` pour voir d'autres paramètres disponibles.

Supposons que vous utilisez un `fig up -d` commencer figure, grâce à la commande suivante pour arrêter votre service:
```
$ fig stop
```
Le contenu ci-dessus est plus ou moins décrit comment Fig. En examinant les sections de référence suivants peuvent se renseigner sur les commandes,
configuration et variables d'environnement pour plus de détails. Si vous avez des idées ou des suggestions,[vous pouvez mettre sur GitHub](https://github.com/docker/fig).
