-- 10/03/2025
-- Gabriel Hernández Collado
-- Basant-te en el primer exemple, fes un fragment de codi
-- que obtinga la població mitjana de les ciutats de la nostra base de dades, 
-- la guarde en una variable "poblacioMitjana" i després la mostre en la finestra d'eixida.

DECLARE
    poblacioMitjana NUMBER(10, 3);

BEGIN
    SELECT AVG(poblacion)
    INTO poblacioMitjana
    FROM ciudades;
    dbms_output.put_line('Media: ' || poblacioMitjana);
END;