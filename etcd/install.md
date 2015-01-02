## Installation

Aller langage basé ETCD, afin que les utilisateurs peuvent à partir de [la page d'accueil](https://github.com/coreos/etcd)
de projet pour télécharger le code source à compiler, vous pouvez également télécharger les fichiers binaires compilés,
ou même directement Docker fichier image pour faire une bonne expérience.

### Téléchargement de fichier binaire

Binaires compilés sont [github.com/coreos/etcd/releases](https://github.com/coreos/etcd/releases/) page,
l'utilisateur peut sélectionner la version désirée, ou en téléchargeant le téléchargement de l'outil.

Par exemple, la commande suivante utilise l'outil curl pour télécharger compressé et décompressé.
```
curl -L  https://github.com/coreos/etcd/releases/download/v2.0.0-rc.1/etcd-v2.0.0-rc.1-linux-amd64.tar.gz -o etcd-v2.0.0-rc.1-linux-amd64.tar.gz
tar xzvf etcd-v2.0.0-rc.1-linux-amd64.tar.gz
cd etcd-v2.0.0-rc.1-linux-amd64
```

Après le déballage, vous pouvez voir le fichier comprend
```
$ ls
etcd  etcdctl  etcd-migrate  README-etcdctl.md  README.md
```

Service ETCD qui est le fichier principal, etcdctl est disponible pour la commande client de l'utilisateur, ETCD migrent responsable de la migration.

Recommandé par commande suivante effectue trois fichiers dans le répertoire système `/usr/local/bin/` ou `/usr/bin/`。

```
$ sudo cp etcd* /usr/local/bin/
```
Exécutez ETCD, les composants par défaut d'un cluster à deux noeuds. Le serveur de base de données par défaut écoute sur le port 2379 et 4001,
par exemple ETCD écoute sur le port 2380 et 7001. Affichage similaire à l'information suivante:
```
$ ./etcd
2014/12/31 14:52:09 no data-dir provided, using default data-dir ./default.etcd
2014/12/31 14:52:09 etcd: listening for peers on http://localhost:2380
2014/12/31 14:52:09 etcd: listening for peers on http://localhost:7001
2014/12/31 14:52:09 etcd: listening for client requests on http://localhost:2379
2014/12/31 14:52:09 etcd: listening for client requests on http://localhost:4001
2014/12/31 14:52:09 etcdserver: name = default
2014/12/31 14:52:09 etcdserver: data dir = default.etcd
2014/12/31 14:52:09 etcdserver: snapshot count = 10000
2014/12/31 14:52:09 etcdserver: advertise client URLs = http://localhost:2379,http://localhost:4001
2014/12/31 14:52:09 etcdserver: initial advertise peer URLs = http://localhost:2380,http://localhost:7001
2014/12/31 14:52:09 etcdserver: initial cluster = default=http://localhost:2380,default=http://localhost:7001
2014/12/31 14:52:10 etcdserver: start member ce2a822cea30bfca in cluster 7e27652122e8b2ae
2014/12/31 14:52:10 raft: ce2a822cea30bfca became follower at term 0
2014/12/31 14:52:10 raft: newRaft ce2a822cea30bfca [peers: [], term: 0, commit: 0, lastindex: 0, lastterm: 0]
2014/12/31 14:52:10 raft: ce2a822cea30bfca became follower at term 1
2014/12/31 14:52:10 etcdserver: added local member ce2a822cea30bfca [http://localhost:2380 http://localhost:7001] to cluster 7e27652122e8b2ae
2014/12/31 14:52:11 raft: ce2a822cea30bfca is starting a new election at term 1
2014/12/31 14:52:11 raft: ce2a822cea30bfca became candidate at term 2
2014/12/31 14:52:11 raft: ce2a822cea30bfca received vote from ce2a822cea30bfca at term 2
2014/12/31 14:52:11 raft: ce2a822cea30bfca became leader at term 2
2014/12/31 14:52:11 raft.node: ce2a822cea30bfca elected leader ce2a822cea30bfca at term 2
2014/12/31 14:52:11 etcdserver: published {Name:default ClientURLs:[http://localhost:2379 http://localhost:4001]} to cluster 7e27652122e8b2ae
```
À ce stade, vous pouvez utiliser le test commande etcdctl définir et obtenir la clé `testkey: "hello world"`, vérifiez ETCD service est démarré avec succès:
```
$ ./etcdctl set testkey "hello world"
hello world
$ ./etcdctl get testkey
hello world
```
Service Description ETCD a été lancé avec succès.

Bien sûr, vous pouvez également accéder au port local 2379 ou 4001 par voie de HTTP pour fonctionner, telles que l'affichage `testkey` valeurs:
```
$ curl -L http://localhost:4001/v2/keys/testkey
{"action":"get","node":{"key":"/testkey","value":"hello world","modifiedIndex":3,"createdIndex":3}}
```

### Docker téléchargement miroir

Miroir nom quay.io/coreos/etcd:v2.0.0_rc.1, vous pouvez commencer à écouter le service 4001 port ETCD par la commande suivante.
```
$ sudo docker run -p 4001:4001 -v /etc/ssl/certs/:/etc/ssl/certs/ quay.io/coreos/etcd:v2.0.0_rc.1
```
