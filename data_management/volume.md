## Les volumes de données

Le volume de données est un conteneur pour un ou plusieurs répertoires spéciaux, il contourne l'UFS, peuvent fournir beaucoup de fonctionnalités utiles:
* Les volumes de données peuvent être partagées et réutilisées entre le récipient
* les changements de volume de données prendront effet immédiatement
* Les mises à jour le volume de données ne seront pas affecter l'image
* Volume existera toujours jusqu'à ce qu'il n'y a pas de conteneurs

* L'utilisation du volume de données, similaire au répertoire Linux ou un fichier à monter.

### Création d'un volume de données
Avec `docker run` commande de temps, utilisez `-v` drapeau pour créer un volume de données et de monter dans le récipient. Plusieurs fois run en une seule opération en plusieurs volumes de données peuvent être montés.

Ce qui suit va créer un conteneur Web et chargé dans un volume de données du conteneur `/webapp` répertoire.
```
$ sudo docker run -d -P --name web -v /webapp training/webapp python app.py
```
* Remarque: Vous pouvez également utiliser la Dockerfile l'`VOLUME` pour ajouter un ou plusieurs nouveaux volumes à ne importe quel conteneur de l'image créée.

### Monter un répertoire hôte que le volume de données

Utilisez `-v` drapeau est également possible de spécifier un répertoire pour monter un hôte local au conteneur d'aller.
```
$ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py
```
Les charges de commande ci-dessus l'hôte `/src/webapp` répertoire pour le conteneur `/opt/webapp` répertoire.
Cette fonction est très pratique lorsque vous prenez le test, comme l'utilisateur peut placer certains programmes dans un répertoire local,
pour voir si le conteneur fonctionne correctement. Chemin du répertoire local doit être un chemin absolu,
si le répertoire ne existe pas Docker créera automatiquement pour vous.

* Note: Dockerfile pas en charge cette utilisation, ce est parce que Dockerfile est utilisé pour la transplantation et le partage. Cependant, le format de la voie ne est pas la même pour les différents systèmes d'exploitation, il ne est toujours pas en charge.

Docker montage autorisations par défaut pour lire et écrire des volumes de données, les utilisateurs peuvent également `:ro` désigné en lecture seule.

```
$ sudo docker run -d -P --name web -v /src/webapp:/opt/webapp:ro
training/webapp python app.py
```
Ajouté `:ro` après montée en lecture seule.

### Montez un fichier hôte local comme un volume de données

`-v` drapeau est également possible de monter un fichier unique de l'hôte vers le récipient
```
$ sudo docker run --rm -it -v ~/.bash_history:/.bash_history ubuntu /bin/bash
```
Cela peut être enregistrée dans la cuve eu commandes entrées.

*Note: Si le montage direct d'un fichier, de nombreux fichiers, y compris des outils d'édition `vi` ou `sed --in-place`,
peut causer des changements dans le fichier inode du Docker 1.1.0 partir, cela se traduira par un message d'erreur signalée.
Donc, la meilleure façon de monter directement dans le répertoire parent du fichier.
