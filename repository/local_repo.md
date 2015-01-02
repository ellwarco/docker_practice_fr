## Entrepôt privé

Parfois, l'utilisation d'un tel entrepôt public Docker Hub peut être gênant, les utilisateurs peuvent créer un référentiel local pour un usage privé.

Cette section décrit comment utiliser un entrepôt local.

`docker-registry` est un outil fourni par le fonctionnaire, le miroir peut être utilisé pour construire un entrepôt privé.

### Installation et le fonctionnement docker-registre
#### opération de conteneurs

Après avoir installé Docker, vous pouvez obtenir le registre officiel en miroir afin de fonctionner.
```
$ sudo docker run -d -p 5000:5000 registry
```
Il utilisera un miroir pour démarrer le registre officiel de l'entrepôt privé local.
Les utilisateurs peuvent configurer un emplacement entrepôt privé en spécifiant des paramètres tels que l'image
de configuration stockées dans le service Amazon S3.
```
$ sudo docker run \
         -e SETTINGS_FLAVOR=s3 \
         -e AWS_BUCKET=acme-docker \
         -e STORAGE_PATH=/registry \
         -e AWS_KEY=AKIAHSHB43HS3J92MXZ \
         -e AWS_SECRET=xdDowwlK7TJajV1Y7EoOZrmuPEJlHYcNP2k4j49T \
         -e SEARCH_BACKEND=sqlalchemy \
         -p 5000:5000 \
         registry
````
En outre, vous pouvez également spécifier un chemin d'accès local (par exemple, `/home/user/registry-conf` fichier de configuration sous).
```
$ sudo docker run -d -p 5000:5000 -v /home/user/registry-conf:/registry-conf -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml registry
```
Par défaut, le dépôt sera créé dans le conteneur `/tmp/registry` sous. Par `-v` argument pour spécifier le chemin vers le fichier image stocké dans le local.
Comme les exemples suivants seront télécharger l'image dans `/opt/data/registry` répertoire.
```
$ sudo docker run -d -p 5000:5000 -v /opt/data/registry:/tmp/registry registry
```

#### Installation locale

Pour Ubuntu ou CentOS de presse, etc., peuvent être installés directement par la source.
* Ubuntu
```
$ sudo apt-get install -y build-essential python-dev libevent-dev python-pip liblzma-dev
$ sudo pip install docker-registry
```
* CentOS
```
$ sudo yum install -y python-devel libevent-devel python-pip gcc xz-devel
$ sudo python-pip install docker-registry
```

Aussi à partir du [docker-registry](https://github.com/docker/docker-registry) source du projet d'installation de téléchargement.
```
$ sudo apt-get install build-essential python-dev libevent-dev python-pip libssl-dev liblzma-dev libffi-dev
$ git clone https://github.com/docker/docker-registry.git
$ cd docker-registry
$ sudo python setup.py install
```
Puis modifier le fichier de configuration, les principaux segments de modèle de changement de dev `storage_path` le chemin à un entrepôt de stockage local.
```
$ cp config/config_sample.yml config/config.yml
```
Après le démarrage du service Web.
```
$ sudo gunicorn -c contrib/gunicorn.py docker_registry.wsgi:application
```
Ou
```
$ sudo gunicorn --access-logfile - --error-logfile - -k gevent -b 0.0.0.0:5000 -w 4 --max-requests 100 docker_registry.wsgi:application
```
Cette fois, en utilisant le port d'accès local 5000, a vu informations sur la version sortie instructions docker-registry immatriculation afin de fonctionner correctement.

* Note: `config/config_sample.yml` fichier est un fichier de configuration de l'échantillon.

### Dans un entrepôt privé télécharger, miroirs de recherche

Après la création d'un entrepôt privé, vous pouvez utiliser `docker tag` pour marquer un miroir, et poussez-le à l'entrepôt,
sur les autres machines peuvent être téléchargés vers le bas. Telles que l'adresse de l'entrepôt privé `192.168.7.26:5000`.

D'abord dans la machine pour afficher des images existantes.
```
$ sudo docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu                            latest              ba5877dc9bec        6 weeks ago         192.7 MB
ubuntu                            14.04               ba5877dc9bec        6 weeks ago         192.7 MB
```

Utilisez `docker tag` sera `ba58` cette image étiqueté comme `192.168.7.26:5000/test` (le format `docker tag IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]`).
```
$ sudo docker tag ba58 192.168.7.26:5000/test
root ~ # docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu                            14.04               ba5877dc9bec        6 weeks ago         192.7 MB
ubuntu                            latest              ba5877dc9bec        6 weeks ago         192.7 MB
192.168.7.26:5000/test            latest              ba5877dc9bec        6 weeks ago         192.7 MB
```
Utilisez `docker push` téléchargement étiqueté image.
```
$ sudo docker push 192.168.7.26:5000/test
The push refers to a repository [192.168.7.26:5000/test] (len: 1)
Sending image list
Pushing repository 192.168.7.26:5000/test (1 tags)
Image 511136ea3c5a already pushed, skipping
Image 9bad880da3d2 already pushed, skipping
Image 25f11f5fb0cb already pushed, skipping
Image ebc34468f71d already pushed, skipping
Image 2318d26665ef already pushed, skipping
Image ba5877dc9bec already pushed, skipping
Pushing tag for rev [ba5877dc9bec] on {http://192.168.7.26:5000/v1/repositories/test/tags/latest}
```
Vérifiez avec `curl` dans l'image de l'entrepôt.
```
$ curl http://192.168.7.26:5000/v1/search
{"num_results": 7, "query": "", "results": [{"description": "", "name": "library/miaxis_j2ee"}, {"description": "", "name": "library/tomcat"}, {"description": "", "name": "library/ubuntu"}, {"description": "", "name": "library/ubuntu_office"}, {"description": "", "name": "library/desktop_ubu"}, {"description": "", "name": "dockerfile/ubuntu"}, {"description": "", "name": "library/test"}]}
```
Ici vous pouvez voir `{"description": "", "name": "library/test"}`, ce miroir a été téléchargé avec succès.

Vous pouvez maintenant aller vers une autre machine pour télécharger cette image.
```
$ sudo docker pull 192.168.7.26:5000/test
Pulling repository 192.168.7.26:5000/test
ba5877dc9bec: Download complete
511136ea3c5a: Download complete
9bad880da3d2: Download complete
25f11f5fb0cb: Download complete
ebc34468f71d: Download complete
2318d26665ef: Download complete
$ sudo docker images
REPOSITORY                         TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
192.168.7.26:5000/test             latest              ba5877dc9bec        6 weeks ago         192.7 MB
```

Vous pouvez utiliser [ce script](https://github.com/yeasy/docker_practice/raw/master/_local/push_images.sh) pour télécharger vrac miroir local
pour le serveur d'enregistrement, la valeur par défaut est le serveur d'enregistrement local `127.0.0.1:5000`. Par exemple:
```
$ wget https://github.com/yeasy/docker_practice/raw/master/_local/push_images.sh; sudo chmod a+x push_images.sh
$ ./push_images.sh ubuntu:latest centos:centos7
The registry server is 127.0.0.1
Uploading ubuntu:latest...
The push refers to a repository [127.0.0.1:5000/ubuntu] (len: 1)
Sending image list
Pushing repository 127.0.0.1:5000/ubuntu (1 tags)
Image 511136ea3c5a already pushed, skipping
Image bfb8b5a2ad34 already pushed, skipping
Image c1f3bdbd8355 already pushed, skipping
Image 897578f527ae already pushed, skipping
Image 9387bcc9826e already pushed, skipping
Image 809ed259f845 already pushed, skipping
Image 96864a7d2df3 already pushed, skipping
Pushing tag for rev [96864a7d2df3] on {http://127.0.0.1:5000/v1/repositories/ubuntu/tags/latest}
Untagged: 127.0.0.1:5000/ubuntu:latest
Done
Uploading centos:centos7...
The push refers to a repository [127.0.0.1:5000/centos] (len: 1)
Sending image list
Pushing repository 127.0.0.1:5000/centos (1 tags)
Image 511136ea3c5a already pushed, skipping
34e94e67e63a: Image successfully pushed
70214e5d0a90: Image successfully pushed
Pushing tag for rev [70214e5d0a90] on {http://127.0.0.1:5000/v1/repositories/centos/tags/centos7}
Untagged: 127.0.0.1:5000/centos:centos7
Done
```
