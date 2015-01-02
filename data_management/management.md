## volume de conteneur à l'aide des données à sauvegarder, restaurer, migrer des volumes de données

Vous pouvez utiliser le volume de données sur lequel la sauvegarde de données, la récupération et la migration.

### Sauvegarde

Première utilisation `--volumes-from` tag pour créer un volume de conteneurs dbdata de chargement des conteneurs,
et à partir de l'hôte local pour monter le répertoire courant contenant `/backup`. De commande est le suivant:
```
$ sudo docker run --volumes-from dbdata -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata
```
Après le conteneur a commencé, utilisez le `tar` commande pour dbdata sauvegarde de volume pour locale `/backup/backup.tar`.

### Récupération

Si vous souhaitez restaurer les données à un conteneur, le conteneur dbdata2 d'abord créer un volume de données avec le.
```
$ sudo docker run -v /dbdata --name dbdata2 ubuntu /bin/bash
```
Ensuite, créez un autre récipient, montez conteneurs dbdata2 et utiliser `untar` extraire fichier de sauvegarde pour monter le volume de conteneurs.
```
$ sudo docker run --volumes-from dbdata2 -v $(pwd):/backup busybox tar xvf
/backup/backup.tar
```
