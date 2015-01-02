## Guide de configuration rapide

Voici une liste des commandes associées avec le réseau Docker.

Certaines options de commande que lorsque le service commence à Docker peut configurer, mais ne prend pas effet immédiatement.

* `-b BRIDGE` or `--bridge=BRIDGE` - réservoir fixé pont spécifié
* `--bip=CIDR` - masque personnalisé docker0
* `-H SOCKET...` or `--host=SOCKET...` --Docker serveur reçoit un canal de commande
* `--icc=true|false` - de soutenir ou non la communication entre le récipient
* `--ip-forward=true|false` - Envisager la communication suivante entre les conteneurs
* `--iptables=true|false` - ajouter iptables règles interdisent Docker
* `--mtu=BYTES` - réseau contenant MTU

Les deux options de commande suivantes peuvent être spécifiées soit lorsque vous démarrez le service, vous pouvez commencer récipient Docker
( `docker run` ) lorsqu'il est désigné. Service Docker commence à l'heure indiquée sera la valeur par défaut, suivie par la mise en œuvre
de `docker run` peut remplacer les paramètres par défaut quand.

* `--dns=IP_ADDRESS...` - Utiliser le serveur DNS spécifié
* `--dns-search=DOMAIN...` - Indique le domaine de recherche DNS

La dernière de ces options ne sont `docker run` l'exécution utilisé parce qu'il est la nature du contenu du conteneur.

* `-h HOSTNAME` or `--hostname=HOSTNAME` - Configuration conteneur du nom de l'hôte
* `--link=CONTAINER_NAME:ALIAS` - ajouter une connexion à un autre navire
* `--net=bridge|none|container:NAME_or_ID|host` - mode de configuration de pont pour conteneurs
* `-p SPEC or --publish=SPEC` - port à conteneurs de cartographie pour accueillir l'hôte
* `-P or --publish-all=true|false` - la cartographie de tous les ports de conteneurs pour accueillir l'hôte
