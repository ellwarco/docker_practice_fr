## pont personnalisé

En plus de la valeur par défaut `docker0` pont, l'utilisateur peut également spécifier un pont pour relier les différents conteneurs.

Docker démarrer le service, utilisez `-b BRIDGE` ou `--bridge=BRIDGE` pour spécifier l'utilisation du pont.

Si le service est déjà en cours d'exécution, alors vous devez arrêter le service, et enlever le vieux pont.
```
$ sudo service docker stop
$ sudo ip link set dev docker0 down
$ sudo brctl delbr docker0
```
Ensuite, créez un pont `bridge0`。
```
$ sudo brctl addbr bridge0
$ sudo ip addr add 192.168.5.1/24 dev bridge0
$ sudo ip link set dev bridge0 up
```
Voir que les ponts créés et ouvertes.
```
$ ip addr show bridge0
4: bridge0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state UP group default
    link/ether 66:38:d0:0d:76:18 brd ff:ff:ff:ff:ff:ff
    inet 192.168.5.1/24 scope global bridge0
       valid_lft forever preferred_lft forever
```
Configuration de service Docker, la valeur par défaut sur le pont pour créer un pont.
```
$ echo 'DOCKER_OPTS="-b=bridge0"' >> /etc/default/docker
$ sudo service docker start
```
Démarrez le service Docker.
Créez un conteneur, vous pouvez voir qu'il a été comblé à un `bridge0` sur.

Vous pouvez continuer à utiliser `brctl show` commande pour afficher des informations sur le pont.
En outre, le conteneur peut être utilisé `ip addr` et `ip route` pour voir la configuration d'adresse IP et les informations de routage des commandes.
