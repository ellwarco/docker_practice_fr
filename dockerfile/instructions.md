## Instruction

Le format général de l'enseignement est `INSTRUCTION arguments`, l'instruction comprend `FROM`, `MAINTAINER`, `RUN`, etc.

### FROM
Format `FROM <image>` ou `FROM <image>:<tag>`。

La première instruction doit `FROM` commande. Aussi, lorsque vous créez plus d'un miroir dans le même Dockerfile, vous pouvez utiliser plusieurs `FROM`
instruction (chaque miroir une fois).

### MAINTAINER
Format pour`MAINTAINER <name>`, indiquez les informations concernant les mainteneurs.

### RUN
Format`RUN <command>` ou`RUN ["executable", "param1", "param2"]`。

L'ancien se déroulera dans un shell de commande terminal `/bin/sh -c`;
celui-ci est utilisé `exec` exécutés. Désigné par le deuxième terminal peut utiliser d'autres moyens, tels que `RUN ["/bin/bash", "-c", "echo hello"]`.

Chaque `RUN` commande exécuter la commande spécifiée sur la base du miroir de courant, et soumis à une nouvelle image. Lorsque la commande
est plus peuvent utiliser ``\` au saut de ligne.

### CMD
Prend en charge trois formats
* `CMD ["executable","param1","param2"]`utiliser `exec` exécution, la méthode recommandée;
* `CMD command param1 param2` dans `/bin/sh` est exécuté, pourvu que la demande a besoin d'interagir;
* `CMD ["param1","param2"]` disponible pour `ENTRYPOINT` paramètres par défaut;

Spécifiez la commande pour démarrer la mise en œuvre du conteneur, il peut y avoir un seul par Dockerfile `CMD` commande.
Si vous spécifiez plusieurs commandes, seule la dernière sera exécutée.

Si l'utilisateur spécifie la commande pour démarrer un conteneur quand il est lancé, il écrasera le `CMD` commande spécifiée.

### EXPOSE
Format `EXPOSE <port> [<port>...]`。

Dire le numéro de port du serveur conteneurs Docker exposés pour les systèmes interconnectés.
Lorsque le conteneur doit commencer par -P, Docker hôte attribue automatiquement un port transmis au port spécifié.

### ENV
Format `ENV <key> <value>`。
Indique une variable d'environnement, par la suite `RUN` utilisation de commande, et de maintenir le conteneur à l'exécution.

Comme
```
ENV PG_MAJOR 9.3
ENV PG_VERSION 9.3.4
RUN curl -SL http://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgress && …
ENV PATH /usr/local/postgres-$PG_MAJOR/bin:$PATH
```

### ADD
Format `ADD <src> <dest>`。

Cette commande copie spécifié `<src>` dans le conteneur `<dest>`. Où `<src>`` peut être un chemin relatif au répertoire où Dockerfile;
il peut être une URL; peut aussi être un fichier tar (extraire automatiquement le répertoire).

### COPY
Format `COPY <src> <dest>`。

Copiez l'hôte local `<src>`（chemin relatif au répertoire où Dockerfile）dans le conteneur  `<dest>`。

Lorsque vous utilisez un répertoire local que le répertoire source, il est recommandé d'utiliser `COPY`.

### ENTRYPOINT
Deux formats：
* `ENTRYPOINT ["executable", "param1", "param2"]`
* `ENTRYPOINT command param1 param2`（shell execute).

commande de configuration pour démarrer la mise en œuvre du conteneur, et ne peut être `docker run` couvrant argument.

Seulement un pour Dockerfile `ENTRYPOINT`, lorsque vous spécifiez plus d'un, seul le dernier apparition.

### VOLUME
Format `VOLUME ["/data"]`.

Vous pouvez créer un support de l'hôte local ou un autre récipient point de montage,
généralement utilisé pour stocker la base de données et la nécessité de conserver les données.

### USER
Format `USER daemon`.

Indiquez le nom d'utilisateur de conteneurs courir ou UID, après `RUN` utilisera l'utilisateur spécifié.

Lorsque le service ne nécessite pas des privilèges d'administrateur, vous pouvez spécifier l'utilisateur exécutant par cette commande.
Et vous pouvez créer un utilisateur a besoin avant, par exemple: `RUN groupadd -r postgres && useradd -r -g postgres postgres`.
Pour obtenir temporairement des privilèges d'administrateur peuvent utiliser `gosu`, non recommandé `sudo`.

### WORKDIR
Format `WORKDIR /path/to/workdir`.

Pour la suite `RUN`、`CMD`、`ENTRYPOINT` commande pour configurer le répertoire de travail.

Vous pouvez utiliser plusieurs `WORKDIR` instruction, les commandes ultérieures si l'argument est un chemin relatif, il précisera sur la voie de commande avant.
Comme
```
WORKDIR /a
WORKDIR b
WORKDIR c
RUN pwd
```
Le chemin final est `/a/b/c`.

### ONBUILD
Format `ONBUILD [INSTRUCTION]`.

Lorsque la configuration de miroir comme les instructions d'exploitation créé la base pour la création d'un autre nouveau miroir reflétaient celles effectuées.

Par exemple, le contenu Dockerfile créée en utilisant l'image `image-A`.
```
[...]
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
[...]
```

Si vous créez une nouvelle image basée sur l'image-A, utilisé dans le nouveau Dockerfile `FROM image-A` image de base est spécifié,
il exécute automatiquement `ONBUILD` contenu d'instruction, équivaut à ajouter les deux instructions dans le dos.
```
FROM image-A

#Automatically run the following
ADD . /app/src
RUN /usr/local/bin/python-build --dir /app/src
```

Utilisez `ONBUILD` directive miroir recommandées sur l'étiquette indiquer, par exemple  `ruby:1.9-onbuild`.
