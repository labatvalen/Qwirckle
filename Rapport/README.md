(--------------------------Readme---------------------------------)
Membres du groupe


# Qwirkle
Ceci est un projet fait en première année du cycle préparatoire, codé en [Pascal](https://www.freepascal.org/). 
Conçu en 2006 par Susan McKinley Ross, Qwirkle est un jeu de société à base de tuiles qui a  obtenu de  nombreuses récompenses  dont le  très renommé “Spiel des Jahres” (jeu  de  l'année) 2011 en Allemagne.
Qwirkle est également un jeu de société pour deux à quatre joueurs, se jouant avec des jetons carrés (tuiles). Ce jeu de société a été conçu par MindWare, et il partage quelques similitudes avec le Rummikub et le Scrabble.


Installation :
-Logiciel requis : 
	Free Pascal Compiler (FPC)
	Installation de FPC : Dans un terminal entrez la commande suivante : sudo apt-get install fpc
-Installation du jeu : Se diriger dans le répertoire contenant le programme Qwirkle.pas ainsi que de plusieurs unités ensuite utiliser la commande : fpc ProjetQwirkle.pas , une fois la compilation terminée le jeu sera installé sous le nom de Qwirkle.

Éxecution :
Pour lancer le jeu, dans un terminal, en se situant toujours dans le répertoire contenant le jeu, utiliser la commande suivante : ./ProjetQwirkle
A noter qu'ici on ne peut jouer qu'à un joueur.

Règles : 
Qwirkle se joue à 2 joueurs ou 4 joueurs sur un plateau de 10x10 cases. On distingue les cases en bordure et les cases intérieures. Le vainqueur de Qwirkle est celui qui aura le plus de points.
 
 -Début du jeu 
Chaque joueur possède huit pions (tuiles) de couleurs et de formes différentes, obtenus aléatoirement. Chaque joueur ne connaît pas les pions de son adversaire.
D'une part, les couleurs des tuiles sont le rouge, le vert, le jaune, le blanc, le violet et le bleu.
D'autre part, les formes des tuiles sont le cercle, la triangle, le losange, le carré, l'étoile et le trèfle. 

Chaque joueur possède six tuiles. Les tuiles restantes restent dans la pioche. Chaque joueur examine son tirage et annonce son nombre le plus élevé de tuiles ayant une caractéristique commune, couleur ou forme. Le joueur ayant le plus de tuiles avec la même caractéristique débute (couleur ou forme). Il pioche une nouvelle fois de façon à avoir de nouveau 6 tuiles devant lui. 

 -Déroulement de la partie 
Le joueur suivant peut effectuer l'une des trois actions suivantes.
	● Ajouter une tuile à une ligne
	● Ajouter deux tuiles ou plus à une ligne : Chacun à leur tour, les joueurs ajoutent des tuiles à la ligne créée au premier tour. Tous les coups 		  joués doivent être liés à la ligne existante. Il existe six formes et six couleurs. Les joueurs créent des lignes de formes et de couleurs. Deux 		  ou plusieurs tuiles qui se touchent créent une ligne de formes ou une ligne de couleurs. Les tuiles qui sont ajoutées à cette ligne doivent 		  avoir la même caractéristique que les tuiles qui se trouvent déjà sur la ligne. Il peut arriver qu'il y ait des places sur la ligne où aucune 	  tuile ne peut être ajoutée. Une ligne de formes ne peut avoir qu'une tuile de chacune des six couleurs. Par exemple, sur une ligne de losanges, 		  il ne peut y avoir qu'un seul losange bleu. Une ligne de couleur ne peut avoir qu'une tuile de chacune des six formes. Par exemple, sur une 		  ligne de jaune, il ne peut y avoir qu'un seul cercle jaune.
    	● Échanger des tuiles : Lorsque c'est son tour, un joueur peut choisir d'échanger tout ou une partie de ses tuiles au lieu de les ajouter à une 	  ligne. Dans ce cas il faut mettre de côté les tuiles à échanger, puis tirer le même nombre de tuiles de réserve. Il faut ensuite remettre les 	  tuiles mis de côté dans la pioche et mélanger. Le joueur passe alors son tour.


-Les pions 
Le mouvement des pions se fait en fonction de leur forme et de leur coleur: 
● les carrés se déplacent horizontalement et verticalement. 
● les losanges se déplacent en diagonale. 
● les triangles se déplacent en diagonale vers l'avant et tout droit vers l'arrière. 
● les cercles se déplacent dans les huit directions .
  
Les joueurs jouent à tour de rôle, en déplaçant un seul pion par tour. Deux pions ne peuvent occuper la même case. Passer son tour n'est pas autorisé à moins qu'un joueur ne puisse déplacer aucun pion et qu'il n'y est plus de pion dans la pioche. Dans ce cas, le joueur passe son tour jusqu'à ce qu'il puisse de nouveau exécuter un coup légal. 
  
 -Déplacement simple 
Un pion peut être déplacé vers une case adjacente en respectant les directions selon le type du pion. 
 
 -Angles et côtés du plateau 
Un pion peut librement entrer et quitter sa zone d'arrivée. Sinon, à l'exception de sa zone d'arrivée, le déplacement d'un pion ne doit jamais finir sur une case en bordure. 
Cependant, un pion peut visiter temporairement une case en bordure s'il la quitte de nouveau pendant le même tour. 

-Calcul des points
Quand un joueur forme une ligne, il marque 1 point pour chaque tuile présente dans la ligne. Quand il ajoute une tuile à une ligne existante, il marque 1 point pour chaque tuile de cette ligne, y compris les tuiles qui se trouvaient au préalable sur cette ligne. Une tuile peut rapporter 2 points si elle appartient à deux lignes différentes. Le joueur marque 6 points supplémentaires chaque fois qu'il termine une ligne de six tuiles (couleur ou forme). Le joueur qui termine la partie obtient 6 points supplémentaires.
  
 -Fin du jeu 
Quand la pioche ne contient plus de tuiles, les joueurs continuent à jouer mais ne tirent plus de tuiles à la fin de leur tour. Le premier joueur qui utilise toutes ses tuiles et termine la partie obtient 6 points supplémentaires. Si aucun joueur ne peut ajouter de tuiles et que personne ne peut terminer la partie, les 6 points ne sont pas attribués. Le gagnant est celui qui possède le plus grand nombre de points.

 -Guide d'utilisation :
Pour jouer, cliquez une première fois sur un pion appartenant à l'équipe à qui le tour est, les mouvements et les sauts possibles s'afficheront, cliquez ensuite sur une case illuminée (jaune ou violet), pour déplacer le pion et terminer le tour. Si vous avez sélectionné un pion et que vous souhaitez changer de sélection pas de soucis, il vous suffit de cliquer sur le pion que vous voulez sélectionner. Sachez qu'une fois un tour terminé aucun retour en arrière n'est autorisé, alors attention aux erreurs et soyez vigilants sur vos mouvements. Dans le cas d'une succession de sauts, le pion sélectionné peut effectuer une succession de sauts infinie (si souhaitée et tant que ceux-ci sont légaux) dans le même tour jusqu'à ce que le joueur décide avoir terminé son tour, il peut même retourner à sa position initiale du début de tour. Afin de terminer une succession de saut, cliquer avec le clic droit n'importe où sur la page et ainsi le tour sera terminé.
Vous savez désormais comment jouer à  alors let's play!
