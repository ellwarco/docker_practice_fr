## Pourquoi utiliser Docker?
Comme une nouvelle approche de la virtualisation, Docker à l'approche traditionnelle de virtualisation présente de nombreux avantages.

Tout d'abord, commencer conteneurs Docker dans secondes pour réaliser que, par rapport à la manière traditionnelle des machines virtuelles est beaucoup plus rapide. Deuxièmement, la forte utilisation des ressources du système Docker, vous pouvez exécuter des milliers de conteneurs Docker sur un ordinateur hôte en même temps.

En plus du récipient dans lequel l'application est exécutée, la base ne consomme des ressources système supplémentaires, rendant applications de haute performance, tandis que le coût du système la plus petite possible. Machines virtuelles traditionnelles fonctionnent 10 applications différentes joueraient 10 machines virtuelles, et Docker juste besoin de commencer 10 à isoler les applications.

Plus précisément, Docker a un grand avantage dans les aspects suivants.

### Livraison plus rapide et le déploiement
Le développement et l'exploitation et l'entretien (devop) le personnel, le meilleur espoir est que, une fois créé,
ou peut être configuré pour fonctionner correctement ne importe où.

Les développeurs peuvent utiliser un ensemble standard de développement pour construire une image du conteneur, après le développement est terminé,
le personnel d'exploitation et d'entretien peuvent utiliser ce contenant à déployer code directement.

Docker peut rapidement créer un conteneur, applications itératives rapides, et peut être vu à travers l'ensemble du processus,
de sorte que d'autres membres de l'équipe sont plus faciles à comprendre comment l'application est de créer et de travail.

Docker récipient très léger bientôt! Heure de départ est le deuxième niveau du conteneur,
et d'économiser beaucoup de développement, les tests, le temps de déploiement.

### Virtualisation plus efficace
Docker récipient fonctionnement hyperviseur ne nécessite pas un soutien supplémentaire,
ce est une virtualisation au niveau du noyau, il peut atteindre des performances et une efficacité accrue.

### De faciliter les migrations et l'expansion

Docker conteneur peut fonctionner sur presque ne importe quelle plate-forme, y compris les machines physiques,
machines virtuelles, cloud public, cloud privé, les PC, les serveurs et ainsi de suite.
Cette compatibilité permet aux utilisateurs de migrer une application d'une plateforme à une autre.

### Gestion simplifiée

Utilisez Docker, seuls de petits changements, vous pouvez remplacer un grand nombre de mise à jour dans le passé.
Toutes les modifications sont progressivement mis à jour et distribués, afin de réaliser l'automatisation et la gestion efficace.

### Comparé au sommaire traditionnelle de la machine virtuelle

| Propriété | Conteneur | Machine Virtuelle |
| -- | -- | -- |
| Commencez | Deuxième année | Classe Minute |
| Disque dur      | Généralement MB | Généralement Go |
| Performance     | Près natif | Faible |
| Système d'appui | Standalone prend en charge des milliers de conteneurs | Des dizaines générales |
