## Configuration DNS

Docker pas spécifiquement image personnalisée pour chaque récipient, puis comment personnaliser le nom d'hôte du conteneur de configuration et
la configuration de DNS? Le secret, ce est qu'il utilise un fichier virtuel pour monter l'arrivée de trois fichiers de configuration de conteneur.

Dans le conteneur peut être vu en utilisant la commande mount informations de montage:
```
$ mount
...
/dev/disk/by-uuid/1fec...ebdf on /etc/hostname type ext4 ...
/dev/disk/by-uuid/1fec...ebdf on /etc/hosts type ext4 ...
tmpfs on /etc/resolv.conf type tmpfs ...
...
```
Ce mécanisme permet à l'hôte après mise à jour de l'information hôte DNS se produit, tous les dns de conteneurs Docker configurés via `/etc/resolv.conf` 
fichier à être mis à jour immédiatement.

Si vous souhaitez spécifier manuellement la configuration du conteneur, vous pouvez utiliser les options suivantes.

`-h HOSTNAME` or `--hostname=HOSTNAME` mis le nom d'hôte du conteneur, il sera écrit dans le conteneur `/etc/hostname` et `/etc/hosts`.
Mais il ne peut pas voir l'extérieur du navire, ni le `docker ps` affichage, ni dans les autres conteneurs `/etc/hosts` pour voir.

`--link=CONTAINER_NAME:ALIAS` option au moment de la création du récipient, ajouter un nom d'hôte autres récipients à `/etc/hosts` fichier,
afin que le processus de nouveaux conteneurs peut utiliser le nom d'hôte alias peut s'y connecter.

`--dns=IP_ADDRESS` ajouter des serveurs DNS pour le conteneur `/etc/resolv.conf`, de sorte que serveur de conteneur pour résoudre tout cela ne est pas
`/etc/hosts` dans le nom d'hôte.

`--dns-search=DOMAIN` champ ensemble de recherche de conteneurs, lorsqu'il est réglé pour rechercher domaine `.example.com` quand,
dans la recherche d'un hôte hôte nommé, la recherche DNS ne hôte, va chercher `host.example.com`. Remarque: Si vous ne avez pas ces deux dernières options,
Docker par défaut sur l'hôte `/etc/resolv.conf` pour le conteneur Configuration.
