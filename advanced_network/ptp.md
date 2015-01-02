## Exemple: Création d'une connexion point à point

Par défaut, Docker tout sera relié au récipient par `docker0` fournissent sous-réseau virtuel.

Les utilisateurs ont parfois besoin d'être en mesure de communiquer directement connecté entre les deux récipients, plutôt que comblé par un pont hôte.

La solution est simple: créer une paire de `peer` interfaces, respectivement placés dans deux conteneurs, peut être configuré pour pointer type de lien.

Premier départ deux conteneurs:
```
$ sudo docker run -i -t --rm --net=none base /bin/bash
root@1f1f4c1f931a:/#
$ sudo docker run -i -t --rm --net=none base /bin/bash
root@12e343489d2f:/#
```

Trouver l'ID du processus, et puis créer un nom de fichier espace de trace réseau.
```
$ sudo docker inspect -f '{{.State.Pid}}' 1f1f4c1f931a
2989
$ sudo docker inspect -f '{{.State.Pid}}' 12e343489d2f
3004
$ sudo mkdir -p /var/run/netns
$ sudo ln -s /proc/2989/ns/net /var/run/netns/2989
$ sudo ln -s /proc/3004/ns/net /var/run/netns/3004
```

Création d'une paire de `peer` interface, puis configurer le routage
```
$ sudo ip link add A type veth peer name B

$ sudo ip link set A netns 2989
$ sudo ip netns exec 2989 ip addr add 10.1.1.1/32 dev A
$ sudo ip netns exec 2989 ip link set A up
$ sudo ip netns exec 2989 ip route add 10.1.1.2/32 dev A

$ sudo ip link set B netns 3004
$ sudo ip netns exec 3004 ip addr add 10.1.1.2/32 dev B
$ sudo ip netns exec 3004 ip link set B up
$ sudo ip netns exec 3004 ip route add 10.1.1.1/32 dev B
```
Or, ces deux conteneurs peuvent cingler l'autre, et avec succès établir une connexion. À point liens et ne ont pas besoin d'un masque de sous-réseau.

En outre, vous ne pouvez pas spécifier `--net=none` pour créer une liaison point à point. Ces récipients peuvent également communiquer à travers le réseau d'origine.

Utilisation de la même façon, vous pouvez créer un conteneur avec seulement les communications hôte. Mais dans des circonstances normales,
mais recommandé `--icc=false` pour fermer la communication entre les conteneurs.
