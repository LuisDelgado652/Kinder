do $$
declare

        tabla record;
        Numero_Ninos cursor for select 
			count(distinct nino_inscrito.nino_ci) as Cantidad_Niños
			from nino_inscrito 
			where nino_inscrito.nino_inscrito_fecha >= '01/01/2020' and nino_inscrito.nino_inscrito_fecha <='31/12/2020' ;
begin
open Numero_Ninos;
fetch Numero_Ninos into tabla;
while(found) loop
Raise notice 'Numero de niños en el periodo 2020: %', tabla.Cantidad_Niños;
fetch Numero_Ninos into tabla;
end loop;
end $$
language 'plpgsql';