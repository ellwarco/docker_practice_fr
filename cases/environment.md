## Environnements de tests normalisés de développement et de production

Pour la plupart des entreprises, la construction PaaS ni l'énergie ni le bac à sable personnels nécessaires à voir avec Docker également utiliser un petit point.

Vous pouvez utiliser le Docker de standardiser les environnements de développement, de test et de production.

![architecture d'applications d'entreprise](../_images/enterprise_usage.png)

Docker faible encombrement, le déploiement de 100 conteneurs sur un seul serveur E5 128 G sont plus assez de mémoire,
vous pouvez dessiner un seul conteneur ou directement sur le déploiement de la samba accueillir hôte physique,
utilisez le programme samba maison de parts sera le répertoire personnel de chaque utilisateur mappé sur le centre de développement
et les services de test des machines Windows.

Pour un groupe de projet, par l'architecte pour construire un bon environnement pour une équipe de projet de conteneur standard et les services de test,
chacun avec ses propres ingénieurs de développer un récipient séparé, par docker `run -v` le répertoire personnel de l'utilisateur est mis en correspondance
avec le récipient. Lorsque nécessaire de soumettre test, tout simplement remis au code pour le département de test, puis attribuer un conteneur en utilisant
l' `-v` le répertoire d'accueil de la charge du département d'essai peut être activé. Ainsi, le développement en interne,
de tester l'unité de base, et ne apparaîtront pas départements de développement de code de soumettre le département de test ne peut pas émettre le déploiement.

Après avoir testé rapport du ministère publié par le test, l'architecte de l'environnement de conteneur nouveau détection, il peut être déployé directement
par le code des ingénieurs et les contenants sont déployés à un environnement de production.
Lateral évolutivité des performances de déploiement de cette approche est également excellente.
