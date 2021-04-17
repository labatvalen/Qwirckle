Unit Uinitialisation;

interface

const
   VIDE	      = 'COUCOU';
   
   C1	      = 3; 
   F1	      = 3;
   Id1	      = 2;
   borneForm1  = C1*Id1;
   borneCoul1  = F1*Id1;
   taillePioche1     = C1*F1*Id1;
   Tplateau1   = 18;

   C2	      = 6; 
   F2	      = 6;
   Id2	      = 3;
   borneForm2  = C2*Id2;
   borneCoul2  = F2*Id2;
   taille2     = C2*F2*Id2;
   Tplateau2   = 18*18;

type
   pieces      = Record
		    couleur : string;
		    forme   : string;
		 end;	    
   plato       = array of array of pieces;
   m1	       = array of pieces;
   joueur      = Record
		    age	  : Integer;
		    typ	  : string;
		    nom	  : string;
		    point : Integer;
		    main  : m1;
		 end;	  
   joueurs     = array of joueur;
   pioch       = array of pieces;
   jouCommence = Record
		    nbrJouCommence : integer;
		    position	   : array of Integer;
		 end;
   
   jeu	       = Record
		    tailleMain	    : Integer;
		    joueursCommence : jouCommence;
		    plateau	    : plato;
		    tour	    : Integer;
		    pioche	    : pioch;
		    tabJoueurs	    : joueurs;
		    tabchoix	    : m1;
		 end;		    
   tabPiecIden = array of integer;

function formePioche1(jeu1 : jeu):jeu;
function couleurPioche1(jeu1 : jeu):jeu;
function init_grille1(jeu1 : jeu):jeu;
Function MainsVides1(jeu1 : jeu):jeu;
function piocher(jeu1 : jeu; pieceManquante,numero, posiPiece:integer):jeu;
Function nvlPioche(jeu1	: jeu):jeu;
Function initialisationMain1(jeu1 : jeu):jeu;
Function initialisationComplete1(jeu1 : jeu):jeu;

implementation

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : forme1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet d'initialiser la forme des pièces dans le mode de jeu 1
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : initialise la forme des pièces du mode de jeu 1
 ------------------------------------------------------------------------------------*)

Function formePioche1(jeu1 :jeu):jeu;
var
   i,j,k : integer;
begin
   setlength(jeu1.pioche, taillePioche1);
   for i:=0 to borneForm1 -1 do
   begin
      jeu1.pioche[i].forme:='et';
   end;
   for j:=borneForm1 to 2*borneForm1 -1 do
   begin
      jeu1.pioche[j].forme:='car';
   end;
   for k:=2*borneForm1 to high(jeu1.pioche) do
   begin
      jeu1.pioche[k].forme:='tri';
   end;
   formePioche1:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : couleur1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet d'initialiser la couleur des pièces dans le mode de jeu 1
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : initialise la couleur des pièces du mode de jeu 1
 ------------------------------------------------------------------------------------*)

Function couleurPioche1(jeu1:jeu):jeu;
var
   i: integer;
begin
   for i:=0 to high(jeu1.pioche) do
   begin
      if (i MOD borneCoul1 =0) or (i MOD borneCoul1 =1) then
      begin
	 jeu1.pioche[i].couleur:='rouge';
      end;
      if (i MOD borneCoul1 =2) or (i MOD borneCoul1 =3) then
      begin
	 jeu1.pioche[i].couleur:='bleu';
      end;
      if (i MOD borneCoul1 =4) or (i MOD borneCoul1 =5) then
      begin
	 jeu1.pioche[i].couleur:='vert';
      end;
   end;
   couleurPioche1:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : init_grille1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : initialise le plateau de jeu pour le mode 1
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : renvoie le jeu du mode 1 initialisé
 ------------------------------------------------------------------------------------*)
Function init_grille1(jeu1 : jeu) : jeu;
Var
   i,j : integer;
Begin
   setlength(jeu1.plateau,Tplateau1,Tplateau1);
   for i:=low(jeu1.plateau) to high(jeu1.plateau) do
   begin
      for j:=low(jeu1.plateau) to high(jeu1.plateau) do
      begin
	 jeu1.plateau[i,j].forme:= VIDE;
	 jeu1.plateau[i,j].couleur:=VIDE;
      end;
   end;
   init_grille1 := jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : MainsVides1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : initialise la main à VIDE
 -- Pré conditions    : jeu1 : jeu ; nbrjou : integer
 -- Post conditions   : renvoie le jeu avec les mains initiales à VIDE
 ------------------------------------------------------------------------------------*)

Function MainsVides1(jeu1 : jeu):jeu;
var
   i,j : integer;
begin
   For j:=0 to high(jeu1.tabJoueurs) do
   begin
      setlength(jeu1.tabJoueurs[j].main, 6);
   end;
   For i:=0 to high(jeu1.tabJoueurs) do
   begin
      For j:=0 to high(jeu1.tabJoueurs[i].main) do
      begin
	 jeu1.tabJoueurs[i].main[j].forme:=VIDE;
	 jeu1.tabJoueurs[i].main[j].couleur:=VIDE;
       end;
   end;
   MainsVides1:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : piocher
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet au joueur de piocher une pièce
 -- Pré conditions    : jeu1 : jeu ; pieceManquante,numero,posiPiece : integer
 -- Post conditions   : renvoie le jeu avec la pièce piochée dans la main du joueur et la case de la pioche avec la valeur de la case piochée égale à la constante VIDE
 ------------------------------------------------------------------------------------*)

Function piocher(jeu1 : jeu; pieceManquante,numero, posiPiece:integer):jeu;
begin
   jeu1.tabJoueurs[numero].main[pieceManquante]:=jeu1.pioche[posiPiece];;
   jeu1.pioche[posiPiece].couleur:=VIDE;
   jeu1.pioche[posiPiece].forme:=VIDE;
   piocher:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : nvlPioche
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de créer une nouvelle pioche
 -- Pré conditions    : jeu1 : jeu ; nvlTaille : Integer
 -- Post conditions   : renvoie le jeu avec la nouvelle pioche créée suite à la pioche d'une carte par un joueur
 ------------------------------------------------------------------------------------*)

Function nvlPioche(jeu1	: jeu):jeu;
var
   t   :  pioch;
   i,j : integer;
begin
   i:=0;
   j:=0;
   setlength(t,high(jeu1.pioche));
   While i<=high(t) do
   begin
      if (jeu1.pioche[j].couleur<>VIDE) then
      begin
	 t[i]:=jeu1.pioche[j];
	 i:=i+1;
      end;
      j:=j+1;
   end;
   setlength(jeu1.pioche,0);
   jeu1.pioche:=t;
   nvlPioche:=jeu1;
end;



(*
 ------------------------------------------------------------------------------------
 -- Fonction          : initialisationMain1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : initialise la main
 -- Pré conditions    : jeu1 : jeu ; nbrjou : integer
 -- Post conditions   : renvoie le jeu avec les mains initiales
 ------------------------------------------------------------------------------------*)

Function initialisationMain1(jeu1 : jeu):jeu;
var
   i,j,k : integer;
begin
   For i:=0 to high(jeu1.tabJoueurs) do
   begin
      For j:=0 to high(jeu1.tabJoueurs[i].main) do
      begin
	 k:=random(high(jeu1.pioche));
	 jeu1:=piocher(jeu1,j,i,k);
	 jeu1:=nvlPioche(jeu1);
      end;
   end;
   initialisationMain1:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : initialisationComplete1
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : initialise le jeu dans le mode de jeu 1
 -- Pré conditions    : jeu1 : jeu ; nbrjou : integer
 -- Post conditions   : renvoie le jeu initialisé entièrement dans le mode de jeu 1
 ------------------------------------------------------------------------------------*)

Function initialisationComplete1(jeu1 : jeu):jeu;
begin
   jeu1.tailleMain:=6;
   jeu1:=formePioche1(jeu1);
   jeu1:=couleurPioche1(jeu1);
   jeu1:=init_grille1(jeu1);
   jeu1:=MainsVides1(jeu1);
   jeu1:=initialisationMain1(jeu1);
   initialisationComplete1:=jeu1;
end;
end.
