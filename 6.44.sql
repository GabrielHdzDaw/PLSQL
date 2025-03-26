-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025
--9.- Crea un procediment "IntroduirDiversosRebuts", que reba com a 
--paràmetres el codi de veí, any, import i concepte, i que inserirà dades 
--des del mes 1 fins al mes 12 d'eixe any, amb eixe import, eixe 
--concepte, amb número de rebut 1 i sense data de pagament.

CREATE OR REPLACE PROCEDURE IntroduirDiversosRebuts(
    v_codiVei NUMBER,
    v_any NUMBER,
    v_import NUMBER,
    v_concepte VARCHAR2
) IS
BEGIN
    FOR i IN 1..12 LOOP
        INSERT INTO rebuts VALUES(i, v_any, v_codiVei, 1, v_concepte, v_import, NULL);    
    END LOOP;
END;

EXECUTE IntroduirDiversosRebuts();