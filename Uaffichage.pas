unit Uaffichage;

interface

uses Crt, Uinitialisation;

Procedure afficheForme1(p1 : pieces);
Procedure affichePiece1(p1 : pieces);



implementation

(*
 ------------------------------------------------------------------------------------
 -- Procedure         : afficheForme1
 -- Auteur            : Bara Dioukhane - Lisa Barlet - Valentin Labat
 --
 -- But               : affiche la forme du mode 1
 -- Pré conditions    : p1 : pieces
 -- Post conditions   : affiche la forme du mode 1
 ------------------------------------------------------------------------------------*)

Procedure afficheForme1(p1 : pieces);
begin
   If p1.forme = 'et' then
   begin
      write(' * ');
   end
   else
   begin
      If p1.forme = 'car' then
      begin
	 write(' @ ');
      end
      else
      begin
	 If p1.forme = 'tri' then
	 begin
	    write(' # ');
	 end;
      end;
   end;
end;

(*
 ------------------------------------------------------------------------------------
 -- Procedure         : affichePiece1
 -- Auteur            : Bara Dioukhane - Lisa Barlet - Valentin Labat
 --
 -- But               : affiche une piece du mode 1
 -- Pré conditions    : p1 : pieces
 -- Post conditions   : affiche une piece du mode 1
 ------------------------------------------------------------------------------------*)

Procedure affichePiece1(p1 : pieces);
begin
   If  p1.couleur = 'vert' then
   begin
      TextColor(10);
      afficheForme1(p1);
   end
   else
   begin
      If  p1.couleur = 'rouge' then
      begin
	 TextColor(4);
	 afficheForme1(p1);
      end
      else
      begin
	 If p1.couleur = 'bleu' then
	 begin
	    TextColor(1);
	    afficheForme1(p1);
	 end;
      end;
   end;
   TextColor(15);
end;
end.
