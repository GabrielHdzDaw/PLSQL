-- Autor: Gabriel Hernández Collado
-- Fecha 17/5/2025
--Descripción: Crea una funció que retorne la suma de les poblacions de les ciutats que pertanyen al país 
-- el nom del qual es passa com a paràmetre, o -1 si el país no existeix.

CREATE OR REPLACE FUNCTION SumaDePoblacionsDePais(
    pais IN VARCHAR2
) RETURN NUMBER AS
    suma NUMBER := 0;
BEGIN
    SELECT SUM(c.poblacion)
    INTO suma
    FROM ciudades c JOIN paises p
    ON c.codigoPais = p.codigo
    WHERE p.nombre = pais;
    IF suma = 0 THEN
        RETURN -1;
    ELSE
        RETURN suma;
    END IF;
END SumaDePoblacionsDePais;

EXECUTE dbms_output.put_line(SUMADEPOBLACIONSDEPAIS('China'));

