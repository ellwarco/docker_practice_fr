## Autres caractéristiques de sécurité

En plus de la capacité du mécanisme, vous pouvez également utiliser certains des mécanismes de sécurité existants afin d'améliorer
l'utilisation de la sécurité de Docker, comme TOMOYO, AppArmor, SELinux, grsec ainsi de suite.

Docker mécanisme de capacité actuelle est activée par défaut seulement. Les utilisateurs peuvent utiliser une variété de programmes pour améliorer
la sécurité Docker hôte, par exemple:
* Grsec activé dans le noyau et PAX, ce qui augmentera le nombre de contrôles de sécurité pour compiler et exécuter à temps;
par adresse randomisation pour éviter la détection et les autres malveillants. Et, pour activer cette fonctionnalité ne nécessite aucune configuration Docker.
* Caractéristiques de sécurité améliorées en utilisant certains modèles de conteneurs, tels que les modèles et le modèle avec Redhat
avec la politique SELinux AppArmor. Ces modèles offrent des fonctionnalités de sécurité supplémentaires.
* Les utilisateurs peuvent personnaliser le mécanisme de contrôle d'accès afin de personnaliser les politiques de sécurité.

Ajouter à Docker avec d'autres outils tiers comme contenant (tels que la topologie du réseau et du système de fichiers partagé), il ya beaucoup de mécanisme similaire sans changer la situation Docker de base peut renforcer conteneurs existants.
