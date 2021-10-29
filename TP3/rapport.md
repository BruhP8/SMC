Auteurs 
    LEGOUEIX Nicolas
    HENRIKSEN Leif

scp -r -o ProxyJump=legoueix@durian.lip6.fr Documents/Fac/M2/SMC/TP3/ legoueix@anerio:Bureau    : pour scp d'une machine perso vers une machine de la salle de tp facilement

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

## Cross compilation 

Il convient d'éditer le makefile pour utiliser la bonne version de la chaine de compilation : 8.2.0 au lieu de 4.3.3.  
De meme, il faut éditer le fichier config.h afin d'y déclarer la variable NO_HARD_CC (mise à 1) 
