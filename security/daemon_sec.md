## La protection du serveur Docker

Core se exécute un conteneur ou une application serveur en Docker. Services Run Docker exigent actuellement des privilèges root, de sorte que la sécurité est très critique.

Tout d'abord, assurez-vous que seuls les utilisateurs de confiance peuvent accéder au service Docker. Docker permet aux utilisateurs de partager
des fichiers entre l'hôte et le dossier de conteneur, mais n'a pas besoin de restreindre l'accès au conteneur, qui est facile de laisser les limites
de ressources contenant de rupture. Par exemple, quand un utilisateur malveillant pour démarrer un conteneur dans le répertoire racine de
l'hôte `/` mappé sur le conteneur `/host` répertoire, puis le récipient peut théoriquement accueillir système de fichiers modifiée arbitrairement.
Cela semble fou? Mais le fait que presque tous les systèmes de virtualisation permettent un partage de ressources similaire,
mais ne peuvent pas empêcher les utilisateurs de partager le système de fichiers racine de l'hôte d'un système de machine virtuelle.

Il en résultera des conséquences très graves de sécurité. Ainsi, lorsque le conteneur est créé pour fournir le service (par exemple, par un serveur web),
accorder plus d'attention aux paramètres de contrôles de sécurité pour empêcher un utilisateur malveillant avec des paramètres spécifiques
pour créer une certaine récipient destructrice

Afin de renforcer la protection du serveur, REST API de Docker (utilisé par les clients pour communiquer avec le serveur) en utilisant un mécanisme local
de socket Unix pour remplacer l'original relié à la prise TCP 127.0.0.1 après 0.5.2, parce que ces derniers sont vulnérables aux attaques cross-site scripting.
Pour améliorer les utilisateurs de sécurité d'accès utilisent maintenant Unix contrôles d'autorisation de prise.

Les utilisateurs peuvent toujours utiliser l'API REST HTTP donne accès. Recommander l'utilisation de mécanismes de sécurité pour se assurer que seule
la confiance des mécanismes de protection de certificat (comme stunnel protégé et certificat SSL) réseau ou VPN, ou peut être consultée sous.
En outre, vous pouvez également utiliser des certificats HTTPS et à renforcer la protection.

Mécanisme de namespace Linux récemment modifié peut être obtenu en utilisant un utilisateur non-root pour exécuter un conteneur entièrement fonctionnel.
Ce sera fondamentalement résoudre partagée entre le réservoir et le système de fichier hôte et les problèmes de sécurité de cause.

Le but ultime est d'améliorer deux dispositifs de sécurité importants:
* L'utilisateur root est mappé à l'utilisateur contenant non-root sur l'hôte local, atténuer les problèmes de sécurité causés par une élévation de privilèges
entre le conteneur et l'hôte provoquée;
* Autoriser serveur Docker dans un cadre privilégié non-root afin de fonctionner, l'utilisation d'un fonctionnement sûr et fiable du processus fils
pour exécuter le privilège de proxy autorisations requises. Ces sous-processus ne seront autorisés à fonctionner dans une plage limitée,
comme seul responsable des paramètres de réseau virtuel ou de la gestion du système de fichiers, la configuration, l'exploitation, etc.

Enfin, nous recommandons d'utiliser un serveur dédié afin de fonctionner Docker et des services de gestion connexes (tels que les services de gestion
telles que la surveillance de ssh et la surveillance de processus, outils de gestion nrpe, collectd, etc.). Autres services commerciaux qui vont courir dans le récipient.
