## L'architecture de base

Docker utilisant l'architecture C/S, y compris le client et le serveur.
Docker démon comme un côté de service accepte les demandes des clients et traiter ces demandes (créer, exécuter, distribuer conteneur).
Le client et le serveur peuvent fonctionner sur une seule machine, mais aussi de communiquer via la prise ou API RESTful.

![Docker architecture de base](../_images/docker_arch.png)

Docker démon accueillir généralement accueillir l'arrière-plan, en attendant de recevoir un message d'un client.
Docker client exécutable commandes pour l'utilisateur de fournir un éventail d'utilisateurs pour atteindre ces commandes pour interagir avec Docker démon.
