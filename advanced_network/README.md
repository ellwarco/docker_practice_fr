# Configuration réseau avancée
Docker chapitre décrit certaines des configurations et les options de réseau avancées.

Lorsque Docker commence automatiquement créé sur l'hôte d'un `docker0` pont virtuel est en fait un pont Linux, et peut être comprise comme un commutateur logiciel.
Il sera monté entre sa redirection de port de réseau.

Pendant ce temps, Docker assignés au hasard à un segment local inoccupé de réseau privé (en [RFC1918](http://tools.ietf.org/html/rfc1918) définition)
dans un discours à l' `docker0` interface. Par exemple, un typique `172.17.42.1`, le masque `255.255.0.0`. port Ethernet attribuera automatiquement
un différents segments du réseau (ci-après initiée récipient `172.17.0.0/16` d'adresse).

Lors de la création d'un récipient lorsque Docker, et il va créer une paire de `veth pair` interface (si le paquet est envoyé à une interface,
une autre interface peut également recevoir le même paquet). Cette interface à une extrémité du récipient, ce est- `eth0`; et l'autre extrémité est montée
localement `docker0` noms de pont `veth` début (par exemple `vethAQI2QT`). De cette manière, l'hôte peut communiquer avec le entre le récipient,
le récipient peut aussi communiquer avec l'autre. Docker est créé entre l'hôte et tous les conteneurs dans un réseau virtuel partagé.

![Réseau Docker](../_images/network.png)

La section suivante décrit certains scénarios, Docker personnaliser toutes les configurations réseau. Ainsi que la commande Linux pour ajuster,
de compléter ou même remplacer la configuration réseau par défaut Docker.
