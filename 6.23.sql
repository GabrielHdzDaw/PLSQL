-- Autor: Gabriel Hernández Collado
-- Fecha 17/ 5 / 2025
-- Descripción:  Crea un procediment "EscriureGuions2", millorat, que escriga diversos 
-- guions en l'eixida de la base de dades, tants com s'indiquen en un paràmetre numèric (d'entrada). Si s'indica un número superior a 100, només escriurà 100.

CREATE OR REPLACE PROCEDURE EscriureGuions(
    numero IN NUMBER
) IS
    guions VARCHAR2(100) := '';
    numero_max NUMBER := 100;
    nou_numero NUMBER := numero;
BEGIN
    if numero > numero_max THEN
        nou_numero := 100;
    END IF;
    
    FOR i IN 1..nou_numero LOOP
        guions := guions || '-';
    END LOOP;
    dbms_output.put_line(guions);
END EscriureGuions;