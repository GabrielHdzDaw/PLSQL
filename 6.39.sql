-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025

-- 3.- Crea una funció "ImportImpagaments" que, rebent com a paràmetre el 
-- codi d'un veí, retorne l'import total dels seus rebuts impagats (data 
-- de pagament NULL). En comptes d'emprar la funció "SUM" de SQL, hauràs 
-- de recórrer els registres amb un bucle LOOP. Prova la funció amb 
-- EXECUTE.

CREATE OR REPLACE FUNCTION ImportImpagaments (
    codiVei NUMBER
) RETURN NUMBER AS
    v_importTotal rebuts.import % TYPE := 0;
    v_import rebuts.import % TYPE := 0;
    CURSOR cursorRebuts IS
        SELECT import 
        FROM rebuts
        WHERE dataPagament IS NULL AND rebuts.codiVei = codiVei;
BEGIN
    OPEN cursorRebuts;
    LOOP
        FETCH cursorRebuts INTO v_import;
        EXIT WHEN cursorRebuts%NOTFOUND;
        v_importTotal := v_importTotal +  v_import;
    END LOOP;
    CLOSE cursorRebuts;
    RETURN v_importTotal;
END ImportImpagaments;

EXECUTE dbms_output.put_line(IMPORTIMPAGAMENTS(1));

SELECT ImportImpagaments(1) FROM dual;