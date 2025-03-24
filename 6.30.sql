-- Autor: Gabriel Hernández Collado
-- Fecha 24/3/2025
-- Descripción:   Crea un script PL/SQL similar a l'anterior (nom de cada país i quantitat 
-- de ciutats o, si és zero, la paraula "Cap"), però en aquesta ocasió hauràs d'utilitzar un 
-- bucle LOOP, juntament amb la clàusula EXIT WHEN.



DECLARE 
    v_nomPais paises.nombre%TYPE;
    v_codiPais ciudades.codigoPais%TYPE;
    v_quantitat NUMBER;
    CURSOR cursorPais IS
        SELECT nombre, codigo FROM paises
        ORDER BY nombre;
BEGIN
    OPEN cursorPais;
    LOOP
        FETCH cursorPais INTO v_nomPais, v_codiPais;
        EXIT WHEN cursorPais%NOTFOUND;
        SELECT COUNT(*)
        INTO v_quantitat
        FROM ciudades
        WHERE codigoPais = v_codiPais;

        IF v_quantitat = 0 THEN
            dbms_output.put_line(v_nomPais || ': cap');
        ELSE
            dbms_output.put_line(v_nomPais || ': ' || v_quantitat);
        END IF;
    END LOOP;
    CLOSE cursorPais;
END;