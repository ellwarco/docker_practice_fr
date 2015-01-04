##L'installation Fig

Tout d'abord, installer la version 1.3 ou ultérieure Docker.

Si votre environnement de travail est OS X, vous pouvez voir [le Guide d'installation de Mac (en anglais)](https://docs.docker.com/installation/mac/),
pour terminer l'installation Docker et boot2docker. Une fois boot2docker exécution, exécutez la commande suivante pour définir une variable d'environnement,
puis la figure, vous pouvez interagir avec lui jusqu'à.
```
$(boot2docker shellinit)
```
**Si vous voulez éviter de ré-établir après le redémarrage, vous pouvez mettre la commande ci-dessus à votre `~/.bashrc` fichier.`*
À propos de `Ubuntu` Il ya `Autres plates-formes` installées, vous pouvez vous référer [Guide d'installation Ubuntu](../install/ubuntu.md)
ainsi que le [manuel d'installation officielle (en anglais)](https://docs.docker.com/installation/).

Ensuite, installez la figure:
```
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
```
**Si vous êtes un administrateur pour installer Docker commandes ci-dessus peut également exiger la même identité.**

Fig publie actuellement ne supporte que 64 bits OSX et Linux. Mais parce que ce est écrit en Python, donc pour les utilisateurs d'autres plates-formes,
vous pouvez installer le paquet Python pour terminer l'installation (système de soutien est également applicable).
```
$ sudo pip install -U fig
```
Ici a été achevée. Exécution `fig --version`, a confirmé pour fonctionner correctement.
