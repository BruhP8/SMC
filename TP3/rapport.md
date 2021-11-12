Auteurs 
    LEGOUEIX Nicolas
    HENRIKSEN Leif

scp -r -o ProxyJump=legoueix@durian.lip6.fr Documents/Fac/M2/SMC/TP3/ legoueix@anerio:Bureau    : pour scp d'une machine perso vers une machine de la salle de tp facilement

./simulator.x -DEBUG 0 -NCYCLES 10000 > debug.txt
ctags -R /users/enseig/alain/giet_2011/ .
~franck/tracelog tags soft/app.bon.txt soft/sys.bin.txt debug.txt
vim trace.s

a faire depuis le dossier tpx_etudiant pour avoir un trace de debug.

# TD3 : Protocole VCI/OCP

soft/seg.id : adresses pour le logiciel 
top         : adresses pour le HW

TODO : convention giet pour @ 1e instr

## main.c

Pour l'instant, le programme de main.c écrit hello world sur la tty de l'architecture matérielle, puis attends une entrée clavier. Quand une saisie est détectée, le programme reboucle sur le hello world + attente clavier.

Appels systeme TTY :
    TTY_READ
    TTY_WRITE
    TTY_READ_IRQ
    TTY_WRITE_IRQ

TODO  analyse de leur code


La consultation du fichier app.bin.txt met en évidence les instructions de tout le programme, du démarrage et chargement du GIET au programme hello world en incluant toutes les fonctions que ce dernier utilise. On peut voir dans la section commencant à l'adresse 
004012e8 les 14 instructions de la fonction main.  
En descendant dans la section désassemblée de seg_data, on remarque que la première adresse est bien 004012e8 donc celle de la section main.

MappingTable :
	MappingTable maptab(addr_size, IntTab(1), IntTab(2), 0xFF000000);

        addr_size  : nombre de bits composant les adresses VCI, dans notre cas 32
        IntTab(1)  : Nous n'avons qu'un seul initiateur, un seul bit suffit par conséquent
        IntTab(8)  : Nous n'avons que 4 cibles, deux bits suffisent a les représenter
        0xFF000000 : Les 8 premiers bits sont ceux qui nous intéressent

Les segments GCD, TTY et KUNC doivent etre non cacheables



## Cross compilation 

Il convient d'éditer le makefile pour utiliser la bonne version de la chaine de compilation : 8.2.0 au lieu de 4.3.3.  
De meme, il faut éditer le fichier config.h afin d'y déclarer la variable NO_HARD_CC (mise à 1) 
