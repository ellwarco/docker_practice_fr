## Créer un miroir

Après leur achèvement Dockerfile, par `docker build` commande pour créer un miroir.

Le format de base pour `docker build [选项] 路径`, la commande va lire le chemin d'accès spécifié (y compris les sous-répertoires) Dockerfile,
et tout le contenu est envoyé sur le chemin vers le côté de service Docker, le côté serveur pour créer un miroir. Il est généralement recommandé
de placer Dockerfile des répertoires qui sont vides. Vous pouvez également `.dockerignore` de faire le chemin du répertoire et déposer Docker
ignorer les fichiers (chaque ligne pour ajouter un motif de correspondance).

Pour spécifier les informations d'étiquette reflétée par `-t` option, par exemple,

```
$ sudo docker build -t myrepo/myapp /tmp/test1/
```
