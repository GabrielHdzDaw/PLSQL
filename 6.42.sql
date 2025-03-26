-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025
-- 7.- Crea un procediment "MostrarRebuts", que reba com a paràmetres un 
-- codi de veí inicial (per exemple, el 2) i un codi de veí final (per 
-- exemple, el 4) i que, per a tots els veïns els codis dels quals estan 
-- entre aqueixos dos (inclusivament), mostre els seus rebuts: nom del 
-- veí, concepte i import, juntament amb el text "Pagat" o "No pagat", 
-- segons corresponga, ordenats per any i mes.

CREATE OR REPLACE PROCEDURE MostrarRebuts(
    v_codiVeiInicial NUMBER,
    v_codiVeiFinal NUMBER
) IS
    v_nom veins.nom % TYPE := '';
    v_concepte rebuts.concepte % TYPE := '';
    v_import rebuts.import % TYPE := 0;
    v_dataPagament rebuts.dataPagament % TYPE;
    v_pagat VARCHAR2(8);
BEGIN
    FOR vei IN (
        SELECT v.nom, r.concepte, r.import, r.dataPagament
        INTO v_nom, v_concepte, v_import, v_dataPagament
        FROM veins v JOIN rebuts r
        ON v.codi = r.codiVei
        WHERE v.codi BETWEEN v_codiVeiInicial AND v_codiVeiFinal
        ORDER BY r.numAny
    ) LOOP
        IF v_dataPagament IS NULL THEN
            v_pagat := 'No pagat';
        ELSE
            v_pagat := 'Pagat';
        END IF;
        dbms_output.put_line('Nom: ' || v_nom || 'Concepte: ' || v_concepte || 'Import: ' || v_import || 'Estat: ' || CASE v_dataPagament WHEN IS NULL THEN 'No pagat' ELSE 'Pagat' END);
    END LOOP;
END MostrarRebuts;
    
EXECUTE MostrarRebuts();