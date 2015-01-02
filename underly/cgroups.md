## Groupe de contrôle

Les groupes de contrôle ([cgroups](http://en.wikipedia.org/wiki/Cgroups)) est une fonctionnalité du noyau Linux, est principalement utilisé
pour isoler les ressources partagées, les contraintes et l'audit. Ne peut contrôler l'allocation des ressources pour le conteneur,
afin d'éviter la concurrence pour les ressources système lorsque plusieurs conteneurs sont en cours d'exécution simultanément.

technique du groupe de contrôle a été d'abord proposé en 2006 par le programmeur Google, noyau Linux depuis la 2.6.24 a commencé à soutenir.

Les groupes témoins peuvent fournir de la mémoire de conteneurs, CPU, disque IO et d'autres contraintes de ressources et de gestion de la vérification.
