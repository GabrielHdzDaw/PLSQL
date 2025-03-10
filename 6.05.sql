-- 10/03/2025
-- Gabriel Hernández Collado
-- Obtingues el nom de la ciutat amb codi 7. Després, guarda en una 
-- variable addicional el seu equivalent en majúscules i mostra'l en pantalla.

DECLARE
    ciutat ciudades.nombre % TYPE;
BEGIN
    SELECT nombre INTO ciutat
    FROM ciudades 
    WHERE codigo = 7;
    dbms_output.put_line(ciutat);
    ciutat := UPPER(ciutat);
    dbms_output.put_line(ciutat);
END;