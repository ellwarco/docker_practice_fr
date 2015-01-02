## Conteneur de contrôle d'accès

contrôle d'accès de conteneurs, principalement par le biais sur Linux `iptables` gestion et la mise en œuvre pare-feu. `iptables` est la valeur par défaut sur
le logiciel de pare-feu Linux, livré avec la plupart des rejets.

### Conteneur pour accéder au réseau externe

Container Pour accéder au réseau externe, vous devez être transmis à soutenir le système local. Sur les systèmes Linux, vérifiez la transmission est activée.
```
$sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 1
```
Si elle est nulle, indiquant pas en avant ouverts, vous aurez besoin d'ouvrir manuellement.
```
$sysctl -w net.ipv4.ip_forward=1
```
Si le service est configuré pour démarrer lorsque Docker `--ip-forward=true`, Docker règle automatiquement le système `ip_forward` paramètre à 1.

### L'accès entre le récipient

Visites mutuelles entre le conteneur, la nécessité de soutenir à la fois.

* Si le récipient a été connecté topologie du réseau. Par défaut, tous les conteneurs seront connectés à `docker0` le pont.
* Pare-feu locaux du système logiciel - `iptables` est autorisé à traverser.

### Accès à tous les ports

Lorsque le démarrage du service Docker, le défaut va ajouter une politique de transfert de la chaîne FORWARD de iptables.
Stratégie par ( `ACCEPT` ) ou désactivé ( `DROP` ) selon la configuration `--icc=true` (par défaut) ou `--icc=false`.
Bien sûr, si vous spécifiez manuellement `--iptables=false` ne pas ajouter `iptables` règles.

Visible, par défaut, est de permettre l'interopérabilité entre les différents réseaux de conteneur.
Si pour des raisons de sécurité dans `/etc/default/docker` profil `DOCKER_OPTS=--icc=false` pour le désactiver.

### L'accès au port spécifié

Par -icc=false accès réseau fermé, vous pouvez également passer --link=CONTAINER_NAME:ALIAS option pour ouvrir l'accès au port de conteneurs.

Par exemple, lorsque vous démarrez les services Docker, vous pouvez utiliser icc=false --iptables=true paramètre d'arrêter pour permettre l'accès au réseau à l'autre, et de laisser le système peut être modifié Docker iptables règles.

À ce stade, le système `iptables` règles peuvent être similaires
```
$ sudo iptables -nL
...
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0
...
```
Après cela, démarrez le conteneur ( `docker run` ) lorsqu'il est utilisé `--link=CONTAINER_NAME:ALIAS` option. Docker dans `iptable` ont été ajoutés
à un deux conteneurs `ACCEPT` règles pour permettre l'accès mutuel aux ouvrir des ports (en fonction de la ligne EXPOSE Dockerfile).

Lorsque vous ajoutez un `--link=CONTAINER_NAME:ALIAS` après l'option d'ajouter les `iptables` règles.
```
$ sudo iptables -nL
...
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  172.17.0.2           172.17.0.3           tcp spt:80
ACCEPT     tcp  --  172.17.0.3           172.17.0.2           tcp dpt:80
DROP       all  --  0.0.0.0/0            0.0.0.0/0
```

Remarque: `--link=CONTAINER_NAME:ALIAS` dans `CONTAINER_NAME` Docker doivent maintenant être affectés nom, ou utilisez le `--name` paramètre pour spécifier le nom.
Nom de l'hôte ne est pas reconnu.
