## La réalisation du principe du miroir

Docker miroir est de savoir comment atteindre modifications incrémentielles et l'entretien? Chaque image se compose de plusieurs niveaux constituent, 
Docker utiliser [Union FS](http://en.wikipedia.org/wiki/UnionFS) ces différentes couches de combiner dans un miroir.

Typiquement Union FS a deux objectifs, on peut réaliser sans l'aide de LVM, Disk RAID multiples liés dans le même répertoire,
un autre, plus commun est une des branches en lecture seule et un joint de branche écriture ensemble,
Live CD est basé sur cette méthode peut permettre le miroir sur la base du même nombre d'opérations d'écriture permet à l'utilisateur d'effectuer sur celui-ci.
Docker sur AUFS construit navire utilise également un principe similaire.
