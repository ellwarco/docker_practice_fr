# La mise en œuvre sous-jacent
Docker technologies de base sous-jacents comprennent l'espace de nom (espaces de noms) Linux sur le groupe de contrôle (groupes de contrôle),
le système de fichiers de l'Union (des systèmes de fichiers de l'Union) et les formats de conteneurs (de format conteneur).

Nous savons que la machine virtuelle traditionnelle fonctionnant sur l'hôte de l'hyperviseur hôte pour simuler l'environnement fournit un ensemble complet
de matériel pour le système d'exploitation de la machine virtuelle. L'environnement de la machine virtuelle peut limiter le système pour voir,
et il est isolé de l'autre. Cette approche directe pour atteindre les bonnes ressources pour le paquet le plus complet,
mais signifie très souvent une perte de ressources système. Par exemple, les systèmes hôtes et la machine virtuelle pour les systèmes Linux, par exemple,
l'application se exécute effectivement sur une machine virtuelle peut utiliser l'environnement d'exploitation du système hôte.

Nous savons que, dans le système d'exploitation, y compris le noyau, système de fichiers, réseau, PID, UID, IPC, mémoire, disque dur, CPU, etc.,
toutes les ressources sont partagées par un processus d'application directe. Pour atteindre la virtualisation, en plus d'atteindre la limite de la mémoire,
CPU, réseau IO, disque dur IO, espace de stockage, etc., mais aussi réaliser le système de fichiers, réseau, PID, UID, IPC, et ainsi isolé les uns des autres.
Le premier est relativement facile à mettre en œuvre certaines de ces derniers nécessite un soutien en profondeur pour le système hôte.

Avec le système Linux pour réaliser des fonctions d'espace de noms parfaits, les programmeurs ont pu atteindre tous les besoins ci-dessus,
de sorte que certains des processus en cours dans l'isolement de l'autre espace de noms. Bien que nous partageons tous un certain noyau et environnement
d'exécution (par exemple, certaines commandes du système et les bibliothèques système), mais ne voit pas l'autre,
tous pensé que le système n'a que sa propre existence. Ce mécanisme est le conteneur (Container), l'utilisation de l'espace de nom pour faire
du contrôle d'isolement de permission, utiliser des groupes de contrôle font l'allocation des ressources.
