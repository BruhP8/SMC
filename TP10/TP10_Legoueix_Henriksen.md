LEGOUEIX Nicolas  
HENRIKSEN Lief

# Questions

1. Le PID est codé sur 32bits. Les 16 premiers bits (poid fort) identifient le cluster propriétaire du processus, c'est à dire celui qui l'a créé. Il s'agit notament des coordonnées X Y du cluster au sein du réseau de communication. Les 16 derniers bits (poid faible) contiennent le numéro de PID local, c'est à dire le PID au sein du cluster concerné. CXY+LPID. Ce type d'encodage permet de toujours avoir accès au cluster propriétaire, et donc de savoir où adresser les requêtes pour accèder aux ressources.
2. - Le cluster *owner* est le créateur original du process. Etant donné que c'est lui qui dicte le PID du process, il ne peut pas changer.
   - Le cluster *reference* est initialement le même que le cluster *owner*, mais cela peut changer dans le temps par exemple lors d'une migration de processus. C'est lui qui contient la structure de référence du process. 
   - Les clusters *copy* sont tous les clusters autres que le cluster *reference* et le *owner* en charge d'au moins un thread du processus
3. Celà simplifie les choses car  il n'y a pas besoin de différenceier le numéro de thread du point de vue kernel et celui du point de vue de l'utilisateur. La migration d'un thread peut poser problème d'un point de vue performances car elle nécessite de mettre à jour la structure thread de tous les autres threads dans tous les clusters (champs children_root et children_list). C'est une procédure très chronophage.
4. Il y a 4 types de threads :
   - USR (User) : ce sont les threads crés par l'appel système pthread_create(). ce sont donc les plus courants.  
   - DEV (Device) : Ce sont les threads créés par l'OS afin de traiter les opérations en attente pour un device. Ils vérifient périodiquement la file d'attente de ce dernier, et si elle contient quelque chose, exécutent la requète.
   - RPC : Activés par le kernel, ces threads exécutent les requètes RPC dans la FIFO RPC Locale. RPC = Remote Procédure Calls, les requêtes provenant d'autres clusters.
   - IDL (Idle) : C'est un thread vide n'effectuant aucune opération. Il est choisit par le scheduler dans le cas où il n'y a rien d'autre à faire dans ce coeur.
5. La VSL est la liste des segments virtuels dans la mémoire locale alloués pour un processus. Il y a 6 types de VSEG :
   - DATA, ANON et REMOTE
   - STACK
   - CODE
   - FILE
La GPT (Generic Page Table) définit l'adressage physique de chaque page de tous les VSEG du process dans ce cluster.

6. Quand un process n'est pas que sur un seul processus, la VSL n'est pas qu'une simple copie de la VSL du cluster de référence car une VSL contient des données privées qui doivent rester locales à un thread. Un segment peut donc exister pour un thread mais pas pour un autre. Ainsi, la VSL ne doit pas être bêtement copiée.

7. Je ne saurai pas dire... Si c'est deux clusters, on a deux threads différents, donc chacun a son propre VSL local ca ne pose pas de problème... Si ?
8. Lors de la création d'un nouveau process, fork() créé le process et un premier thread, qui hérite du contexte complet de son parent. Si exec() n'est pas appelé, l'enfant commencera donc a éxécuter le code suivant que son père allait exécuter après l'appel à fork().  
Exec() change le code exécuté par le thread enfant afin de lui faire faire une autre application. Le nouveau process conserve son PID et reste lié au process parent (et conserve donc ses variables d'environnement et ses descripteurs de fichiers). Un nouveau descripteur de thread est créé en suivant les valeurs dictées par le code de la nouvelle application.  
En résumé : fork créé l'enfant, et exec lui donne son idépendance (une autre tache a exécuter).
9.  Le bit COW (Copy On Write) se trouve sur toutes les pages de la GPT. Il sert a signaler qu'une page doit être copiée quand elle est modifiée. Il n'est pas systématiquement utilisé et n'est modifié que quand un thread d'un processus appelle fork(). C'est du moins ce que je comprends. Je ne suis pas sur d'avoir bien cerné son fonctionnement.
10. Si un process avec 3 threads voit un de ses threads faire un fork() mais pas de exec(), on se retrouvera avec deux process : un avec trois threads, et un avec un thread.
11. Une RPC, pour Remote Procedure Call est émise par un thread en cas de donnée manquante dans le cluster où il se trouve. En pratique, la RPC demande à un cluster autre que celui dont elle émane d'effectuer une partie du travail devant être fait. 
12. La RPC simple est une demande ciblée. Il n'y a qu'une seule demande, destinée à un seul cluster, et elle n'attend qu'une seule réponse. Par contraste, la RPC parallèle s'adresse à plusieurs clusters et attends donc plusieurs réponses.
13. Le suicide (c'est pas cool, ya d'autres solutions voyons ;) ) d'un thread arrive lors de l'appel système pthread_exit(). Ce dernier est fait par le thread lui même. Le meurtre (mais mérite t-il vraiment ce sort ?) d'un thread est causé par l'appel système pthread_cancel() fait par un autre thread. De même, l'appel système kill() et exit() font un génocide (beuh) en tuant tous les threads d'un même process.  
Qu'il s'agisse de pthread_exit() ou de pthread_cancel(), la fonction thread_delete() est appelée. Elle marque le thread comme mort dans le descripteur. A son prochain passage, le scheduler se détachera de ce thread après avoir appelé la fonction thread_destroy(). Il est plus simple de tuer un thread s'exécutant en mode détaché car (il est isolé et est donc une proie facile ? Bon... j'arrête) il suffit au tueur de lever les flags THREAD_BLOCKED_GLOBAL et THREAD_FLAG_REQ_DELETE dans les champs du thread devant être tué, puis de laisser le scheduler faire le travail a son prochain passage. Si le thread était attaché, il aurait dans un premier temps fallu informer tous les threads pouvant être ammenés à rejoindre le thread devant mourrir que ce dernier va être terminé.  
*Je suis désolé, mais c'est glauque le scheduling*
