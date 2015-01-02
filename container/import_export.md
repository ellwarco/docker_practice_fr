##conteneur d'exportation et à l'importation

###conteneurs d'exportation

Si vous voulez exporter un conteneur sur place, vous pouvez utiliser le `docker export` commande.
```
$ sudo docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                    PORTS               NAMES
7691a814370e        ubuntu:14.04        "/bin/bash"         36 hours ago        Exited (0) 21 hours ago                       test
$ sudo docker export 7691a814370e > ubuntu.tar
```
Cela exporter l'instantané de conteneurs dans un fichier local.

### Importer un instantané du conteneur

Vous pouvez utiliser le `docker import` fichier, puis importer l'instantané du récipient comme un miroir, par exemple,
```
$ cat ubuntu.tar | sudo docker import - test/buntu:v1.0
$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
test/ubuntu         v1.0                9d37a6082e97        About a minute ago   171.3 MB
```
En outre, vous pouvez également importer en spécifiant une URL ou un répertoire, par exemple
```
$sudo docker import http://example.com/exampleimage.tgz example/imagerepo
```

* Note: L'utilisateur peut soit utiliser la `docker load` à importer des fichiers image stockés base de données en miroir local,
vous pouvez également utiliser `docker import` pour importer un conteneur à une bibliothèque d'image instantanée locale.
La différence entre les deux est que le conteneur va baisser toute l'histoire de fichiers instantané et les informations de métadonnées
(ce est à dire, le gain de temps est seulement un instantané de l'état du conteneur), et le fichier de stockage en miroir sera sauvé dossier complet,
le volume devrait être grande. En outre, vous pouvez réaffecter les informations de métadonnées étiquettes de conteneurs à partir du fichier de l'instantané importation.
