Unit Uprogramme;

interface

uses Crt, Uinitialisation;



PROCEDURE AfficheMenuChoixNbrJoueurs();
FUNCTION SaisirChoixNbrJoueurs() : Integer;
PROCEDURE AfficheMenuCategorieJeu();
procedure effectueActionMenu(choix : integer);
Function SaisirChoix():Integer;
implementation

(*
 ------------------------------------------------------------------------------------
 -- Procedure         : AfficheMenuChoixNbrJoueurs
 -- Auteur            : Bara Dioukhane - Lisa Barlet - Valentin Labat
 --
 -- But               : Affiche le menu du choix du nombre de joueurs
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : Affiche le menu du choix du nombre de joueurs
 ------------------------------------------------------------------------------------*)

PROCEDURE AfficheMenuChoixNbrJoueurs();
BEGIN
   writeln();
   writeln('Entrez maintenant le nombre de joueurs souhaité');
   writeln();
   writeln('1 : 1 joueur');
   writeln('2 : 2 joueurs');
   writeln('3 : 3 joueurs');
   writeln('4 : 4 joueurs');
   writeln('');
   writeln('0 : Quitter');
END;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : SaisirChoixNbrJoueurs
 -- Auteur            : Bara Dioukhane - Lisa Barlet - Valentin Labat
 --
 -- But               : Permet la saisie d'un choix pour le menu de choix du nombre de joueurs
 -- Remarques         : Le nombre retourné est compris : 0 <= x < 5
 -- Pré conditions    : Aucune
 -- Post conditions   : Permet la saisie d'un choix pour le menu de choix du nombre de joueurs
 ------------------------------------------------------------------------------------*)

FUNCTION SaisirChoixNbrJoueurs() : Integer;
VAR
   choix : Integer;
BEGIN
   REPEAT
      AfficheMenuChoixNbrJoueurs();
      writeln('');
      writeln('Entrez votre choix : ');
      readln(choix);
   UNTIL ((choix >= 0) and (choix < 5));
   SaisirChoixNbrJoueurs:=choix;
END;


(*
 ------------------------------------------------------------------------------------
 -- Procedure         : AfficheMenuCategorieJeu
 -- Auteur            : Dioukhane Bara - Lisa Barlet - Valentin Labat
 --
 -- But               : Affiche le menu du choix de la catégorie du jeu
 -- Remarques         : Aucune
 -- Pré conditions    : Aucune
 -- Post conditions   : Affiche le menu du choix de la catégorie du jeu
 ------------------------------------------------------------------------------------*)

PROCEDURE AfficheMenuCategorieJeu();
BEGIN
   writeln();
   writeln('Bienvenue dans le Qwirckle, choisissez d''abord le mode de jeu souhaité');
   writeln();
   writeln('1 : Mode de jeu 1 : 3 couleurs, 3 formes, 2 de chaque');
   writeln('2 : Mode de jeu 2 : 6 couleurs, 6 formes, 3 de chaque');
   writeln('');
   writeln('0 : Quitter');
END;

(*
 ------------------------------------------------------------------------------------
 -- Procedure         : effectueActionMenu
 -- Auteur            : Dioukhane Bara - Lisa Barlet - Valentin Labat
 --
 -- But               : Lance les actions correspondantes par rapport au choix de l'utilisateur
 -- Remarques         : Si choix vaut 0 alors on affiche un message de sortie
 -- Pré conditions    : 0 <= choix < 3
 -- Post conditions   : Lance les actions correspondantes par rapport au choix de l''utilisateur
 ------------------------------------------------------------------------------------*)

PROCEDURE effectueActionMenu(choix : Integer);
VAR
   choixNbrJou, i, ageJou : integer;
   jeu1			  : jeu;
BEGIN
CASE choix OF
1 : begin
       choixNbrJou:=SaisirChoixNbrJoueurs();
       setlength(jeu1.tabJoueurs, choixNbrJou);
       For i:=0 to choixNbrJou -1 do
       begin
	  writeln('Entrez l''âge du joueur ', i+1);
	  readln(ageJou);
	  jeu1.tabJoueurs[i].age:=ageJou;
       end;
       jeu1:=initialisationComplete1(jeu1);
      (* jeu1:=jeuJoueur(jeu1);*)
    end;
2 : begin
       choixNbrJou:=SaisirChoixNbrJoueurs();
       (*jeu1:=initialisationComplete2(jeu1,choixNbrJou);*)
       writeln(jeu1.tour);
    end;
ELSE
   writeln('Bye');
END;

END;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : SaisirChoix
 -- Auteur            : Dioukhane Bara - Lisa Barlet - Valentin Labat
 --
 -- But               : Permet la saisie d'un choix pour le menu
 -- Remarques         : Le nombre retourné est compris : 0 <= x < 3
 -- Pré conditions    : Aucune
 -- Post conditions   : Permet la saisie d'un choix pour le menu
 ------------------------------------------------------------------------------------*)

FUNCTION SaisirChoix() : Integer;
VAR
   choix : Integer;
BEGIN
   REPEAT
      AfficheMenuCategorieJeu();
      writeln('');
      writeln('Entrez votre choix : ');
      readln(choix);
   UNTIL ((choix >= 0) and (choix < 3));
   SaisirChoix:=choix;
END;



VAR
   choix : Integer;
(*Début du programme principal*)
BEGIN
   randomize();
   REPEAT
      choix:=SaisirChoix();
      effectueActionMenu(choix);
      (* Ou aussi effectueActionMenu(SaisirChoix()) *)

UNTIL (choix = 0);
END.
