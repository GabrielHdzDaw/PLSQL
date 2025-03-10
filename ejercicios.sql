--Població mitjana de les ciutats en una variable poblacioMitjana y després mostrar-la per pantalla.

-- DECLARE
--     poblacioMitjana NUMBER(10, 3);

-- BEGIN
--     SELECT AVG(poblacion)
--     INTO poblacioMitjana
--     FROM ciudades;
--     dbms_output.put_line('Media: ' || poblacioMitjana);
-- END;

DECLARE
    poblacioMitjana ciudades.poblacion % TYPE;

BEGIN
    SELECT AVG(poblacion)
    INTO poblacioMitjana
    FROM ciudades;
    dbms_output.put_line('Media: ' || poblacioMitjana);

END;


--Població mínima utilitzant ROWTYPE - Metemos todos los datos en una variable de tipo ROWTYPE

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

--Obtingues el nom de la ciutat amb codi 7. Després, guarda en una variabla ddicional el seu equivalent en majúscules i mostra'l en pantalla

