LEGOUEIX Nicolas  
HENRIKSEN Leif 

# Questions

1. On dispose d'un total de 1To d'espace d'adressage physique, imposé par la taille des adresses de 40 bits. Etant donné la manière dont sont construites ces adresses (les 8 premiers bits désignent le numéro du cluster) on ne dispose en fait que de 32 bits par cluster, soit 4Go d'espace physique par cluster. De même, une application ne dispose au maximum que de 4Go d'espace mémoire virtuel.
2. Les pages peuvent faire soit 4Ko (second niveau) soit 2Mo (premier niveau).
3. Le bit V des tables est le bit de validité. Il signale que l'entrée contient des données valides qui peuvent être utilisées. Le bit D, pour Dirty signale que cette page a été modfiée récement.
4. Chaque MMU contient une TLB de 64 entrées.
5. LL/SC pour Load-Link et Store-Conditional sont deux instructions permettant d'effectuer des chargement de données non synchronisées. LL permet de geler une donnée. Cette dernière est lue puis bloquée pour empècher que d'autres modifications y soient apportées. SC valide les changements fait sur la donnée après LL par le coeur et relache le bloquage de la donnée.
6. L'interconnect global est constitué de 5 réseaux DSPIN totalement indépendants, ayant chacun une topologie de grille 2D. Cela permet de diminuer au maximum les conflits d'utilisation du réseau. Plus on a de réseaux, plus on peut avoir de cluster sans problèmes.
7. Les informations portant sur l'architecture, ce qui inclus le nombre de coeurs et le nombre de cluster, sont contenues dans le fichier arch_info.bin.
8. Le preloader a pour objectif de charger en mémoire RAM le code du bootloader généralement à partir d'une ROM externe ou d'une autre forme de stockage non volatile. 
La première tâche du bootloader est de charger en mémoire le code du système d'exploitation, initialement stocké sur le disque externe. La seconde tâche du bootloader est de charger en mémoire, à partie du disque externe de la machine, le fichier arch_info.bin situé dans le répertoire racine. 
9. Le code du noyau est dans un premier temps chargé seulement dans le cluster 0, puis il est copié dans la mémoire de tous les autres clusters par les coeurs d'indice 0, réveillés par le coeur [0][0]
10. Dans le bootloader, les segments kcode et kdata sont répliquées dans chaque cluster.
11. Ce fichier contient la description du mapping des sections produites par le compilateur C dans l'espace d'adressage de l'application.
12. Toutes les applications utilisent le même mapping mémoire d'un point de vue virtuel.
13. Il faut modifier l'image disque de TSAR pour ajouter une application car cette image contient toutes les données accesibles a TSAR, ce qui inclus le code des applications.
