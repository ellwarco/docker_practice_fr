# Docker Query

## La syntaxe de base
    docker [OPTIONS] COMMAND [arg...]
Généralement, Docker commande peut être utilisé pour gérer le démon, ou une image administrative et conteneur à travers les commandes CLI.
En man docker pour voir ces commandes.

##Options
    -D=true|false
        Utilisez le mode de debug. La valeur par défaut est false.

    -H, --host=[unix:///var/run/docker.sock]: tcp://[host:port]Pour lier ou unix://[/path/to/socket] Utilisé.
        Dans daemon socket mode affectation, par un ou plusieurs tcp://host:port, unix:///path/to/socket, fd://* or fd://socketfd Pour spécifier.

    --api-enable-cors=true|false
        Activer la tête CORS à l'API d'extrémité distale. La valeur par défaut est false.

    -b=""
        Le navire a été monté sur un pont existant. Le réseau de conteneurs désactivation spécifié comme 'none' quand.

    --bip=""
       Laissez docker0 créé dynamiquement en utilisant l'adresse CIDR donné, et options -b sont mutuellement exclusifs.

    -d=true|false
        Utilisez le mode daemon. La valeur par défaut est false.

    --dns=""
       Laissez Docker donnée serveur DNS.

    -g=""
        Indiquez le chemin root Docker exécution. La valeur par défaut est /var/lib/docker.

    --icc=true|false
       Activation de la communication entre les conteneurs. La valeur par défaut est true.

    --ip=""
        Lie l'adresse IP par défaut pour le port quand. La valeur par défaut est 0.0.0.0.

    --iptables=true|false
        Ajouter iptables règles interdisent Docker. La valeur par défaut est true.

    --mtu=VALUE
       Spécifiez réseau contenant MTU. La valeur par défaut est 1500.

    -p=""
      Chemin du fichier PID du daemon spécifié. La valeur par défaut est /var/run/docker.pid.

    -s=""
        L'utilisation d'un disque de stockage donnée forcé Docker exécution.

    -v=true|false
        Sortie version et quitte. La valeur par défaut est false.

    --selinux-enabled=true|false
        Activation du support SELinux. La valeur par défaut est false. Pilotes de stockage SELinux actuellement Btrfs ne sont pas pris en charge.


## Commandement
Le commandement de Docker peut être utilisé `docker-CMD` ou `docker CMD` manière. Conformément à la fois.

    docker-attach(1)
        Attaché à un conteneur dans la course.

    docker-build(1)
        Créer un miroir d'un Dockerfile

    docker-commit(1)
        Créer une nouvelle image de la modification d'un conteneur

    docker-cp(1)
        Copier les fichiers du récipient dans le système hôte

    docker-diff(1)
       Modifier une vérification du système de fichier conteneur

    docker-events(1)
        Obtenez événements en temps réel à partir du serveur

    docker-export(1)
       Exporter le contenu du récipient dans un paquet tar

    docker-history(1)
        Affiche l'historique d'un miroir

    docker-images(1)
       Miroirs listés

    docker-import(1)
       Importation d'un fichier (paquet généralement tar) chemin ou répertoire pour créer une image miroir

    docker-info(1)
        Affiche des informations de système apparenté

    docker-inspect(1)
        Afficher les détails sous-jacents d'un conteneur.

    docker-kill(1)
        Fermez un récipient en cours d'exécution (y compris les processus et toutes les ressources)

    docker-load(1)
       Chargez une image à partir d'un paquet de goudron 

    docker-login(1)
        Se inscrire ou se connecter à un serveur Docker entrepôt

    docker-logout(1)
        Se déconnecter de Docker serveur d'entrepôt

    docker-logs(1)
        Obtenir une information de journal de conteneurs

    docker-pause(1)
        Suspendre tous les processus dans un conteneur

    docker-port(1)
        Trouver un nat à une ouverture au public du port de réseau privé

    docker-ps(1)
        Inscrite récipient

    docker-pull(1)
        Docker serveur d'entrepôt à partir d'un menu déroulant d'un miroir ou d'un entrepôt

    docker-push(1)
        Un miroir ou un entrepôt poussés serveur d'enregistrement Docker

    docker-restart(1)
        Redémarrez un récipient en cours d'exécution

    docker-rm(1)
       Suppression d'un nombre donné de conteneurs

    docker-rmi(1)
        Retirer le nombre donné de miroirs

    docker-run(1)
        Créer un nouveau conteneur, et dans lequel exécuter une commande donnée

    docker-save(1)
        Enregistrer une image comme un fichier de package tar

    docker-search(1)
        Indice Docker dans la recherche d'un miroir

    docker-start(1)
        Lancer un récipient

    docker-stop(1)
       Terminer un récipient en cours d'exécution

    docker-tag(1)
       Comme un marquage d'image miroir

    docker-top(1)
        Process Viewer se exécute dans un conteneur d'informations

    docker-unpause(1)
        Tous les processus au sein d'une récupération des contenants de l'état suspendu

    docker-version(1)
        Informations sur la version de sortie Docker

    docker-wait(1)
        Blocs jusqu'à la résiliation d'un récipient, puis la sortie de son signe de sortie
        

##Une figure ci-dessous récapitule la commande Docker

![Cycle de commande](../_images/cmd_logic.png)
