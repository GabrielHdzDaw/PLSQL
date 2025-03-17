-- Autor: Gabriel Hernández Collado
-- Fecha 17/ 5 / 2025
-- Descripción: Crear un procedimiento que escriba 5 veces la palabra "Hola"

CREATE OR REPLACE PROCEDURE EscriureHola(numero IN NUMBER) IS
BEGIN
    FOR i IN 1..numero LOOP
        dbms_output.put_line('Hola');
    END LOOP;
END Escriurehola;

-- Llamada al procedimiento
EXECUTE EscriureHola(10);


-- Otras formas de llamar al procedimiento
BEGIN
    ESCRIUREHOLA(5);
END;

DECLARE
    quantitat NUMBER;
BEGIN
    quantitat := 5;
    ESCRIUREHOLA(quantitat);
END;