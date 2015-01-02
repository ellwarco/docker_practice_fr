Docker —— De l'introduction à la pratique
=========================================

v0.3.2

Docker est un grand projet, il libère complètement la puissance de la virtualisation, le cloud computing permet de réduire considérablement 
le coût de l'approvisionnement des ressources, tout en permettant des applications distribuées, tester, déployer et distribuer 
à la fois efficace et n'a jamais été aussi facile!

Ce livre se applique à avoir une connaissance de base des débutants Linux Docker, mais aussi l'espoir de comprendre les principes et les utilisateurs avancés 
de référence mise en œuvre. Dans le même temps, le livre donne des cas pratiques, disponibles pour référence pendant le déploiement réel. Le premier six chapitres 
contenu basé à l'utilisateur de comprendre les concepts de base de Docker et le fonctionnement; 7-9 chapitre présente quelques opérations avancées; 
Chapitre 10 montre une typique scénarios d'application et cas pratiques; 11-13 chapitre sur les technologies connexes pour atteindre Docker . 
14 à chapitre présente certains projets open source connexes.

Lecture en ligne: [GitBook](https://www.gitbook.io/book/yeasy/docker_practice) ou [DockerPool](http://dockerpool.com/static/books/docker_practice/index.html).

Bienvenue préoccupation DockerPool communauté microblogging [@dockerpool](http://weibo.com/u/5345404432), ou rejoindre le groupe DockerPool QQ (341410255),
part des ressources Docker, l'échange de technologies Docker.

![Docker De l'introduction à la pratique](docker_primer.png)

《[Docker De l'introduction à la pratique](http://item.jd.com/11598400.html)》, un livre a été publié officiellement, couvrant un grand nombre de cas réels de première main, 
accueillir à lire.

* [China-Pub](http://product.china-pub.com/3770833)
* [Livres Jingdong](http://item.jd.com/11598400.html)
* [Livres Dangdang](http://product.dangdang.com/23620853.html)
* [Livres Amazon](http://www.amazon.cn/%E5%9B%BE%E4%B9%A6/dp/B00R5MYI7C/ref=lh_ni_t?ie=UTF8&psc=1&smid=A1AJ19PSB66TGU)

## Historique de la version principale
* 0.4: 2015-01-TBD
    * Ajout projet ETCD
    * Ajout projet Fig
* 0.3: 2014-11-25
    * Remplir la section de l'entrepôt;
    * Réécrire chapitre Sécurité;
    * Les sections fixes de l'architecture de mise en œuvre sous-jacent, espace de noms, le groupe de contrôle, le système de fichier, le contenu du format de conteneur;
    * Ajoutez une description de l'entrepôt et des miroirs commun;
    * Ajouter introduire des Dockerfile;
    * Anglais format texte révision à nouveau.
    * Expression écrite révisée.
    * Traditionnelle branche version finale: zh-Hant.
* 0.2: 2014-09-18
    * Contrôler réécriture documentation officielle introduire les concepts de base, l'installation, miroir, contenant, le stockage, la gestion des données, de réseautage et d'autres chapitres;
    * Ajouter le chapitre de la mise en œuvre sous-jacente;
    * Ajouter une commande pour interroger et relie ressources article;
    * D'autres amendements.
* 0.1: 2014-09-05
    * Ajouter le contenu de base;
    * Corrections d'erreurs typographiques et d'expression ne sont pas couramment en place.

Source livre sur l'entretien Github, bienvenue à participer: [https://github.com/yeasy/docker_practice](https://github.com/yeasy/docker_practice).
[Collaborateurs liste](https://github.com/yeasy/docker_practice/graphs/contributors).

## Participer étapes
* Sur GitHub `fork` de posséder entrepôts, `docker_user/docker_practice`, puis `clone` à un local, et des informations d'utilisateur défini.
```
$ git clone git@github.com:docker_user/docker_practice.git
$ cd docker_practice
$ git config user.name "yourname"
$ git config user.email "your email"
```
* Après avoir modifié le code de soumettre, et poussé à leur entrepôt.
```
$ #do some change on the content
$ git commit -am "Fix issue #1: change helo to hello"
$ git push
```
* Envoyer une demande de tirage sur le site GitHub.
* L'utilisation régulière du projet d'entrepôt de mettre à jour leur contenu du référentiel de contenu.
```
$ git remote add upstream https://github.com/yeasy/docker_practice
$ git fetch upstream
$ git checkout master
$ git rebase upstream/master
$ git push -f origin master
```
