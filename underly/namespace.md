## Espace de noms

Un espace de noms est une fonctionnalité puissante du noyau Linux. Chaque conteneur possède son propre espace de noms distinct,
courir tout aimez courir les mêmes applications dans lequel un système d'exploitation distinct. Espace de noms garanti indépendamment
l'un de l'autre à l'autre entre le récipient.

### pid espace de noms

Différents utilisateurs est à travers le processus d'isoler pid espace de noms et espaces de noms différents peuvent avoir le même pid.
LXC tous les processus dans le processus parent pour les processus Docker Docker, chacun avec un espace de processus LXC de nom différent.
Dans le même temps en permettant imbriquée, de sorte que vous pouvez facilement atteindre Docker conteneurs imbriqués.

### namespace net

Avec espace de noms pid, chaque espace de nom peut être isolé de l'autre pid, mais le port de réseau ou port hôte partagé.
l'isolement du réseau est assurée par l'espace de nom de réseau, chaque espace de nom de réseau avec des dispositifs séparés de réseau,
les adresses IP, les tables de routage, répertoire / proc / net. Ces réseaux de chaque conteneur peuvent isoler.
défaut de Docker façon veth, du conteneur, avec le pont d'hôte d'un NIC virtuel sur Docker.

### IPC espace de noms

Container, ou l'utilisation du processus interactif entre Linux processus commun méthodes d'interaction (communication inter - IPC),
y compris les sémaphores, les files de messages et la mémoire partagée. Cependant, avec la VM est différent, en fait, l'interaction entre les mêmes ou
ont l'espace de noms pid sur le processus d'interaction entre le conteneur de processus hôte, donc besoin d'ajouter des informations d'espace de noms
pour postuler ressources IPC, chaque ressource IPC a un unique de 32 id.

### mnt espace de noms

De même chroot, l'exécution d'un processus dans un répertoire spécifique. mnt différents espaces de noms permettent le processus pour voir
la structure de fichier d'espace de noms différents, de sorte que le répertoire du fichier du processus dans chaque scie espace de noms a été isolé ouvert.
Chroot différent avec chaque conteneur d'espace de noms dans / proc / monte informations ne contient que le nom de l'espace où le point de montage.

### namespace uts

UTS ("UNIX Time-Sharing système») espace de noms permet à chaque navire a un nom d'hôte et nom de domaine séparé, afin que le réseau peut être considéré
comme un processus sur un nœud distinct plutôt que l'hôte.

### espace de noms d'utilisateur

Chaque conteneur peut avoir utilisateur et le groupe id différent, ce qui signifie que les utilisateurs sur le programme plutôt que l'hôte peuvent effectuer
conteneur utilisateur à l'intérieur du conteneur.

*Remarque: Pour l'espace de nom sur Linux, [cet article](http://blog.scottlowe.org/2013/09/04/introducing-linux-network-namespaces/) décrit bien.
