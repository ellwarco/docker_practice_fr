## Utilisez etcdctl

etcdctl est un client de ligne de commande, il peut fournir des commandes simples pour l'utilisateur d'interagir directement avec les services ETCD
sans approche basée sur les API HTTP. Il sera commode dans certains cas, tel qu'un mode d'emploi pour l'essai de services ou
de modifier le contenu d'une base de données. Nous vous recommandons également lorsque vous êtes nouveau aux opérations ETCD familiers liés par commande etcdctl,
ces opérations avec l'API HTTP est en fait correspondent.

binaires du projet ETCD inclus déjà outil etcdctl, non, de [github.com/coreos/etcd/releases](https://github.com/coreos/etcd/releases) téléchargement.

etcdctl soutient la commande suivante, généralement divisés dans les opérations de base de données et non base de données fonctionne deux types,
ce dernier sera expliquée séparément.
```
$ etcdctl -h
NAME:
   etcdctl - A simple command line client for etcd.

USAGE:
   etcdctl [global options] command [command options] [arguments...]

VERSION:
   2.0.0-rc.1

COMMANDS:
   backup	backup an etcd directory
   mk		make a new key with a given value
   mkdir	make a new directory
   rm		remove a key
   rmdir	removes the key if it is an empty directory or a key-value pair
   get		retrieve the value of a key
   ls		retrieve a directory
   set		set the value of a key
   setdir	create a new or existing directory
   update	update an existing key with a given value
   updatedir	update an existing directory
   watch	watch a key for changes
   exec-watch	watch a key for changes and exec an executable
   member	member add, remove and list subcommands
   help, h	Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --debug			output cURL commands which can be used to reproduce the request
   --no-sync			don't synchronize cluster information before sending request
   --output, -o 'simple'	output response in the given format (`simple` or `json`)
   --peers, -C 			a comma-delimited list of machine addresses in the cluster (default: "127.0.0.1:4001")
   --cert-file 			identify HTTPS client using this SSL certificate file
   --key-file 			identify HTTPS client using this SSL key file
   --ca-file 			verify certificates of HTTPS-enabled servers using this CA bundle
   --help, -h			show help
   --version, -v		print the version
```

### opérations de base de données

Base de données des opérations CRUD autour des clés et répertoires: Gestion (en ligne avec un ensemble de fonctionnement de type REST Créer) le cycle de vie complet.

touches ETCD dans l'organisation avec une structure spatiale hiérarchique (similaire au concept d'un répertoire de système de fichiers),
l'utilisateur peut spécifier un nom clés séparés tels que `testkey`, cette fois effectivement placé dans le répertoire racine `/` ci-dessous,
ou vous pouvez Pour spécifier la structure de répertoire, comme `cluster1/node2/testkey`, puis créer la structure de répertoire approprié.

*Remarque: CRUD qui créent, Read, Update, Delete, est un ensemble d'opérations en ligne avec l'API de type REST.*

#### set
Spécifiez la valeur d'une obligation. Comme
```
$ etcdctl set /testdir/testkey "Hello world"
Hello world
```
Options prises en charge comprennent:
```
--ttl '0'			Le délai clé (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
--swap-with-value Si la valeur actuelle est la valeur de clé value, l'opération réglée
--swap-with-index '0' Si les valeurs de l'indice clés sont maintenant complétée Indice, passez à mettre en place
```

#### get
Obtient la valeur de la clé spécifiée. Comme
```
$ etcdctl set testkey hello
hello
$ etcdctl update testkey world
world
```
Lorsque la clé ne existe pas, ce est une erreur. Comme
```
$ etcdctl get testkey2
Error:  100: Key not found (/testkey2) [1]
```
Les options supportées par
```
--sort Trier les résultats
--consistent La demande au noeud maître, pour assurer la cohérence de l'accès au contenu
```

#### update
Lorsque la clé existe, la valeur mise à jour du contenu. Comme
```
$ etcdctl set testkey hello
hello
$ etcdctl update testkey world
world
```

Lorsque la clé ne existe pas, ce est une erreur. Comme
```
$ etcdctl update testkey2 world
Error:  100: Key not found (/testkey2) [1]
```

Les options supportées par
```
--ttl '0' Délai (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
```

#### rm
Suppression d'une clé. Comme
```
$ etcdctl rm testkey

```

Lorsque la clé ne existe pas, ce est une erreur. Comme
```
$ etcdctl rm testkey2
Error:  100: Key not found (/testkey2) [8]
```

Les options supportées par
```
--dir	Si la clé est un répertoire vide ou supprimer paires clé-valeur
--recursive		Supprimer un répertoire et tous les sous-clés
--with-value 	Vérifiez les matchs de la valeur actuelle
--with-index '0'	Vérifiez les matchs d'index existants

```

#### mk
Si la clé donnée ne existe pas, créez une nouvelle clé. Comme
```
$ etcdctl mk /testdir/testkey "Hello world"
Hello world
```
Lorsque la clé existe, l'exécution de l'ordre est donné, par exemple,
```
$ etcdctl set testkey "Hello world"
Hello world
$ ./etcdctl mk testkey "Hello world"
Error:  105: Key already exists (/testkey) [2]
```

Les options supportées par
```
--ttl '0'	Délai (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
```

#### mkdir
Si le répertoire clé donnée ne existe pas, créez un nouveau répertoire clé. Comme
```
$ etcdctl mkdir testdir
```
Lorsque le répertoire clé existe, exécutez la commande va se plaindre, par exemple,
```
$ etcdctl mkdir testdir
$ etcdctl mkdir testdir
Error:  105: Key already exists (/testdir) [7]
```
Les options supportées par
```
--ttl '0'	Délai (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
```

#### setdir
Créer un répertoire de clés, indépendamment de la présence ou de l'absence.

Les options supportées par
```
--ttl '0'	Délai (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
```

#### updatedir
Mettre à jour un répertoire existant. Les options supportées par
```
--ttl '0' Délai (en secondes) ne est pas configuré (par défaut est 0) ne est jamais le temps
```

#### rmdir
Supprimer un répertoire vide, ou la paire de clés.

Si le répertoire ne est pas vide, il sera l'erreur
```
$ etcdctl set /dir/testkey hi
hi
$ etcdctl rmdir /dir
Error:  108: Directory not empty (/dir) [13]
```

#### ls
Touche ou sous-répertoires listés dans le répertoire (par défaut est le répertoire racine), la valeur par défaut ne affiche pas le contenu des sous-répertoires.

Comme
```
$ ./etcdctl set testkey 'hi'
hi
$ ./etcdctl set dir/test 'hello'
hello
$ ./etcdctl ls
/testkey
/dir
$ ./etcdctl ls dir
/dir/test
```

Les options supportées comprennent
```
--sort La sortie de la sorte
--recursive Se il ya un sous-répertoire sous le contenu du répertoire de façon récursive sortie
-p	Pour le répertoire de sortie, le dernier ajouté `/` de distinguer
```

### Les opérations non-base de données

#### sauvegarde

Données de sauvegarde ETCD.

Les options supportées comprennent
```
--data-dir 		etcd Le répertoire des données
--backup-dir 	Retour à la chemin spécifié
```
#### watch
Le suivi d'un changement de clé, clé de mise à jour arrive une fois, il va afficher la dernière valeur et la sortie.

Par exemple, un utilisateur met à jour TestKey clé Hello World.
```
$ etcdctl watch testkey
Hello world
```

Les options supportées comprennent
```
--forever		Surveillés en permanence jusqu'à l'utilisateur appuie sur `CTRL+C` exit
--after-index '0'	Été contrôlé avant l'index spécifié
--recursive	Retournez toutes les clés et sous-clés
```
#### exec-watch
Le suivi d'un changement de clé, une fois la mise à jour se produit clé, exécutez la commande donnée.

Par exemple, les mises à jour utilisateur clé TestKey.
```
$etcdctl exec-watch testkey -- sh -c 'ls'
default.etcd
Documentation
etcd
etcdctl
etcd-migrate
README-etcdctl.md
README.md
```

Les options supportées comprennent
```
--after-index '0'	Été contrôlé avant l'index spécifié
--recursive	Retournez toutes les clés et sous-clés
```

#### member
Grâce aux commandes list, add, remove pour  lister, ajouter, supprimer instance ETCD à ETCD cluster.

Démarrer une ETCD comme instance de service local, vous pouvez utiliser la commande suivante pour la visualiser.

```
$ etcdctl member list
ce2a822cea30bfca: name=default peerURLs=http://localhost:2380,http://localhost:7001 clientURLs=http://localhost:2379,http://localhost:4001

```
### Options de commande
* `--debug` cURL de sortie commande pour afficher le temps d'exécuter une demande de commande à l'initiative
* `--no-sync` synchronisation pôle informations avant de faire la demande
* `--output, -o 'simple` format de sortie (`simple` est l'information originale, `json` format JSON d'effectuer un décodage, une meilleure lisibilité)
* `--peers, -C` informations compagnons groupe désigné, séparées par des virgules (par défaut: "127.0.0.1:4001")
* `--cert-file` sous HTTPS fichier de certificat SSL utilisé par le client
* `--key-file` sous HTTPS SSL fichiers clés utilisés par le client
* `--ca-file` serveur en utilisant le protocole HTTPS, en utilisant les fichiers de CA pour vérifier
* `--help, -h` commande pour afficher des informations d'aide
* `--version, -v` impression informations de version
