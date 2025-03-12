-- 11/03/2025
-- Gabriel Hernández Collado
-- A partir de les dades de la taula de ciutats, crea un script que diga "No tenim país que continga la paraula Unido", "Tenim un país amb la paraula Unido" 
-- "Tenim dos països amb la paraula Unido" o "Tenim més de dos països amb la paraula Unido" segons la quantitat de països que tenim amb la paraula Unido al seu nom.
DECLARE
    v_quantitat NUMBER(4);
BEGIN
    SELECT COUNT(*) 
    INTO v_quantitat
    FROM paises 
    WHERE LOWER(nombre) LIKE '%unido%';

    CASE v_quantitat
        WHEN 0 THEN
            bdms_output.put_line('0');
        WHEN 1 THEN
            bdms_output.put_line('1');
        WHEN 2 THEN
            bdms_output.put_line('2');
        ELSE
            bdms_output.put_line('>2');
    END CASE;
END;