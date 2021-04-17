Unit Ufonctionsannexes;

interface

function max3(a,b,c : integer):integer;
function max2(a,b : integer):integer;

implementation

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : max3
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de déterminer le maximum entre trois valeurs
 -- Pré conditions    : a,b,c : integer
 -- Post conditions   : renvoie le maximum de trois nombres
 ------------------------------------------------------------------------------------*)

function max3(a,b,c : integer):integer;
var
   res : integer;
begin
   if (a>=b) then
   begin
      res:=a;
   end
   else
   begin
      res:=b;
   end;
   if (res<=c) then
   begin
      res:=c
   end;
   max3:=res;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : max2
 -- Auteur            : Bara Dioukhane - Lisa Barlet -  Valentin Labat
 --
 -- But               : permet de déterminer le maximum entre deux valeurs
 -- Pré conditions    : a,b : integer
 -- Post conditions   : renvoie le maximum de deux nombres
 ------------------------------------------------------------------------------------*)

function max2(a,b : integer):integer;
var
   res : integer;
begin
   if (a>=b) then
   begin
      res:=a;
   end
   else
   begin
      res:=b;
   end;
   max2:=res;
end;
end.
