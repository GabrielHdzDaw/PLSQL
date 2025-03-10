-- 10/03/2025
-- Gabriel Hernández Collado
-- Fes un fragment de codi que obtinga 
-- la menor població de les ciutats de la nostra base de dades, la guarde en una
--  variable "poblacioMinima" i després la mostre en la finestra d'eixida, emprant %TYPE

DECLARE
    poblacioMinima ciudades.poblacion % TYPE;

BEGIN
    SELECT MIN(poblacion)
    INTO poblacioMinima
    FROM ciudades;
    dbms_output.put_line('Mínima: ' || poblacioMinima);

END;