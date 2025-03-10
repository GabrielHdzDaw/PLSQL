-- 10/03/2025
-- Gabriel Hernández Collado
-- Fes un fragment de codi que obtinga el nom i la població de la ciutat menys poblada de la nostra base de dades, emprant %ROWTYPE.


DECLARE
    ciudadMinima ciudades % ROWTYPE;

BEGIN
    SELECT * INTO ciudadMinima
    FROM ciudades
    ORDER BY poblacion 
    FETCH NEXT 1 ROWS ONLY;
    
    dbms_output.put_line('Mínima: ' || ciudadMinima.nombre);
    dbms_output.put_line('Población: ' || ciudadMinima.poblacion);
END;