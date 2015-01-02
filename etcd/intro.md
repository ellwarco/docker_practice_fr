## Qu'est-ce que ETCD

![](../_images/etcd_logo.png)

ETCD est un projet open source équipe CoreOS lancé en Juin 2013, et son objectif est de construire une base de données hautement disponible touche distribué (clé-valeur),
basé sur le langage Go. Nous savons que dans un système distribué, la gestion des informations de configuration des services de partage,
de découverte de service est un très basique, mais aussi une question très importante. Projet CoreOS espère résoudre ce problème ETCD base.

[github.com/coreos/etcd](https://github.com/coreos/etcd) est actuellement en maintenance pour la sortie de la verdsion 2.0.0.

Inspiré par [Apache ZooKeeper](http://zookeeper.apache.org/) et [Doozer](https://github.com/ha/doozerd)，etcd repose sur quatre concepts:
* Simple: le soutien HTTP de type REST API JSON +
* Sécurité: Support pour le mode d'accès HTTPS
* Rapide: Prise en charge simultanée 1k / s en écriture
* Fiable: Supports architecture distribuée, basée sur le radeau de l'algorithme de consensus

*Remarque: Apache Zookeeper est synchronisé et ensemble cohérent d'outils pour la gestion des systèmes distribués étaient connus.
*Remarque: Doozer ya une cohérence de base de données distribuée.
*Remarque: Raft est un ensemble de systèmes distribués pour atteindre élections algorithme nœud maître de cohérence, l'algorithme Paxos est comparée à la célèbre,
il est plus facile processus pour être compris, proposé par l'Université de Stanford, Diego Ongaro et John Ousterhout.
Plus de détails peuvent se référer à [raftconsensus.github.io](http://raftconsensus.github.io).

En général, les utilisateurs peuvent lancer plusieurs instances ETCD sur plusieurs nœuds, et les ajouter en tant que cluster. Mêmes instances de cluster ETCD seront compatibles les uns avec les autres informations.
