## Qu'est-ce que Docker?

Docker est un projet open source, est né au début de 2013, d'abord dotCloud un projet amateur au sein de la société.
Il est basé sur le lancement de Google de la langue Go. Projet tard rejoint la Fondation Linux,
le respect du protocole Apache 2.0, le code de projet à [GitHub](https://github.com/docker/docker) sur l'entretien.

Docker depuis la source de l'inquiétude généralisée et la discussion, de sorte que la société a ensuite rebaptisé dotCloud Docker Inc.
Redhat a mis l'accent sur son RHEL6.5 à l'appui Docker; Google est également largement utilisé dans ses offres PaaS.

Objectif du projet est de parvenir à Docker une solution exploitation de virtualisation de système léger.
La fondation de Docker est conteneur Linux (LXC) technologie.

Sur la base de la Docker LXC étaient autres paquets, afin que les utilisateurs ne ont pas besoin de se préoccuper de la gestion du conteneur,
ce qui rend l'opération plus facile. Actions de l'utilisateur comme l'exploitation d'un navire Docker machine virtuelle rapide et léger aussi simple.

L'image ci-dessous compare les différences entre le Docker et de façon traditionnelle de la virtualisation, les conteneurs virtuels sont visibles,
la réutilisation directe du système d'exploitation hôte local, tandis que l'approche traditionnelle est mise en œuvre au niveau matériel,
le niveau du système d'exploitation.

![Virtualization](../_images/virtualization.png)

![Docker](../_images/docker.png)
