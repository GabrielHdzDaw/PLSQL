-- 11/03/2025
-- Gabriel Hernández Collado
-- A partir de les dades de la taula de ciutats, crea un script que diga 
-- "No tenim cap país que continga la paraula Unido","Tenim un país amb la paraula Unido",
--  "Tenim dos països amb la paraula Unido" o "Tenim més de 2 països amb la paraula Unido", 
--  segons corresponga, emprant CASE.
DECLARE
    v_quantitat NUMBER(4);
BEGIN
    SELECT COUNT(*) 
    INTO v_quantitat
    FROM paises 
    WHERE LOWER(nombre) LIKE '%unido%';

    CASE v_quantitat
        WHEN 0 THEN
            bdms_output.put_line('No tenim cap país que continga la paraula unido');
        WHEN 1 THEN
            bdms_output.put_line('Tenim un país amb la paraula Unido');
        WHEN 2 THEN
            bdms_output.put_line('Tenim dos països amb la paraula Unido');
        ELSE
            bdms_output.put_line('Tenim més de 2 països amb la paraula Unido');
    END CASE;
END;