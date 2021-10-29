Auteurs 
    LEGOUEIX Nicolas
    HENRIKSEN Leif

scp -r -o ProxyJump=legoueix@durian.lip6.fr Documents/Fac/M2/SMC/TP2/ legoueix@anerio:Bureau    : pour scp d'une machine perso vers une machine de la salle de tp facilement

# TD2 : Protocole VCI/OCP

Les cibles sont toujours désignées par le bit ed poids fort de l'@  

CMD_WRITE : la command contient un ou plusieurs flit (adresses constantes ou consécutives), response contient un flit aquitement  
                    -> Response dans ce cas sert a confirmer le bon déroulement de l'écriture, ou son echec  
CMD_READ : la command contient un seul flit pointant sur l'@ du premier octet a lire, a lire sur PLEN octets, response un ou plusieurs flits contenant les octets  

VCI_ADDRESS : paquet command  
VCI_RSRCID : paquet response  

Les systèmes d'interconnection ont des ressources dédiées pour les commandes et les réponses afin d'être plus efficaces dans leur décodage, il ne faut en effet pas effectuer les memes opérations pour aiguiller une commande qu'une réponse   

CMDVAL / RSPVAL = WOK et ROK sous protocole fifo pour une command  
CMDACK / RSPACK = WOK et ROK sous protocole fifo pour une response  

Tous les paramètres d'architecture sont définis dans un VciParams pour permettre d'adapter toute l'architecture a différentes valeurs des paramètres facilement (une modification sur cet objet modifie l'archi sur tous les autres composants)  
Un composant peut soit avoir un index global unique soit un couple {indexe_cluster, indexe_local}. Auquel cas on peut avoir plusieurs composants ayant un meme indexe, a condition qu'ils ne soient pas dans le meme cluster.  

# Coprocesseur

16 octets en mémoire (4 registres de 4o) + un port VciTarget  
    OPA    : base + 0x0 RD/WR  
    OPB    : base + 0x4 WRO  
    START  : base + 0x8 WRO  
    STATUS : base + Oxc RDO  

## FSM Coproc
Par lecture du schéma fourni, on déduis :

### Reset 

Le reset sur la FSM EXE fait aller en état EXE_IDLE, et sur la FSM VCI, il fait aller en état VCI_GET_CMD


### Transition EXE
* En IDLE, on passe en EXE_COMPARE si le contenu du registre VCI_RSP_START est significatif
* En COMPARE,
  * Si le contenu du registre OPA est strictement supérieur a celui du registre OPB, on passe en EXE_DECA
  * Si le contenu du registre OPA est strictement inférieur a celui du registre OPB, on passe en EXE_DECB
  * Sinon, on retourne en IDLE.
* En EXE_DECA (respectivement EXE_DECB)
  * On soustrait le contenu du registre OPB à celui du registre OPA et on met le résultat dans le registre OPA (respectivement on met OPB - OPA dans OPB)
  * On retourne en EXE_COMPARE

### Transition VCI 
* En GET_CMD, 
  * On récupère les valeurs de SRCID, TRDID et PKTID depuis les champs respectifs dans p_vci.
  * Si la commande set une lecture et que la cell (l'objet qu'on souhaite lire ?) est le registre OPA, c'est qu'on essaye de lire le résultat du calcul, on passe donc en VCI_RSP_RESULT
  * Si la commande est une lecture et que la cell est le registre STATUS, on passe en VCI_RSP_STATUS.
  * Si la commande est une écriture et que la cell est le registre OPA (respectivement OPB), on met a jour le registre OPA (OPB) avec les données du paquet et on passe en VCI_RSP_OPA (VCI_RSP_OPB)
  * Enfin, si la commande est un écriture et que la cell est le registre START, on passe en VCI_RSP_START 

### genMoore VCI

Cet automate détermine le contenu de la réponse renvoyée au master. En regardant le schéma, on voit qu'on aura 8 champs à remplir :  
CMDACK, RERROR, RDATA, REOP, RSRCID, RTRDID, RPKTID et RSPVAL.    
Par défaut, on ne fait pas d'erreur, RERROR devra donc etre, selon le protocole, mis à 0. De meme, REOP (pour End Of Packet) vaut toujours 1. Les valeurs, RSRCID, RTRDID et RPKTID sont respectivement r_srcid, r_trdid et r_pktid.    
On teste ensuite l'état de la machine :  
* En GET_CMD : On a pas encore de commande, et on a pas encore de réponse à envoyer. ACK est donc true (la mahcine est prete), RSPVAL est false (pas de résultat valide à proposer) et RDATA est à 0 (pas de données à envoyer)
* En OPA, OPB et START : ACK passe a false (la machine est occupée). De même, RSPVAL passe à true (un résultat est produit) mais RDATA reste à 0 (le résultat n'est pas encore bon, on est toujours en calcul).
* En STATUS : ACK et RSPVAL restent inchangés, et RDATA doit être 0 si le coprocesseur est IDLE, autre chose sinon. Pour cela, on teste la valeur de l'état courant de la FSM transition EXE : r_exe_fsm.
* En RESULT : ACK reste a false (la machine est occupée) et RSPVAL reste à true. Le champ RDATA prends la valeur de r_opa qui contient le résultat de l'opération.

TODO automates séparés ? Mécanisme SysC qui permet la desc des deux automates indifférent ? Erreurs + vérifications ?


## FSM Master

### Reset

En reset, la machine à état se remet en mode état RANDOM.

### Transition

Par lecture du schéma fourni, on déduis :

* En RANDOM : Passage en état CMD_OPA et mise à jour des registres OPA et OPB avec deux nombre aléatoires. (supérieurs à 0)
* En CMD_OPA : Passage en RSP_OPA quand le signal CMD_ACK est valide.
* En RSP_OPA : Passage en CMD_OPB quand le signal RSP_VAL est valide.
* En CMD_OPB : Passage en RSP_OPB quand le signal CMD_ACK est valide.
* En RSP_OPB : Passage en CMD_START quand le signal RSP_VAL est valide.
* En CMD_START : Passage en RSP_START quand le signal CMD_ACK est valide.
* En RSP_START : Passage en CMD_STATUS quand le signal RSP_VAL est valide.
* En CMD_STATUS : Passage en RSP_STATUS quand le signal CMD_ACK est valide.
* En RSP_STATUS : Passage en CMD_RESULT quand le signal RSP_VAL est valide et que le champ rdata vaut 0, ou retourne en CMD_STATUS si RSP_VAL est valide mais que rdata ne vaut pas 0.
* En CMD_RESULT : Passage en RSP_RESULT quand le signal CMD_ACK est valide.
* En RSP_RESULT : Passage en DISPLAY quand le signal RSP_VAL est valide. Récupération du résultat de l'opération dans le champ rdata de p_vci.
* En DISPLAY : Retour en RANDOM.

# passage en multi maitre/cible

On ajoute dans un premier temps deux nouveaux segments a la maptable, afin d'accomoder les nouveaux maitres et cibles.
Il faut ensuite autant de signaux VCI qu'on a de maitre et cibles soit 3 de chaque. On déclare donc 3 signaux master et 3 signaux coproc.  
Il s'agit ensuite de raccorder ces signaux a la inttable sur leur segments respectifs (donc, GCD_BASE, BASE + 10000000 et BASE + 20000000)  

Le tout est relié au moyen d'une instance de vciGsb pour le bus, contenant les 3 maitres et 3 corproc renseignés dans la maptable  
Dans la netlist, chaque composant est relié au reset et à la clk, ainsi que (pour les master et coproc).  
On lie le signal propre à chaque master au bus et au master, de même pour les signaux coproc.
