## Docker entrepôt

Entrepôt est situé au centre placez le fichier image. Parfois, le serveur d'enregistrement sera entrepôts et les entrepôts (Registre) confondre, pas de distinction stricte. En fait, le serveur d'enregistrement de l'entrepôt contient souvent plusieurs entrepôts, chaque entrepôt contient également un certain nombre de miroirs, chaque miroir a une étiquette différente (tag).

Entrepôt est divisé en deux formes d'entrepôts publics (publics) et de stockage privé (Private).

Plus grand entrepôt ouvert [Docker Hub](https://hub.docker.com), stocker un grand nombre d'images disponibles pour les utilisateurs à télécharger.
Entrepôt public national comprend [Docker Pool](http://www.dockerpool.com), etc., peuvent fournir une utilisateurs du continent plus stables accès plus rapide.

Bien sûr, les utilisateurs peuvent également créer un entrepôt privé au sein du réseau local.

Lorsque l'utilisateur crée sa propre image, vous pouvez utiliser push commande pour le transférer à l'entrepôt public ou privé, donc la prochaine fois utiliser cette image sur une autre machine, simplement à partir de l'entrepôt sur ​​le pull sur elle.

* Note: Le concept Docker entrepôt avec [Git](http://git-scm.com) est similaire au serveur d'enregistrement peut être comprise comme ces services d'hébergement GitHub.
