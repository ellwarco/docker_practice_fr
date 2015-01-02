## Système de fichier combiné

File System mixte ([UnionFS](http://en.wikipedia.org/wiki/UnionFS)) est un système de couches, léger et fichiers haute performance
qui prend en charge des modifications au système de fichiers comme une soumission à une superposition de couches,
tandis qu'un autre répertoire peut être monté à la même virtuelle File System (unir plusieurs répertoires dans un seul système de fichiers virtuel).

Docker système de fichier joint est à la base du miroir. Miroir peut être effectuée par un héritage hiérarchique,
fondée sur l'image de base (pas d'image de parent), vous pouvez créer une variété d'applications en miroir spécifique.

En outre, le conteneur Docker différent peut partager certaines couche de système de fichiers de base, mais en raison de sa propre couche de modifications
uniques améliore grandement l'efficacité du stockage.

AUFS (AnotherUnionFS) utilisé dans Docker est un système de fichier commun. Soutien AUFS pour chaque membre du directoire (similaire à Git branche)
pour définir en lecture seule (en lecture seule), écrire (readwrite) et d'écriture (voile blanc-mesure), il ya un concept similaire AUFS hiérarchique,
en lecture seule logique incrémentale en branche peut modifier les autorisations sur (ne affecte pas la lecture seule section).

Docker actuellement pris en charge les types de système de fichiers, y compris les conjoints, AUFS btrfs, vfs et DeviceMapper.
