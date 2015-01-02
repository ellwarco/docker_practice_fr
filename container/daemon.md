##Gardien fonctionnement de l'Etat

Plus souvent, le besoin de courir afin de protéger l'état récipient Docker (démonisée) forme en arrière-plan.
À ce stade, vous pouvez ajouter le `-d` paramètre à atteindre.

Par exemple, la commande suivante se déroulera dans le récipient de fond.
```
$ sudo docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
1e5535038e285177d5214659a068137486f96ee5c2e85a4ac52dc83f2ebe4147
```

Sera de retour après que le navire a commencé un identifiant unique, peut également `docker ps` commande pour afficher les informations du conteneur.
```
$ sudo docker ps
CONTAINER ID  IMAGE         COMMAND               CREATED        STATUS       PORTS NAMES
1e5535038e28  ubuntu:14.04  /bin/sh -c 'while tr  2 minutes ago  Up 1 minute        insane_babbage
```
Pour obtenir la sortie du conteneur, vous pouvez `docker logs` commande.
```
$ sudo docker logs insane_babbage
hello world
hello world
hello world
. . .
```
