## récipient de volume de données

Si vous avez un besoin de mettre à jour en permanence les données partagées entre le conteneur, il est préférable de créer un volume de données conteneurs.

récipient de volume de données, en fait, un récipient normale, conçu pour fournir des données pour d'autres récipients monté volumes.

Tout d'abord, créer un conteneur dbdata de volume de données nommée:
```
$ sudo docker run -d -v /dbdata --name dbdata training/postgres echo Data-only container for postgres
```
Ensuite, utilisez les autres récipients `--volumes-from` montage dbdata volumes de données de conteneur.
```
$ sudo docker run -d --volumes-from dbdata --name db1 training/postgres
$ sudo docker run -d --volumes-from dbdata --name db2 training/postgres
```
Vous pouvez également utiliser plusieurs `--volumes-from` argument pour monter plusieurs volumes de données à partir de plusieurs conteneurs.
Vous pouvez également avoir monté un récipient à partir d'autres volumes de conteneurs de monter des volumes de données.
```
$ sudo docker run -d --name db3 --volumes-from db1 training/postgres
```
* Remarque: Utilisez `--volumes-from` conteneur volumes de données de paramètres sont montés lui-même ne ont pas besoin d'être dans l'état de fonctionnement.

Si vous supprimez les conteneurs de montage (y compris dbdata, DB1 et DB2), les volumes de données et ne sont pas supprimés automatiquement.
Si vous voulez supprimer un volume de données doit également être monté avec une suppression de la dernière de son conteneur en cours d'utilisation
`docker rm -v` commande pour spécifier le même temps supprimer le conteneur associé. Cela permet aux utilisateurs de mettre à niveau et
de déplacer des données entre le volume de conteneurs. Des actions spécifiques seront expliquées dans la section suivante.
