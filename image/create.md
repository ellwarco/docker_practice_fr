## Créer un miroir

Il ya plusieurs façons de créer un miroir, vous pouvez y accéder depuis Docker miroir Hub et mises à jour peut également être utilisé pour créer un système de fichiers local.

### Modifier une image existante
Première commencer à utiliser le conteneur d'image téléchargé.
```
$ sudo docker run -t -i training/sinatra /bin/bash
root@0b2616b0e5a8:/#
```
Note: Rappelez-vous que l'ID de conteneurs, sera utilisé plus tard.

Ajouter JSON et de pierres précieuses deux applications dans le récipient.
```
root@0b2616b0e5a8:/# gem install json
```
Lorsque vous avez terminé, nous utilisons la sortie pour quitter, et maintenant nous avons notre conteneur a été changé,
utilisez `docker commit` commande pour soumettre une copie de la mise à jour.
```
$ sudo docker commit -m "Added json gem" -a "Docker Newbee" 0b2616b0e5a8 ouruser/sinatra:v2
4f177bd27a9ff0f6dc2a830403925b5360bfe0b93d476f7fc3231110e7f71b1c
```
Qui, `-m` pour spécifier des informations descriptives qui nous est soumis, comme l'utilisation d'outils de contrôle de version;
`-a` peut spécifier les mises à jour de l'information de l'utilisateur, puis utilisées pour créer un miroir de l'ID du conteneur;
la dernière spécifiée image cible nom de l'entrepôt et des informations d'étiquette. Sera de retour les informations d'identification en miroir après créé avec succès.

Utilisez `docker images` pour afficher l'image nouvellement créé.
```
$ sudo docker images
REPOSITORY          TAG     IMAGE ID       CREATED       VIRTUAL SIZE
training/sinatra    latest  5bc342fa0b91   10 hours ago  446.7 MB
ouruser/sinatra     v2      3c59e02ddd1a   10 hours ago  446.7 MB
ouruser/sinatra     latest  5db5f8471261   10 hours ago  446.7 MB
```
Après cela, vous pouvez utiliser le nouveau miroir pour commencer récipient
```
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash
root@78e82f680994:/#
```

##Dockerfile utiliser pour créer un miroir

Utilisez `docker commit` à étendre un miroir est relativement simple, mais difficile à part dans une équipe.
Nous pouvons utiliser `docker build` pour créer une nouvelle image.
Pour ce faire, vous devez d'abord créer un Dockerfile, contient des instructions sur la façon de créer un miroir.

Créez un répertoire et un Dockerfile
```
$ mkdir sinatra
$ cd sinatra
$ touch Dockerfile
```
Dockerfile 中每一条指令都创建镜像的一层，例如：
```
# This is a comment
FROM ubuntu:14.04
MAINTAINER Docker Newbee <newbee@docker.com>
RUN apt-get -qq update
RUN apt-get -qqy install ruby ruby-dev
RUN gem install sinatra
```
Syntaxe de base est Dockerfile

* Utilisez `#` pour commenter
* `FROM` instruction Docker Quelle image raconte comme base pour
* Suivi par les défenseurs de l'information
* `RUN` commande sera exécutée au début de la création, tels que l'installation d'un paquet, où l'utilisation d'apt-get pour installer certains logiciels

Vous pouvez utiliser après leur achèvement Dockerfile docker build pour générer des images.
```
$ sudo docker build -t="ouruser/sinatra:v2" .
Uploading context  2.56 kB
Uploading context
Step 0 : FROM ubuntu:14.04
 ---> 99ec81b80c55
Step 1 : MAINTAINER Newbee <newbee@docker.com>
 ---> Running in 7c5664a8a0c1
 ---> 2fa8ca4e2a13
Removing intermediate container 7c5664a8a0c1
Step 2 : RUN apt-get -qq update
 ---> Running in b07cc3fb4256
 ---> 50d21070ec0c
Removing intermediate container b07cc3fb4256
Step 3 : RUN apt-get -qqy install ruby ruby-dev
 ---> Running in a5b038dd127e
Selecting previously unselected package libasan0:amd64.
(Reading database ... 11518 files and directories currently installed.)
Preparing to unpack .../libasan0_4.8.2-19ubuntu1_amd64.deb ...
Setting up ruby (1:1.9.3.4) ...
Setting up ruby1.9.1 (1.9.3.484-2ubuntu1) ...
Processing triggers for libc-bin (2.19-0ubuntu6) ...
 ---> 2acb20f17878
Removing intermediate container a5b038dd127e
Step 4 : RUN gem install sinatra
 ---> Running in 5e9d0065c1f7
. . .
Successfully installed rack-protection-1.5.3
Successfully installed sinatra-1.4.5
4 gems installed
 ---> 324104cde6ad
Removing intermediate container 5e9d0065c1f7
Successfully built 324104cde6ad
```
Où -t drapeau pour ajouter un tag, spécifiez les nouvelles informations de l'utilisateur en miroir. 
`"."` Est le chemin où Dockerfile (le répertoire courant), il peut être remplacé par un chemin en béton de Dockerfile.

Vous pouvez voir le processus de construction pour effectuer des opérations. Ce est la première chose à faire est de télécharger ce contenu Dockerfile,
parce que toutes les opérations doivent être effectuées en conformité avec Dockerfile.
Ensuite, Dockfile les instructions sont exécutées une par une.
Chaque étape crée un nouveau conteneur, l'exécution et de valider les modifications dans le conteneur (vient d'être présenté devant le `docker commit` le même).
Lorsque toutes les instructions sont exécutées, le retour de l'image id finale. Conteneur produit toutes les étapes intermédiaires sont retirés et nettoyés.

* A noter qu'un miroir ne peut pas être plus de 127 couches

En outre, vous pouvez utiliser `ADD` commande pour copier des fichiers locaux vers le miroir;
utiliser `EXPOSE` commande pour ouvrir les ports à l'extérieur;
avec `CMD` commande pour décrire le programme commence à courir après le récipient et ainsi de suite. Comme
```
# put my local web site in myApp folder to /var/www
ADD myApp /var/www
# expose httpd port
EXPOSE 80
# the command to run
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
```

Vous pouvez maintenant profiter de l'image nouvellement créé pour démarrer un conteneur.
```
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash
root@8196968dac35:/#
```
Vous pouvez également utiliser `docker tag` commande pour modifier l'image de l'étiquette.
```
$ sudo docker tag 5db5f8471261 ouruser/sinatra:devel
$ sudo docker images ouruser/sinatra
REPOSITORY          TAG     IMAGE ID      CREATED        VIRTUAL SIZE
ouruser/sinatra     latest  5db5f8471261  11 hours ago   446.7 MB
ouruser/sinatra     devel   5db5f8471261  11 hours ago   446.7 MB
ouruser/sinatra     v2      5db5f8471261  11 hours ago   446.7 MB
```

* Note: Pour plus d'utilisation, se il vous plaît se référer à la section [Dockerfile](../dockerfile/README.md).

### Importer à partir de système de fichiers local

A partir du système de fichiers local d'importer une image, vous pouvez utiliser OpenVZ (virtualisation technologie pionnière de conteneur)
pour créer un template: openvz adresse de téléchargement de modèle http://openvz.org/Download/templates/precreated.

Par exemple, pour télécharger un miroir ubuntu-14.04, après l'importation, utilisez la commande suivante:
```
sudo cat ubuntu-14.04-x86_64-minimal.tar.gz  |docker import - ubuntu:14.04
```
Puis voir les images nouvellement importées.
```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              14.04               05ac7c0b9383        17 seconds ago      215.5 MB
```

## Télécharger l'image

Les utilisateurs peuvent `docker push` commande pour créer leur propre image téléchargée vers le référentiel à partager.
Par exemple, après que l'utilisateur termine l'enregistrement sur Docker Hub, vous pouvez pousser votre propre image dans l'entrepôt.
```
$ sudo docker push ouruser/sinatra
The push refers to a repository [ouruser/sinatra] (len: 1)
Sending image list
Pushing repository ouruser/sinatra (3 tags)
```
