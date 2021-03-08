CREATE OR REPLACE FUNCTION actividades_programa(
actividad char) 
returns table(actividad_programa char)
AS $BODY$
BEGIN
return query
select
actividad_programa.actividad_programa_descripcion
from programa
inner join public.actividad_programa on programa.programa_id=actividad_programa.programa_id
where programa.programa_descripcion = actividad;
END;
$BODY$ LANGUAGE plpgsql;

select * from actividades_programa('Motriz');