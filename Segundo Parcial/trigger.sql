--Trigger que no permita matricular a un estudiante que no este en la edad de entre 3 y 4 años. 

CREATE OR REPLACE FUNCTION matricular() returns Trigger
AS 
$$
Begin
if (new.nino_edad)<> 3 and (new.nino_edad)<> 4 then
raise warning 'El niño tiene que estar en la edad de 3 y 4 años';
return null;
else
return new;
end if;



END
$$

Language plpgsql

create trigger matricula before insert on nino
for each row execute procedure matricular();