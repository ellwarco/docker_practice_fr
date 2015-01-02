## profil d'entrepôt

Registre de Docker en utilisant le fichier de configuration fournit un certain modèle d'entrepôt (arôme),
l'utilisateur peut les utiliser directement pour le développement ou le déploiement de production.

### Modèle

Dans `config_sample.yml` fichier, vous pouvez voir une partie de la section des modèles prêts à l'emploi:

* `common` : Configuration de base
* `local` : les données stockées dans le système de fichiers local
* `s3` stockent des données dans l'AWS S3:
* `dev` : utilisation local configuration de base de modèle
* `test` : test Unité utilisant
* `prod` configuration de l'environnement de production (essentiellement de configuration similaire avec s3):
* `gcs` : stocker des données vers le cloud de stockage de Google
* `swift` : données sur les services de stockage à OpenStack Swift
* `glance` : stocker des données aux services Glance OpenStack, sauvegarde du système de fichiers local
* `glance-swift` : Services de stockage de données à bref OpenStack, Swift pour la sauvegarde
* `elliptics` : stocker des données à la clé Elliptics / mémoire de valeur

Les utilisateurs peuvent également ajouter la section des modèles personnalisés.

Par modèle par défaut en utilisant `dev`, vous voulez utiliser un modèle par défaut, vous pouvez ajouter `SETTINGS_FLAVOR` à des variables environnementales, telles que
```
export SETTINGS_FLAVOR=dev
```
En outre, le support de fichier de configuration pour les valeurs de chargement de la syntaxe variable d'environnement est `_env:VARIABLENAME[:DEFAULT]`.

### Exemple de configuration
```
common:
    loglevel: info
    search_backend: "_env:SEARCH_BACKEND:"
    sqlalchemy_index_database:
        "_env:SQLALCHEMY_INDEX_DATABASE:sqlite:////tmp/docker-registry.db"

prod:
    loglevel: warn
    storage: s3
    s3_access_key: _env:AWS_S3_ACCESS_KEY
    s3_secret_key: _env:AWS_S3_SECRET_KEY
    s3_bucket: _env:AWS_S3_BUCKET
    boto_bucket: _env:AWS_S3_BUCKET
    storage_path: /srv/docker
    smtp_host: localhost
    from_addr: docker@myself.com
    to_addr: my@myself.com

dev:
    loglevel: debug
    storage: local
    storage_path: /home/myself/docker

test:
    storage: local
    storage_path: /tmp/tmpdockertmp
```

### Options
