## Création tomcat / cluster WebLogic
### Image d'installation Tomcat

Prêt jdk de nécessité, tomcat et d'autres logiciels dans le répertoire d'accueil, commencez un récipient
```
docker run -t -i -v /home:/opt/data  --name mk_tomcat ubuntu /bin/bash
```
Cette commande monte un répertoire local vers le répertoire contenant /opt/data, si le répertoire existe dans le conteneur, il sera créé automatiquement.
La prochaine étape est après la configuration de base de tomcat, environnement JDK ensemble de variables, le programme de tomcat dans /opt/apache-tomcat
fichier suivant de /etc/supervisor/conf.d/supervisor.conf éditoriale, ajouter des éléments de tomcat
```
[supervisord]
nodaemon=true

[program:tomcat]
command=/opt/apache-tomcat/bin/startup.sh

[program:sshd]
command=/usr/sbin/sshd -D
docker commit  ac6474aeb31d  tomcat
```
Nouveau dossier tomcat, créer Dockerfile.
```
FROM mk_tomcat
EXPOSE  22 8080
CMD ["/usr/bin/supervisord"]
```
Selon Dockerfile créer un miroir.
```
docker build tomcat tomcat
```
### Installez weblogic Miroir

Fondamentalement les mêmes étapes et tomcat, ici posté sur les profils
```
supervisor.conf
[supervisord]
nodaemon=true


[program:weblogic]
command=/opt/Middleware/user_projects/domains/base_domain/bin/startWebLogic.sh

[program:sshd]
command=/usr/sbin/sshd -D
dockerfile
FROM weblogic
EXPOSE  22 7001
CMD ["/usr/bin/supervisord"]
```
### Utilisez tomcat / weblogic miroir
#### Stocké utilisation

Au moment du démarrage, utilisez `-v` paramètre

    -v, --volume=[]            Bind mount a volume (e.g. from the host: -v /host:/container, from docker: -v /container)

Seront mappés sur un disque local à l'intérieur du conteneur, qui est entre l'hôte et les changements en temps réel dans le conteneur, nous mettons à jour, le code de téléchargement ne doit mettre à jour le répertoire physique sur l'hôte

#### obtenir tomcat et weblogic pôle

Tant que vous pouvez ouvrir plusieurs conteneurs tomcat
```
docker run -d -v -p 204:22 -p 7003:8080 -v /home/data:/opt/data --name tm1 tomcat /usr/bin/supervisord
docker run -d -v -p 205:22 -p 7004:8080 -v /home/data:/opt/data --name tm2 tomcat /usr/bin/supervisord
docker run -d -v -p 206:22 -p 7005:8080 -v /home/data:/opt/data --name tm3 tomcat /usr/bin/supervisord
```
Ici pour parler de la configuration weblogic, nous savons qu'il ya un concept de domaine WebLogic. Si vous souhaitez utiliser la façon traditionnelle de l'administrateur + déploiement de noeud, vous devez écrire dans supervisord respectivement administartor serveur et noeud script de démarrage du serveur, les avantages de le faire sont:
* Vous pouvez utiliser le concept de synchronisation de cluster WebLogic
* Déployer une application de cluster, il vous suffit d'installer l'application sur un cluster peut

Les inconvénients sont:
* Complexe configure Docker
* Pas moyen d'étendre automatiquement le calcul de cluster de la capacité d'ajouter des nœuds doivent créer des nœuds sur administrateur, 
puis configurer un nouveau superviseur conteneur de démarrage, puis démarrez le conteneur Une autre méthode est de mettre tous les programmes installés sur adminiserver 
ci-dessus besoin de prolonger le temps, vous pouvez commencer une pluralité de noeuds, ses avantages et ses inconvénients, et d'une manière contraire.
(Ce est la méthode recommandée pour déployer des environnements de développement et de test)
```
docker run -d -v -p 204:22 -p 7001:7001 -v /home/data:/opt/data --name node1 weblogic /usr/bin/supervisord
docker run -d -v -p 205:22 -p 7002:7001 -v /home/data:/opt/data --name node2 weblogic /usr/bin/supervisord
docker run -d -v -p 206:22 -p 7003:7001 -v /home/data:/opt/data --name node3 weblogic /usr/bin/supervisord
```

Nginx de le faire en front-end équilibrage de charge peut être fait!
