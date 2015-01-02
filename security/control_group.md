## Groupe de contrôle

Groupe de contrôle est un autre élément clé des mécanismes responsables de l'application des contraintes de vérification et des ressources conteneurs Linux.

Il fournit beaucoup de fonctionnalités utiles et assurer une part équitable de chaque conteneur peut accueillir mémoire, CPU, disque IO
et d'autres ressources, bien sûr, plus important encore, pour se assurer que le groupe de contrôle lorsque l'utilisation des ressources
pour générer une pression à l'intérieur du conteneur ne est pas coutume le système hôte.

Bien que le groupe de contrôle ne était pas responsable de l'isolement des visites mutuelles entre le conteneur,
les données de processus et de le traiter pour prévenir par déni de service (DDOS) est essentiel. Surtout dans une plate-forme multi-utilisateur
(comme PaaS public ou privé), le groupe de contrôle est très important. Par exemple, quand un certain anomalies de performances des applications,
ils peuvent assurer la disponibilité et des performances constantes.

mécanisme de groupe de contrôle a débuté en 2006, a été introduit à partir de la version 2.6.24 du noyau début.
