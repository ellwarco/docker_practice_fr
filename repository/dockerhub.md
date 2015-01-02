## Docker Hub

Actuellement Docker officielle maintient un entrepôt public [Docker Hub](https://hub.docker.com/)，qui comprend déjà plus de 15 000 images.
La plupart des exigences sont disponibles via téléchargement direct au miroir Docker Hub à atteindre.

### S'identifier

Vous pouvez exécuter le `docker login` commande pour entrer un nom d'utilisateur, mot de passe et e-mail pour terminer l'enregistrement et connexion.
Après une inscription réussie, le répertoire utilisateur local `.dockercfg` va enregistrer les informations d'authentification de l'utilisateur.

### Opérations de base

Les utilisateurs ne ont pas besoin de se connecter en `docker search` commande pour trouver le dépositaire officiel du miroir, 
et utiliser `docker pull` commande pour le télécharger sur votre local.

Centos par exemple, la recherche par mot clé:
```
$ sudo docker search centos
NAME                                            DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                                          The official build of CentOS.                   465       [OK]
tianon/centos                                   CentOS 5 and 6, created using rinse instea...   28
blalor/centos                                   Bare-bones base CentOS 6.5 image                6                    [OK]
saltstack/centos-6-minimal                                                                      6                    [OK]
tutum/centos-6.4                                DEPRECATED. Use tutum/centos:6.4 instead. ...   5                    [OK]
...
```
Vous pouvez voir un retour à beaucoup d'image contient des mots-clés, y compris la mise en miroir nom, la description,
les étoiles (indiquant la popularité du miroir), si le fonctionnaire est créé, que ce soit automatiquement créé.
L'explication officielle est la création de l'image officielle et le maintien de l'équipe de projet,
ressources automatisé permet aux utilisateurs de vérifier la source et miroir contenu.

Selon que ce est officiel, peut être divisé en deux moyens de miroir. L'un est similaire à CentOS cette image de base,
que l'on appelle la base ou le miroir racine. L'image de base est créée par la société Docker, la validation, le soutien et la disponibilité.
Ces miroirs ont tendance à utiliser un seul mot que le nom. Il ya un autre type, tels `tianon/centos miroir`, qui est créée
et maintenue par les utilisateurs Docker, souvent avec un préfixe de nom d'utilisateur. Vous pouvez préfixer `user_name/` de spécifier
l'utilisation d'une image fournie par l'utilisateur, tels que les utilisateurs de tianon.

En outre, en regardant à travers `-s N` peut être spécifiée pour l'affichage des paramètres seulement évaluer `N` image satellite ci-dessus.

Télécharger les centos officielles miroir localement.
```
$ sudo docker pull centos
Pulling repository centos
0b443ba03958: Download complete
539c0211cd76: Download complete
511136ea3c5a: Download complete
7064731afe90: Download complete
```
Les utilisateurs peuvent également se connecter par `docker push` pour pousser le miroir commande Docker Hub.

### Création automatique

Création automatique (Automated Builds) des fonctions qui nécessitent des mises à niveau fréquentes en miroir dans le programme, il est très pratique.
Parfois, l'utilisateur crée un miroir, l'installation d'un logiciel, le logiciel si une nouvelle version de la nécessité de mettre à jour manuellement le miroir. .

Créé automatiquement par Docker Hub permet aux utilisateurs de spécifier un site de poursuite de cible (prend actuellement en charge [GitHub](github.org)
ou [BitBucket](bitbucket.org)) à la survenance d'une nouvelle demande une fois que le projet est exécuté automatiquement créé.

Pour configurer la création automatique, comprenant les étapes consistant à:

Créer et atterrissage Docker Hub, et le site cible;
* Docker Hub connexion compte sur le site cible;
* Dans Docker Hub dans la configuration d'une création automatique ;
* Sélectionnez un site de destination du projet (y compris Dockerfile requis) et de la branche;
* Dockerfile désigné emplacement et soumettre créé.

Après cela, vous pouvez Docker Hub de la page [automated build](https://registry.hub.docker.com/builds/) pour suivre l'état de chaque créé.
