## Obtenez un miroir

Vous pouvez utiliser le `docker pull` commande pour obtenir l'image souhaitée de l'entrepôt.

L'exemple suivant de l'entrepôt Docker Hub télécharger une image Ubuntu 12.04 du système d'exploitation.
```
$ sudo docker pull ubuntu:12.04
Pulling repository ubuntu
ab8e2728644c: Pulling dependent layers
511136ea3c5a: Download complete
5f0ffaa9455e: Download complete
a300658979be: Download complete
904483ae0c30: Download complete
ffdaafd1ca50: Download complete
d047ae21eeaf: Download complete
```
Le processus de téléchargement sera émis pour obtenir des informations sur chaque couche du miroir.

Cette commande est en fait l'équivalent de `$ sudo docker pull registry.hub.docker.com/ubuntu:12.04` commande, du serveur d'enregistrement `registry.hub.docker.com` d' `ubuntu` pour télécharger marque entrepôt `12.04` miroir.

Parfois, le téléchargement de serveur d'enregistrement dépositaire officiel est lent, vous pouvez télécharger d'autres entrepôts. Vous devez spécifier l'adresse complète de serveur d'enregistrement d'un autre téléchargement de l'entrepôt de stockage. Comme
```
$ sudo docker pull dl.dockerpool.com:5000/ubuntu:12.04
Pulling dl.dockerpool.com:5000/ubuntu
ab8e2728644c: Pulling dependent layers
511136ea3c5a: Download complete
5f0ffaa9455e: Download complete
a300658979be: Download complete
904483ae0c30: Download complete
ffdaafd1ca50: Download complete
d047ae21eeaf: Download complete
```

À la fin, vous pouvez toujours utiliser le miroir, comme la création d'un conteneur, qui permet aux applications de se exécuter bash.
```
$ sudo docker run -t -i ubuntu:12.04 /bin/bash
root@fe7fc4bd8fc9:/#
```
