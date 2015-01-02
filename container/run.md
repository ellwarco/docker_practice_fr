##Lancer récipient

Commencez récipient de deux façons, l'une est basée sur un miroir et commencer un nouveau navire, l'autre est le conteneur dans l'état de cessation (arrêt) redémarrage.

Parce que Docker conteneurs trop légers, et beaucoup de temps et les utilisateurs sont prêts à supprimer le conteneur nouvellement créé.

###Nouveau et le début

Les principales commandes nécessaires pour `docker run`.

Par exemple, la commande suivante émet un "Hello World, après la fin du conteneur.
```
$ sudo docker run ubuntu:14.04 /bin/echo 'Hello world'
Hello world
```
Ce est directement exécuté avec locale `/bin/echo 'hello world'`` presque ne peut pas se sentir une différence.

La commande suivante démarre un terminal bash, permettant à l'utilisateur d'interagir.
```
$ sudo docker run -t -i ubuntu:14.04 /bin/bash
root@af8bae53bdd3:/#
```
Qui, `-t` option permet Docker attribuer un pseudo-terminal (pseudo-terminal) et se lie à l'entrée standard du conteneur,
`-i` laissez l'entrée standard reste récipient ouvert.

En mode interactif, l'utilisateur peut créer un terminal d'entrer une commande, comme
```
root@af8bae53bdd3:/# pwd
/
root@af8bae53bdd3:/# ls
bin boot dev etc home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
```
Lors de l'utilisation docker run de temps pour créer le conteneur standard Docker exploitation se exécute en arrière-plan comprennent:

* Vérifier se il ya un miroir local spécifié, il ne est pas téléchargé à partir entrepôt public
* Utiliser des miroirs pour créer et démarrer un conteneur
* Attribuer un système de fichiers, et la couche extérieure de la lecture seule monture de miroir couche couche inscriptible
* Réduire la configuration de l'hôte à partir de l'interface de transition d'ordinateur central à une interface virtuelle à un récipient
* Configuration d'une adresse IP du pool d'adresses pour le récipient
* L'exécution de l'application utilisateur spécifié
* Après l'achèvement de la mise en oeuvre du conteneur est terminé

###Démarrer le récipient interrompue

Vous pouvez utiliser `docker start` commande, un conteneur a été résilié directement à commencer à courir.

Conteneur de base pour l'exécution de l'application, les ressources nécessaires pour exécuter l'application sont nécessaires.
En outre, il n'y a pas d'autre ressource. Vous pouvez utiliser le pseudo-terminal `ps` ou `top` pour afficher des informations de processus.
```
root@ba267838cc1b:/# ps
  PID TTY          TIME CMD
    1 ?        00:00:00 bash
   11 ?        00:00:00 ps
```
Vu exécutant dans le conteneur spécifié demande ne bash. Cette caractéristique rend l'utilisation élevée des ressources Docker,
est une véritable virtualisation léger.
