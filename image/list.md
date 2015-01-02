## Listes miroir local

Utiliser `docker images` afficher le miroir existant locale.
```
$ sudo docker images
REPOSITORY       TAG      IMAGE ID      CREATED      VIRTUAL SIZE
ubuntu           12.04    74fe38d11401  4 weeks ago  209.6 MB
ubuntu           precise  74fe38d11401  4 weeks ago  209.6 MB
ubuntu           14.04    99ec81b80c55  4 weeks ago  266 MB
ubuntu           latest   99ec81b80c55  4 weeks ago  266 MB
ubuntu           trusty   99ec81b80c55  4 weeks ago  266 MB
...
```

Dans les informations indiquées, vous pouvez voir plusieurs domaines de l'information

* À partir de laquelle l'entrepôt, comme ubuntu
* Mark miroir, tels 14,04
* Son ID Numéro (unique)
* Établi
* Taille de l'image

Quel miroir `ID` identifie de manière unique un miroir, notant `ubuntu:14.04` et `ubuntu:trusty` miroir avec le même `ID`, ce qui indique qu'ils sont en fait la même image.

`TAG` information est utilisée pour marquer une image différente de la même entrepôt. Par exemple `ubuntu` dépôts ont miroir multiple par `TAG` informations
de libération de distinguer, par exemple, `10.04`, `12.04` , `12.10` , `13.04`, `14.04` , etc. Par exemple, la commande suivante spécifie l'utilisation 
d'un miroir `ubuntu:14.04` pour démarrer un conteneur.

```
$ sudo docker run -t -i ubuntu:14.04 /bin/bash
```

Si vous ne spécifiez pas une balise spécifique, la valeur par défaut `latest` information sur le tag.
