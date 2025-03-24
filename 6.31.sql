-- Autor: Gabriel Hernández Collado
-- Fecha 24/3/2025
-- Descripción:   Crea un script PL/SQL similar a l'anterior (nom de cada país i quantitat de ciutats o, si
--  és zero, la paraula "Cap"), però en aquesta ocasió hauràs d'utilitzar un bucle FOR. 
DECLARE 
    v_nomPais paises.nombre%TYPE;
    v_codiPais ciudades.codigoPais%TYPE;
    v_quantitat NUMBER;
    CURSOR cursorPais IS
        SELECT nombre, codigo FROM paises
        ORDER BY nombre;
BEGIN
    FOR p IN cursorPais LOOP
        SELECT COUNT(*) AS quantitat
        INTO v_quantitat
        FROM ciudades
        WHERE codigoPais = p.codigo;
        IF v_quantitat = 0 THEN
            dbms_output.put_line(p.nombre || ': cap');
        ELSE
            dbms_output.put_line(p.nombre || ': ' || v_quantitat);
        END IF;
    END LOOP;
END;