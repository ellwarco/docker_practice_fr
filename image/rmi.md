## Retirer miroir local

Si vous souhaitez supprimer un miroir local, vous pouvez utiliser le `docker rmi` commande. Remarque `docker rm` commande est de retirer le récipient.
```
$ sudo docker rmi training/sinatra
Untagged: training/sinatra:latest
Deleted: 5bc342fa0b91cabf65246837015197eecfa24b2213ed6a51a8974ae250fedd8d
Deleted: ed0fffdcdae5eb2c3a55549857a8be7fc8bc4241fb19ad714364cbfd7a56b22f
Deleted: 5c58979d73ae448df5af1d8142436d81116187a7633082650549c52c3a2418f0
```

* Note: Avant de retirer le premier miroir avec un `docker rm` supprimer tous les conteneurs dépend du miroir.
