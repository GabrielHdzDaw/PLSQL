-- 11/03/2025
-- Gabriel Hernández Collado
-- Crea un script que guarde en una variable la quantitat de ciutats que tenim de Estats Units. Si la quantitat 
-- és major que 0, mostrarà per pantalla "Tenim ciutats dels Estats Units", si no, mostrarà "No tenim ciutats dels Estats Units".

DECLARE
    v_quantitatCiutats NUMBER(9);
BEGIN
    SELECT COUNT(*)
    INTO v_quantitatCiutats
    FROM ciudades
    WHERE codigoPais = 'US';

    IF v_quantitatCiutats > 0 THEN
        dbms_output.put_line('Tenim ciutats dels Estats Units');
    ELSE
        dbms_output.put_line('No tenim ciutats dels Estats Units');
    END IF;
END;