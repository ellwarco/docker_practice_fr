## Espace de noms de base

Docker LXC récipient et le récipient est très similaire aux fonctions de sécurité proposées par le même. Lors de l'utilisation `docker run`
lorsque vous démarrez un conteneur dans le fond Docker a créé un espace de noms distinct pour les groupes de collecte et de contrôle des conteneurs.

Espace de noms fournit des procédés d'isolation les plus élémentaires et les plus directs en cours d'exécution dans le conteneur ne sera pas trouvé
et le rôle des processus se exécutant sur l'hôte, et d'autres contenants.

Chaque conteneur possède sa propre pile de réseau unique, ce qui signifie qu'ils ne peuvent pas accéder à l'interface ou autres prises de conteneurs.
Cependant, si vous faites les réglages appropriés sur le système hôte, le navire peut être comme d'interagir avec l'hôte et d'autres récipients comme interaction.
Lorsque vous spécifiez un port public ou utiliser des liens pour connecter les deux conteneurs, le conteneur peut communiquer
avec l'autre (peut restreindre les stratégies de communication en fonction de la configuration).

D'un point de vue de l'architecture du réseau, toute l'interface de conteneurs par le pont de l'hôte local de communiquer avec l'autre,
comme une machine physique communiquer via le même commutateur physique.

Ainsi, le noyau d'atteindre l'espace de noms et le code de réseau privé est suffisamment mature?

Version du noyau 2.6.15 espace de nom est introduit (Juillet 2008 Communiqué) après de quelques années, la fiabilité de ces mécanismes
dans un certain nombre de système de production à grande échelle est prouvée.

En fait, le temps et la conception des idées mises en avant l'espace de noms à l'heure, était initialement destiné à instaurer un mécanisme
pour mettre en œuvre dans le noyau OpenVZ caractéristiques. Le projet [OpenVZ](http://en.wikipedia.org/wiki/OpenVZ) publié au début de 2005,
et de sa conception et sa mise en œuvre ont été très mature.
