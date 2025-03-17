-- Autor: Gabriel Hernández Collado
-- Fecha 17/ 5 / 2025
-- Descripción: Crear un procedimiento "EscriureGuions" que escriga diversos guions en l'eixida de la base de dades, en la mateixa línia, tants com s'indiquen en un parametre numeric.

CREATE OR REPLACE PROCEDURE EscriureGuions(
    numero IN NUMBER
) IS
    guions VARCHAR2(100) := '';
BEGIN
    
    FOR i IN 1..numero LOOP
        guions := guions || '-';
    END LOOP;
    dbms_output.put_line(guions);
END EscriureGuions;