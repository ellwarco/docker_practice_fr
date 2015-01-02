## CentOS série Docker d'installation

Soutenir Docker CentOS6 et les versions ultérieures.

### CentOS6

Pour CentOS6, vous pouvez utiliser la [EPEL](https://fedoraproject.org/wiki/EPEL) installation du référentiel Docker, la commande suivante
```
$ sudo yum install http://mirrors.yun-idc.com/epel/6/i386/epel-release-6-8.noarch.rpm
$ sudo yum install docker-io
```

### CentOS7
CentOS7 système CentOS-Extras bibliothèque a été avec Docker, peut être installé directement:
```
$ sudo yum install docker
```

Docker démarrer après le service d'installation, et laissez-le commencer avec le système chargé automatiquement.
```
$ sudo service docker start
$ sudo chkconfig docker on
```
