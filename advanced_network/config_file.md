## Modifier les fichiers de configuration du réseau

Docker 1.2.0 a commencé à soutenir le fonctionnement du conteneur pour modifier `/etc/hosts`, `/etc/hostname` et `/etc/resolve.conf` fichiers.

Mais ces changements sont temporaires et ne continuent à fonctionner dans le récipient lorsque le contenant est résilié ou redémarré et ne sera pas enregistrée.
Ne sera pas `docker commit` soumis.
