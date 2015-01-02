## Les capacités fondamentales mécanisme

mécanisme de capacités (Capability) est une fonctionnalité puissante du noyau Linux, peut fournir des autorisations de contrôle d'accès à grains fins.
Noyau Linux depuis la version 2.2 soutiendra mécanisme de capacité, il sera divisé en autorisations plus fine capacité opérationnelle,
les deux agissant sur le processus peut également être appliqué au fichier.

Par exemple, un processus de service Web ne requiert que lier un port inférieur à 1024 autorisations, ne nécessite pas les privilèges root.
Donc, il ne doit être autorisée `net_bind_service` capacité peut être. En outre, il y a beaucoup d'autres aptitudes similaires pour éviter
le processus pour obtenir les privilèges root.

Par défaut, Docker début du conteneur est limitée pour permettre à une partie seulement de la capacité d'utiliser le noyau.

La possibilité d'utiliser le mécanisme de renforcer la sécurité des conteneurs Docker présente de nombreux avantages.
Typiquement, un processus se exécutant sur le serveur, il faudra un tas de droits privilégiés, incluant ssh, cron, syslogd,
le module de l'outil de gestion du matériel (un module de charge), des outils de configuration de réseau.
Récipient avec ces processus sont différents, parce que presque tous les privilèges du processus par le système conteneur soutien extérieur à gérer.

* Accès ssh service ssh sur l'hôte de gérer;
* cron normalement être exécuté comme un processus utilisateur, l'autorisation d'utiliser l'application pour gérer qu'il dessert;
* Par Docker système de journal ou d'une gestion des services tiers;
* la gestion du matériel ne est pas pertinent, le conteneur devra fournir des services de udevd et similaires;
* La gestion du réseau sont également mis en place sur l'hôte, à moins que des besoins spéciaux, le conteneur n'a pas besoin d'être configuré sur le réseau.

Comme on peut le voir dans l'exemple ci-dessus, dans la plupart des cas, le conteneur n'a pas besoin un "vrai" privilèges root,
le conteneur ne peut être qu'un petit nombre de capacités. Pour plus de sécurité, le conteneur peut désactiver certaines autorisations inutiles.
* Une interdiction complète de toute opération de montage;
* Interdire l'accès direct à l'hôte local de la prise;
* Interdire l'accès au système d'exploitation, certains fichiers, tels que la création d'un nouvel appareil, modifier les attributs de fichiers;
* Désactiver le module chargé.

Ainsi, même si un attaquant gagne privilèges root dans le conteneur, il ne peut pas obtenir des privilèges plus élevés sur l'hôte local,
la destruction peut être effectuée est limitée.

Par défaut, Docker utilisant [liste blanche](https://github.com/docker/docker/blob/master/daemon/execdriver/native/template/default_template.go)
mécanisme pour désactiver [les fonctions essentielles](https://github.com/docker/docker/blob/master/daemon/execdriver/native/template/default_template.go)
autres que le privilège. Bien sûr, les utilisateurs peuvent également activer les autorisations supplémentaires pour Docker récipient en fonction de leurs besoins.
