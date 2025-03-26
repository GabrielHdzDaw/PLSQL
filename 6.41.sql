-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025

-- 6.- Crea una funció "QuantitatDeRebuts2", que reba com a paràmetre el 
-- codi d'un veí, el número d'un mes i l'any, i retorne el text "Un 
-- rebut", "Cap rebut" o "Més d'un rebut", segons corresponga a partir de 
-- la quantitat de rebuts que aqueix veí té en aqueix mes i aqueix any. 
-- Esta versió ha d'usar CASE en format d'expressió. Prova-la amb una 
-- sentència SELECT.

CREATE OR REPLACE FUNCTION quantitatRebuts2 (
    v_codiVei NUMBER,
    v_mes NUMBER,
    v_any NUMBER
) RETURN VARCHAR2 AS
        v_quantitat NUMBER(10) := 0;
        resposta VARCHAR2(15);
        
BEGIN
    SELECT COUNT(codiVei) AS quantitatRebuts
        INTO v_quantitat
        FROM rebuts
        WHERE codiVei = v_codiVei AND numMes = v_mes AND numAny = v_any;
    resposta := CASE v_quantitat
        WHEN 0 THEN 'Cap rebut'
        WHEN 1 THEN 'Un rebut'
        ELSE 'Més d''un rebut'
        END;
    RETURN resposta;
END quantitatRebuts2;

SELECT quantitatRebuts2(1, 5, 2024) FROM dual;