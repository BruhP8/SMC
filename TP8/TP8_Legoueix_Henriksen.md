LEGOUEIX Nicolas  
HENRIKSEN Leif

# Preloader

1. Le pré-loader est responsable de charger le bootloader. C'est lui qui le charge en mémoire afin de pouvoir démarrer la séquence de boot.
2. Son code est stocké dans une mémoire non volatile paramétrable. Cette dernière peut varier celon l'architecture utilisée. Sur TSAR-LETI, il s'agit des premiers 16Ko de mémoire physique du cluster 0. Sur TSAR-IOB, il s'agit d'une ROM externe dédiée elle aussi lue depuis le cluster 0.  
Lors du reset, le registre d'adresse contient 0, ce qui signifie que tous les coeurs accèdent à l'adresse 0 du cluster 0 qui est celle qui contient le code du preloader.
3. Lors du démarrage, par défaut tous les coeurs ne font qu'une initialisation succinte (activation de leur cannal d'interruption avec le controlleur de leur cluster) avant de rentrer dans un état d'hibernation partielle. Ils restent inactifs jusqu'à ce qu'ils ne recoivent une IPI (Inter Processor Interrupt). Dans l'ordre, le coeur [0][0] est le seul à tourner, il envoie une IPI au coeur 0 de chaque cluster composant l'architecture, qui a leur tour envoient une IPI à tous les autres coeurs de leur cluster.
4. On sort du préloader quand le code de boot est chargé dans le processeur [0][0] et que tous les autres sont en attente d'une IPI.

# Bootloader

1. Le bootlaoder a pour tâche de charger au sein de chaque cluster une copie du code du noyau du système d'exploitation, accompagnée d'une description de l'architecture (nombre de coeurs / cluster, disposition, périphériques, nombre de coeurs par cluster, mémoire disponible...).  
Il utilise pour cela des fichiers binaires (.bin) et doit donc par conséquent avoir accès au périphérique de stockage, et à la mémoire pour y écrire le code.
2. La description de l'architecture utilisée est faite dans le fichier arch_info.bin
3. Le code du bootloader doit être recopié dans chaque cluster car c'est lui qui permet de savoir aux coeurs si ils doivent juste s'initialiser au démarrer l'entrée dans le bootloader. *pas sur de moi la dessus...*
4. .
5. Une IPI, ou Inter Processor Interruption est un type particulier d'interruption. Au lieu de provenir d'un périphérique, celle ci provient d'un autre coeur. Le bootloader utilise ce mécanisme pour que tous les coeurs sauf le premier de chaque cluster restent en sommeil. Cela permet dans un premier temps que seul le processeur [0][0] ne fonctionne, le temps qu'il n'initialize les termibaux TTY, le système de fichier, charge le noyau et le copie dans la pile etc. Quand cette première initialisation est faite, une première vague d'IPI est lancée par ce dernier afin de réveiller tous les autres coeurs 0 des autres clusters. Ces derniers peuvent alors s'intialiser en copiant le code boot loader, créant les premières tables de pages, activant les MMU et en se synchronisant les uns les autres. Une seconde vague d'IPI est ensuite lancée dans laquelle les autres coeurs de chaque cluster sont activés.

# Kernel Init

1. Dans chaque cluster, le noyau peut accèder à la description de la plateforme matérielle en accèdant à sa zone mémoire ARCH_INFO. Le boot loader y a placé le contenu du fichier arch_info.bin.
2. ALMOS-MKH identifie les coeurs de la plateforme en utilisant un registre dédié dans chaque coeur qui définit l'identifiant global (GID) de ce coeur. Ce dernier est unique et propre au coeur. Cet identifiant est composé de deux parties : CXY, qui désigne les coordonnées XY du cluster auquel appartient le coeur dans le réseau, et LID (local ID) qui désigne le numéro du coeur au sein du cluster.
3. Les descripteurs de threads IDLE sont rangés dans le segment kdata de la pile du coeur. Il y a un thread IDLE par coeur lors de l'intialisation du kernel.
4. Les barrières de synchronisation sont nécessaires pour éviter que certains coeurs n'essayent de communiquer avant d'être complètement initialisés, ou qu'ils n'essayent d'accèder à des terminaux ou aux tables VSL/GPT avant leur initialisation.
5. 6. 7. Pas trop compris le focntionnement des barrières...
