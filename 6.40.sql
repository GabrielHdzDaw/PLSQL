-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025

-- 5.- Crea una funció "QuantitatDeRebuts", que reba com a paràmetre el 
-- codi d'un veí, el número d'un mes i l'any, i retorne el text "Un 
-- rebut", "Cap rebut" o "Més d'un rebut", segons corresponga a partir de 
-- la quantitat de rebuts que aqueix veí té en aqueix mes i aqueix any. No 
-- ha d'usar IF (ni CASE) sinó control d'excepcions. Prova-la des d'un 
-- bloc anònim.

CREATE OR REPLACE FUNCTION quantitatRebuts (
    v_codiVei NUMBER,
    v_mes NUMBER,
    v_any NUMBER
) RETURN VARCHAR2 AS
        v_quantitat NUMBER(10) := 0;
        
BEGIN
    SELECT COUNT(codiVei) AS quantitatRebuts
        INTO v_quantitat
        FROM rebuts
        WHERE codiVei = v_codiVei AND numMes = v_mes AND numAny = v_any;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Cap rebut';
        WHEN TOO_MANY_ROWS THEN
            RETURN 'Més d''un rebut';
        WHEN OTHERS THEN
            RETURN 'Un rebut';
END quantitatRebuts;

BEGIN
    dbms_output.put_line(quantitatRebuts(1, 3, 2024));
END;