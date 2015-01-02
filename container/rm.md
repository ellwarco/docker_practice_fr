##Retirer le récipient

Vous pouvez utiliser le `docker rm` pour enlever un conteneur dans la cessation de l'état. Comme
```
$sudo docker rm  trusting_newton
trusting_newton
```
Si vous voulez supprimer un conteneur en cours d'exécution, vous pouvez ajouter `-f` paramètre. Docker enverra `SIGKILL` signal au conteneur.
