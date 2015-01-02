## Sauvegarder et charger l'image

### Gardez le miroir
Si vous voulez exporter l'image pour un fichier local, vous pouvez utiliser le `docker save` commande.
```
$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              14.04               c4ff7513909d        5 weeks ago         225.4 MB
...
$sudo docker save -o ubuntu_14.04.tar ubuntu:14.04
```

### Chargement de l'image

Vous pouvez utiliser la `docker load` à partir de fichiers locaux, puis exporté dans la bibliothèque locale de l'image, par exemple,
```
$ sudo docker load --input ubuntu_14.04.tar
```
Ou
```
$ sudo docker load < ubuntu_14.04.tar
```
Cela importera l'image et ses informations de métadonnées associées (y compris les étiquettes, etc.).
