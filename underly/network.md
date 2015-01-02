## réseaux de Docker

Les réseaux de docker est l'utilisation du réseau est en fait l'espace de nom et périphériques réseau virtuelle (en particulier la paire veth) Linux sur.
Recommandons de vous familiariser avec les concepts de base des deux parties de la re-lire ce chapitre.

### Fondamental

Tout d'abord, la communication réseau, la machine nécessite au moins un (interface physique ou virtuel) interface réseau pour
envoyer et recevoir des paquets de données; En outre, si vous voulez communiquer entre les différents sous-réseaux nécessite mécanisme de routage.

Les interfaces réseau sont Docker interfaces virtuelles par défaut. L'un des avantages des interfaces virtuelles est plus grande efficacité de transfert.
En effectuant la réplication de données noyau Linux pour obtenir des données d'expéditeur interface virtuelle entre l'interface de mémoire tampon d'émission
à envoyer les paquets sont copiés directement à l'orifice de réception du tampon de réception. Pour les systèmes locaux et les conteneurs dans le système
apparaît comme une carte Ethernet normale, mais il n'a pas vraiment communique pas avec l'équipement de réseau externe, beaucoup plus rapide.

Réseau de récipient Docker sur l'utilisation de cette technologie. Il crée une interface virtuelle, respectivement, à l'intérieur de l'hôte local
et le conteneur et le laisser à communiquer les uns avec les autres (par exemple une paire d'interface appelée `veth pair`).

### Créez votre paramètres de réseau

Docker créer un conteneur de temps, va faire ce qui suit:
* Crée une interface virtuelle, respectivement, dans l'hôte local et un nouveau conteneur;
* Fin du pont à l'hôte local sur le docker0 par défaut ou pont désigné, et a un nom unique, comme veth65f9;
* Une extrémité du récipient dans le nouveau conteneur, et de changer le nom comme eth0, cette interface ne est visible que dans l'espace de nom du conteneur;
* Obtenu à partir du pont d'adresses disponibles dans un eth0 adresse libre du conteneur, attribué, et configurer la route vers l'veth65f9 de carte de pont de défaut.

Après ceux-ci, le conteneur peut être utilisé pour connecter d'autres conteneurs de la carte réseau virtuelle, et d'autres réseaux.

Vous pouvez `docker run` moment par `--net` paramètre pour spécifier la configuration du réseau de conteneurs, il ya quatre valeurs possibles:
* `--net=bridge` ce est le défaut, de se connecter à la passerelle par défaut.
* `--net=host` dit Docker Ne mettez pas l'isolement de l'espace de noms de réseau de conteneurs, ce est à dire pas dans le réseau de porte-conteneurs.
À ce stade, le récipient en utilisant le réseau d'un hôte local, il a un accès complet à l'interface de l'hôte local.
Récipient avec une foule d'autres processus racine peut traiter bas que vous pouvez ouvrir une plage de ports, vous pouvez accéder
aux services de réseau local, tels que D-bus, vous pouvez aussi faire quelque chose pour le conteneur affecte le système hôte entier,
comme le redémarrage de l'hôte. Il faut donc utiliser cette option si vous voulez être très prudent. Si une utilisation ultérieure `--privileged=true`,
le conteneur sera autorisé à configurer directement la pile réseau hôte.
* `--net=container:NAME_or_ID` Docker permettra le nouveau conteneur dans une pile réseau de conteneur de processus existant,
le nouveau processus de conteneur a son système de fichiers propre, liste de processus et de ressources,
mais le conteneur existant et les adresses IP partagées et des ports et d'autres ressources du réseau, les deux processus peuvent être directement par
`lo` communication de l'interface de bouclage.
* `--net=none laissez Docker` nouveau conteneur dans une pile de réseau isolé, mais pas de la configuration du réseau.
Après cela, l'utilisateur peut configurer vous-même.

### les détails de configuration de réseau
Utilisateur `--net=none`, vous pouvez configurer le réseau lui-même, le navire atteint les privilèges habituels ont accès au réseau.
Grâce à ce processus, vous pouvez comprendre les détails de la configuration du réseau Docker.

Tout d'abord, commencer un `/bin/bash` récipient, désigné `--net=none` paramètre.
```
$ sudo docker run -i -t --rm --net=none base /bin/bash
root@63f36fc01b5f:/#
```
Trouver un conteneur dans le numéro de processus de l'hôte local, et de créer un espace de noms réseau pour elle.
```
$ sudo docker inspect -f '{{.State.Pid}}' 63f36fc01b5f
2778
$ pid=2778
$ sudo mkdir -p /var/run/netns
$ sudo ln -s /proc/$pid/ns/net /var/run/netns/$pid
```
Vérifiez l'adresse IP et le masque de sous-réseau carte pont informations.
```
$ ip addr show docker0
21: docker0: ...
inet 172.17.42.1/16 scope global docker0
...
```
Création d'une paire d'interfaces "paire" VETH A et B, A est lié à combler `docker0`, et lui permettre de
```
$ sudo ip link add A type veth peer name B
$ sudo brctl addif docker0 A
$ sudo ip link set A up
```
Le B dans l'espace de noms nommé eth0 réseau de conteneurs, démarrer et configurer un IP disponibles (du segment de réseau ponté),
et la passerelle par défaut.
```
$ sudo ip link set B netns $pid
$ sudo ip netns exec $pid ip link set dev B name eth0
$ sudo ip netns exec $pid ip link set eth0 up
$ sudo ip netns exec $pid ip addr add 172.17.42.99/16 dev eth0
$ sudo ip netns exec $pid ip route add default via 172.17.42.1
```
Ci-dessus, le processus de configuration de réseau spécifique Docker.

Après la fin du conteneur, Docker videra, container eth0 sera effacée avec l'espace de noms réseau ensemble, Une interface sont automatiquement `docker0` déchargés.

En outre, les utilisateurs peuvent utiliser les `ip netns exec` commande pour configurer le nom du réseau dans l'espace désigné,
la configuration ainsi le conteneur de réseau.
