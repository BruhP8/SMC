LEGOUEIX Nicolas  
HENRIKSEN Leif

# TP9

## Questions sur la MMU de TSAR

1. Les 11 premiers bits constituent le champ ID1, qui identifie un indice d'entrée dans la table. Les 9 bits suivants consitutent le champ ID2,
 qui identifie la page à selectrionner dans la table pointée par ID1. Enfin, les 12 derniers bits consitutent un décalage à appliquer à partir de l'adresse de 
 base donnée par ID2.  
 Les deux niveaux de pages doivent être alignés pour fonctionner, c'est à dire que PTBA (ce qui est désigné dans ID1) doit être multiple de 8k octets, et que PTE (ce qui est désigné dans ID2) doit être un multiple de 4k octets.
2. PPN est représenté sur 28 bits pour une page de 4K octets.
   Dans les flags, il y a :
   - V : bit de validité
   - T : bit de type
   - L : bit d'accès local
   - R : bit d'accès distant
   - C : bit de cacheabilité
   - W : bit autorisant l'écriture
   - X : bit signalant la présence d'instruction
   - U : bit d'appartenance de la page (User/Kernel)
   - G : bit permettant de protéger la table des flush de la TLB
   - D : bit dirt : la page a été modifiée
3. Le registre de la MMU contenant l'adresse de base de la table est MMU_PTPR, il sert à trouver la table d'adresses attribuée au processus courrant.
4. Le registre permettant d'activer ou de désactiver la MMU est MMU_MODE. L'OS interagis avec ce registre au moyen de drivers dédiés à la MMU.
5. Le registre permettant de construire une adresse sur 40 bits quand la MMU_DATA est desactivée est MMU_DATA_PADDR_EXT. 
6. En cas de MISS, la TLB le signale au système d'exploitation par le biais d'une exception avec les signaux : MMU_READ/WRITE_PT1/2_UNMAPPED.
7. Il faut savegarder / restaurer au moins les registres MMU_PTPR et MMU_MODE.

## Politique de Réplication & Distribution

1. Almos MKH représente l'ensemble des segments accesibles dans l'espace virtuel d'une application grâce une structure VSL, Virtual Segment List. Cette structure définis les adresses auxquelles l'application à le droit d'accèder à tout instant.
2. Almos définis une GPT (Generic Page TableVirtual). Il s'agit d'une structure de données définissant la table des pages pour une certaine application. L'implémentation de cette structure dépend des caractéristiques de la MMU matérielle et elle fait donc partie de la HAL (Hardware Abstraction Layer).

3. Chaque enfant doit pouvoir avoir accès a son parent, accèder au file descriptor, ou encore accèder a la liste de tous les autres threads du processus. Ces informations sont toutes contenues dans une structure process_descriptor. Il est donc nécessaire que ce dernier soit répliqué dans chaque thread.
4. Chaque cluster contenant un thread de l'application possède une copie du segment code de l'utilisateur. Cela permet d'éviter d'avoir tous les threads qui accèdent à l'unique copie du parent.
5. Le segment user Stack est également copié dans chaque cluster contenant au moins un thread de l'application utilisateur pour maximiser la localité.
6. Pour éviter la contention, le segment user data est partagé entre chaque cluster par pages. Chaque cluster ne peut pas disposer de deux pages consécutives. Contrairement aux deux autres segments, il ne s'agit *pas* d'une copie, mais bien d'une répartition.
7. Les segments Kernel doivent être accédés localement dans chaque cluster contenant au moins un thread du processus utilisateur afin de pouvoir effectuer des appels systèmes tout en minimisant la contention et en minimisant les communications sur le réseau.
8. KHEAP est un segment partagé entre les clusters, il n'est pas dupliqué. Chaque segment partagé doit donc pourvoir rester accesible par tous les processus (copie unique, contrairement aux segments user qui sont aussi nombreux qu'il n'y a d'applications). Almos utilise des pointeurs étendus pour distinguer les adresses locales et les adresses distantes.
9. Dans le cadre d'une architecture TSAR-MIPS32, almos gère les accès distants à l'aide d'une seconde Data MMU servant exclusivement à obtenir les adresses sur 40 bits. Elle utilise un registre DATA_PADDR_EXT qui contient les coordonnées CXY du cluster ciblé par l'accès distant. Les fonctions remote_load() et remote_store() sont utilisées pour modifier ce registre.
10. Dans le cadre d'une architecture Intel64, un espace d'adressage virtuel de 256TB est disponible, on peut donc directement adresser chaque segment virtuel  sans avoir besoin d'une MMU spécialisée (on a besoin seulement de 40 bits sur les 48 disponibles). 
   
