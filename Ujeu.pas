unit Ujeu;

interface

Uses Ufonctionsannexes, Uinitialisation, Uaffichage;



function comptFormIden(jeu1 : jeu;numero:integer):integer;
function comptCouIden(jeu1 : jeu;numero:integer):integer;
function maxIden(jeu1 : jeu;numero:integer):integer;
function nbrJoueursCommence(jeu1 : jeu; nbrJou:Integer):jeu;
function quiCommence(jeu1 : jeu):integer;
Function jeuJoueur(jeu1	: jeu):jeu;
Function Tour(jeu1 : jeu; numero:integer):jeu;

implementation


(*
 ------------------------------------------------------------------------------------
 -- Fonction          : comptFormIden
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de compter le nombre de pièces identiques dans la main d'un joueur
 -- Pré conditions    : jeu1 : jeu ; numero : integer
 -- Post conditions   : renvoie le nombre de formes identiques dans la main d'un joueur
 ------------------------------------------------------------------------------------*)

function comptFormIden(jeu1 : jeu;numero:integer):integer;
var
   formIden,formIden2,formIden3,i	: integer;
begin
   formIden:=0;
   formIden2:=0;
   formIden3:=0;
   For i:=0 to jeu1.tailleMain -1 do
   begin
      if jeu1.tabJoueurs[numero].main[i].forme='et' then
      begin
	 formIden:=formIden +1;
      end
      else
      begin
	 if jeu1.tabJoueurs[numero].main[i].forme='car' then
	 begin
	    formIden2:=formIden2 +1;
	 end
         else
         begin
	    if jeu1.tabJoueurs[numero].main[i].forme='tri' then
	    begin
	       formIden3:=formIden3 +1;
	    end;
	 end;
      end;
   end;
   comptFormIden:=max3(formIden,formIden2,formIden3);
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : comptCouIden
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de compter le nombre de couleurs identiques dans la main d'un joueur
 -- Pré conditions    : jeu1 : jeu ; numero : integer
 -- Post conditions   : renvoie le nombre de couleurs identiques dans la main d'un joueur
 ------------------------------------------------------------------------------------*)

function comptCouIden(jeu1 : jeu;numero:integer):integer;
var
   couIden,couIden2,couIden3,i : integer;
begin
   couIden:=0;
   couIden2:=0;
   couIden3:=0;
   For i:=0 to jeu1.tailleMain -1 do
   begin
      if jeu1.tabJoueurs[numero].main[i].couleur='rou' then
      begin
	 couIden:=couIden+1;
      end
      else
      begin
	 if jeu1.tabJoueurs[numero].main[i].couleur='bleu' then
	 begin
	    couIden2:=couIden2+1;
	 end
         else
         begin
	    if jeu1.tabJoueurs[numero].main[i].couleur='vert' then
	    begin
	       couIden3:=couIden3+1;
	    end;
	 end;
      end;
   end;
   comptCouIden:=max3(couIden,couIden2,couIden3);
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : maxIden
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de compter le nombre de pièces comportant un attribut commun
 -- Pré conditions    : jeu1 : jeu ; numero : integer
 -- Post conditions   : renvoie le nombre de pièces comportant un attribut commun dans la main d'un joueur
 ------------------------------------------------------------------------------------*)

function maxIden(jeu1 : jeu;numero:integer):integer;
var
   couIden,forIden : integer;
begin
   couIden:=comptCouIden(jeu1,numero);
   forIden:=comptFormIden(jeu1,numero);
   maxIden:=max2(couIden,forIden);
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : nbrJoueursCommence
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de compter le nombre de joueurs qui pourraient commencer
 -- Pré conditions    : jeu1 : jeu ; nbrJou : integer
 -- Post conditions   : renvoie le nombre de joueurs qui pourraient commencer suite à leur nombre de pièces comportant un attribut commun le plus élevé
 ------------------------------------------------------------------------------------*)

function nbrJoueursCommence(jeu1 : jeu; nbrJou:Integer):jeu;
var
   i,max,j,k,l,m : integer;
   t       : tabPiecIden;
begin
   setlength(t,nbrJou);
   For i:=0 to high(t) do
   begin
      t[i]:=maxIden(jeu1,i);
   end;
   max:=t[0];
   For j:=1 to high(t) do
   begin
      if t[j]>max then
      begin
	 max:=t[j];
      end;
   end;
   for k:=0 to high(t) do
   begin
      if t[k]=max then
      begin
	 jeu1.joueursCommence.nbrJouCommence:=jeu1.joueursCommence.nbrJouCommence +1;
      end;
   end;
   setlength(jeu1.joueursCommence.position,jeu1.joueursCommence.nbrJouCommence);
   m:=0;
   for l:=0 to high(t) do
   begin
      if t[l]=max then
      begin
	 jeu1.joueursCommence.position[m]:=l;
	 m:=m+1;
      end;
   end;
   nbrJoueursCommence:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : quiCommence
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de déterminer le joueur qui commence
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : renvoie le numéro du joueur qui commence
 ------------------------------------------------------------------------------------*)

function quiCommence(jeu1 : jeu):integer;
var
   ageCommence, numJouCommence,i : integer;
begin
   jeu1:=nbrJoueursCommence(jeu1, high(jeu1.tabJoueurs) +1);
   ageCommence:=-1;
   numJouCommence:=-1;
   if jeu1.joueursCommence.nbrJouCommence=1 then
   begin
      numJouCommence:=jeu1.joueursCommence.position[0];
   end
   else
   begin
      For i:=0 to high(jeu1.tabJoueurs) do
      begin
	 if jeu1.tabJoueurs[jeu1.joueursCommence.position[i]].age > ageCommence then
	 begin
	    numJouCommence:=jeu1.joueursCommence.position[i];
	 end;
      end;
   end;
   quiCommence:=numJouCommence;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : poser
 -- Auteur            : Bara Dioukhane - Lisa Barlet - Valentin Labat
 --
 -- But               : permet de poser une piece sur le plateau à la position désirée
 -- Pré conditions    : jeu1 : jeu ; numero,a,b,posipiece : integer
 -- Post conditions   : renvoie le plateau avec la nouvelle pièce ajoutée
 ------------------------------------------------------------------------------------*)

function poserVide(jeu1	: jeu;a,b:integer; p1 : pieces):jeu;
begin
   if ( jeu1.plateau[a,b].forme = VIDE ) and (jeu1.plateau[a-1,b-1].forme = VIDE) and (jeu1.plateau[a-1,b].forme = VIDE ) and (jeu1.plateau[a-1,b+1].forme = VIDE) and (jeu1.plateau[a,b-1].forme = VIDE) and (jeu1.plateau[a,b+1].forme = VIDE) and (jeu1.plateau[a+1,b-1].forme = VIDE) and (jeu1.plateau[a+1,b].forme = VIDE) and (jeu1.plateau[a+1,b+1].forme = VIDE ) then
   begin
      jeu1.plateau[a,b] := p1;
   end;
   poserVide :=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : piochePrinc
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet d'effectuer l'action de piocher complète
 -- Pré conditions    : jeu1 : jeu ; numero :  integer
 -- Post conditions   : renvoie le jeu avec la pièce piochée dans le jeu du joueur et la pioche sans la pièce piochée, en utilisant les fonctions piocher() et nvlPioche()
 ------------------------------------------------------------------------------------*)

Function piochePrinc(jeu1 : jeu;numero:integer):jeu;
var
   j,i: integer;
begin
   j:=0;
   i:=random(high(jeu1.pioche));
   While (jeu1.tabJoueurs[numero].main[j].forme<>VIDE) and (j<=high(jeu1.tabJoueurs[numero].main)) do
   begin
      j:=j+1;
   end;
   if j<=5 then
   begin
      jeu1:=piocher(jeu1,j,numero,i);
      jeu1:=nvlPioche(jeu1);
   end;
   piochePrinc:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : jeuJoueur
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet d'effectuer le premier tour du jeu
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : renvoie le jeu avec le premier coup joué
 ------------------------------------------------------------------------------------*)

Function jeuJoueur(jeu1	: jeu):jeu;
var
   CHOIX	     : string;
   numJoueurCommence,i, nbrPiec, numPiec, posiHor, posiVer : integer;
begin
   numJoueurCommence:=quiCommence(jeu1);
   writeln();
   writeln('C''est ', jeu1.tabJoueurs[numJoueurCommence].nom, ' commence.');
   Repeat
   begin
      writeln();
      writeln('Appuyez sur ''y'' lorsque vous êtes prêts à jouer');
      readln(CHOIX);
   end;
   until CHOIX = 'y';
   writeln();
   writeln('Voici votre main :');
   For i:=0 to high(jeu1.tabJoueurs[numJoueurCommence].main) do
   begin
      affichePiece1(jeu1.tabJoueurs[numJoueurCommence].main[i]);      
   end;
   writeln();
   writeln('Entrez le nombre de pièces que vous souhaitez poser');
   readln(nbrPiec);
   setlength(jeu1.tabchoix, nbrPiec);
   For i:=0 to high(jeu1.tabchoix) do
   begin
      writeln('Quel est le numéro de la piece que vous voulez poser ?');
      readln(numPiec);
      While (numPiec<1) and (numPiec>high(jeu1.tabJoueurs[numJoueurCommence].main) +1) do
      begin
	 writeln('Le nombre entré n''est pas correct.');
	 writeln('RAPPEL : Il doit être compris entre 1 et ', high(jeu1.tabJoueurs[numJoueurCommence].main)+1);
	 writeln('Entrez une nouvelle fois le numéro de la pièce que vous voulez poser');
	 readln(numPiec);
      end;
      writeln();
      Repeat
      begin
	 writeln('Entrez maintenant sa position horizontale');
	 readln(posiHor);
	 writeln('Entrez maintenant sa position verticale');
	 readln(posiVer);
      end;
      until (posiHor<=high(jeu1.plateau)+1) and(posiHor>0) and (posiVer<=high(jeu1.plateau)+1) and(posiVer>0);
      jeu1:=poserVide(jeu1,posiHor,posiVer,jeu1.tabJoueurs[numJoueurCommence].main[numPiec]);
   end;
   jeu1:=piochePrinc(jeu1, numJoueurCommence);
   jeuJoueur:=jeu1;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : Tour
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet d'effectuer les tours du jeu
 -- Pré conditions    : jeu1 : jeu
 -- Post conditions   : renvoie le jeu avec les tours
 ------------------------------------------------------------------------------------*)

Function Tour(jeu1 : jeu; numero:integer):jeu;
var
   CHOIX	    : string;
   nbrPiec, numPiec,i, posiVer, posiHor,j : integer;
begin
    writeln();
   writeln('C''est ', jeu1.tabJoueurs[numero].nom, ' commence.');
   Repeat
   begin
      writeln();
      writeln('Appuyez sur ''y'' lorsque vous êtes prêts à jouer');
      readln(CHOIX);
   end;
   until CHOIX = 'y';
   writeln();
   writeln('Voici votre main :');
   For i:=0 to high(jeu1.tabJoueurs[numero].main) do
   begin
      affichePiece1(jeu1.tabJoueurs[numero].main[i]);      
   end;
   writeln();
   writeln('Entrez le nombre de pièces que vous souhaitez poser');
   readln(nbrPiec);
   setlength(jeu1.tabchoix, nbrPiec);
   For i:=0 to high(jeu1.tabchoix) do
   begin
      writeln('Quel est le numéro de la piece que vous voulez poser ?');
      readln(numPiec);
      While (numPiec<1) and (numPiec>high(jeu1.tabJoueurs[numero].main) +1) do
      begin
	 writeln('Le nombre entré n''est pas correct.');
	 writeln('RAPPEL : Il doit être compris entre 1 et ', high(jeu1.tabJoueurs[numero].main)+1);
	 writeln('Entrez une nouvelle fois le numéro de la pièce que vous voulez poser');
	 readln(numPiec);
      end;
      writeln();
      Repeat
      begin
	 writeln('Entrez maintenant sa position horizontale');
	 readln(posiHor);
	 writeln('Entrez maintenant sa position verticale');
	 readln(posiVer);
      end;
      until (posiHor<=high(jeu1.plateau)+1) and(posiHor>0) and (posiVer<=high(jeu1.plateau)+1) and(posiVer>0);
      jeu1:=poserVide(jeu1,posiHor,posiVer,jeu1.tabJoueurs[numero].main[numPiec]);
   end;
   jeu1:=piochePrinc(jeu1, numero);
   For i:=0 to high(jeu1.plateau) do
   begin
      For j:=0 to high(jeu1.plateau) do
      begin
	 affichePiece1(jeu1.plateau[i,j]);
      end;
      writeln();
   end;
   Tour:=jeu1;
end;
end.
