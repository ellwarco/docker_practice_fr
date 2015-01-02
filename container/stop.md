##récipient de terminaison

Vous pouvez utiliser le `docker stop` de mettre fin à un conteneur en cours d'exécution.

En outre, lorsque l'application spécifié Docker extrémité de récipient, le récipient est automatiquement résilié.
Par exemple, dans la section précédente, pour commencer un terminal à conteneurs, l'utilisateur `exit` commande ou `Ctrl+d` quand sortir le terminal,
le conteneur créé immédiatement résilié.

La fin de l'état du conteneur peut être utilisé `docker ps -a` commande pour voir. Comme
```
sudo docker ps -a
CONTAINER ID        IMAGE                    COMMAND                CREATED             STATUS                          PORTS               NAMES
ba267838cc1b        ubuntu:14.04             "/bin/bash"            30 minutes ago      Exited (0) About a minute ago                       trusting_newton
98e5efa7d997        training/webapp:latest   "python app.py"        About an hour ago   Exited (0) 34 minutes ago                           backstabbing_pike
```

Container est terminée État peut `docker start` commande pour redémarrer.

En outre, `docker restart` commande de conteneur mettre fin à un état de fonctionnement, puis redémarrez-le.
