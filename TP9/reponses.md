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

