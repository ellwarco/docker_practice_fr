## Mappage de port de conteneurs pour atteindre l'hôte d'accueil

Par défaut, le récipient peut accéder activement à la connexion de réseau externe, mais le réseau externe ne peut pas accéder au conteneur.

### L'accès à des outils externes des récipients

Tout récipient est connecté au réseau externe, l'adresse IP source de l'adresse NAT sera le coût du système.
Ceci est fait en utilisant iptables opérations de camouflage adresse de la source sont appliquées.

Voir règles NAT hôte.
```
$ sudo iptables -t nat -nL
...
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  172.17.0.0/16       !172.17.0.0/16
...
```
Parmi eux, les règles ci-dessus seront tous adresses source `172.17.0.0/16` segment de réseau, l'adresse de destination pour d'autres segments de réseau (réseau externe)
de la circulation émanant du système de carte de camouflage dynamique. SNAT MASQUERADE avec les avantages traditionnels est qu'il peut obtenir de façon dynamique
des adresses à partir de la carte réseau.

### L'accès externe au récipient pour parvenir

Les conteneurs permettent l'accès externe, vous pouvez `docker run` travers quand `-p` ou `-P` pour permettre paramètre.

Peu importe le genre de manière, il est en fait la locale `iptable` ajouter les règles appropriées de table nat.

Utilisez `-P` lorsque:
```
$ iptables -t nat -nL
...
Chain DOCKER (2 references)
target     prot opt source               destination
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:49153 to:172.17.0.2:80
```

Utilisez `-p 80:80` lorsque:
```
$ iptables -t nat -nL
Chain DOCKER (2 references)
target     prot opt source               destination
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:80 to:172.17.0.2:80
```
Remarque:

* Voici la règle mappé 0.0.0.0, ce qui signifie l'hôte accepter le trafic de toutes les interfaces.
Les utilisateurs peuvent `-p IP:host_port:container_port` ou `-p IP::port` sur l'hôte de préciser permis l'accès à l'adresse IP du récipient, interfaces, etc.,
d'introduire des règles plus strictes.
* Si vous voulez lié en permanence à une adresse IP fixe, vous pouvez configurer le fichier Docker `/etc/default/docker` spécifiées
`DOCKER_OPTS="--ip=IP_ADDRESS"` , pour prendre effet après un service Docker de redémarrage.
