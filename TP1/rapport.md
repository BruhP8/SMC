Auteurs 
    LEGOUEIX Nicolas
    HENRIKSEN Leif

scp -r -o ProxyJump=legoueix@durian.lip6.fr Documents/Fac/M2/SMC/TP1/ legoueix@anerio:Bureau    : pour scp d'une machine perso vers une machine de la salle de tp

# TD1 : Prototypage Virtuel avec SoCLib

## 2.3 : fifo_gcd_master 

Dans la fonction transition :
    L'état initial lit l'opA puis l'opB dans les registres respectifs r_opa et r_opb. On démarre donc en READ_OPA et on transitionne sur READ_OPB a condition que la fifo soit prete a être lue (signal ROK valide). Une fois la deuxième donnée récupérée (fonction data.read() ), on transitionne en COMPARE.
    En COMPARE, on transitionne en DECR_A si la valeur du registre a est supérieure à celle du registre b, en DECR_B si valeur du registre a est inférieure à celle du registre b ou en WRITE_RES si les deux valeurs sont égales.

Header :
    on déclare 3 registres : fsm, a et b nécessaires a la machine de transition
    on déclare également 4 ports a, b de type fifo, et clk et reset

# Compilation & exécution "slow"

Avec une installation personelle de systemc, il convient de modifier la ligne de compilation en y ajoutant le chemin d'accès vers ses binaires systemc, par exemple :  
```bash
g++ -Wno-deprecated -fpermissive -std=gnu++0x -I. -I/users/outil/dsx/cctools/include -I/path/to/systemc/include/dir -m32 -c  fifo_gcd_master.cpp
```  

puis 

```bash
g++ -Wno-deprecated -fpermissive -std=gnu++0x -I. -I/users/outil/dsx/cctools/include -I/path/to/systemc/include/dir -m32 -c  fifo_gcd_coprocessor.cpp
``` 

le top ne compile pas et fait une erreur sur sc_start sur ma machine personnelle (avec systemc 2.3.3). sc_start(0) n'est pas considéré valide par le compilateur dans cette version. Le meme code compile parfaitement sur les machines de TP.

On prend en moyenne 420 cycles par itération

# Compilation & exécution "fast"

Avec systemCASS, la compilation fait une erreur sur l'appel a la fonction atoi(). Il fallait ajouter l'option de compilation -std=gnu++0x

La simulation est environ deux fois plus rapide avec SystemCASS par rapport à SystemC. Cela est surement du à l'odonnancement statique utilisé par SystemCASS. Etant spécialisé dans les modèles SoCLib CABA que nous utilisons, ce dernier est plus efficace.

Si une des deux opérandes vaut 0, l'automate tournera à l'infini. Il faut donc remédier a cette situation :
    - Soit en calculant des nombres aléatoires strictement supérieurs à 0
    - Soit en ajoutant un traitement spécifique, par exemple en détectant qu'un des opérateurs vaut 0 en en revoyant 0 dans ces cas là. 

# Definitions

* SystemC : SystemC est, comme Verilog et VHDL, un langage de description de matériel. SystemC a pour objectif de modéliser des systèmes numériques matériels et logiciels à l'aide de C++. Il permet donc de modéliser non seulement des systèmes matériels, mais aussi des systèmes logiciels, mixtes ou non-partitionnés (où on ne sait pas encore ce qui sera fait en logiciel, et ce qui sera fait en matériel).
<https://hdl.telecom-paristech.fr/vhdl\_intro.html>

* VHDL : (VHSIC Hardware Description Langage) est un langage de description de matériel, c'est-à-dire un langage utilisé pour décrire un système numérique matériel.

* VCI : Virtual Component Interface

* CABA : cycle-accurate / bit-accurate

* CFSM : Synchronous Communicating Finite State Machines

* Moore machine : finite-state machine whose output values are determined only by its current state.

* Mealy machine : finite-state machine whose output values are determined both by its current state and the current inputs.

* The transition function computes the next values of the registers, depending on the current values of these registers and the values of the input signals.

* The genMoore function computes the values of those output signals that depend only on the internal registers.

* The genMealy function(s) computes values of those output signals that depend both on the internal registers AND the values of the input signals.
