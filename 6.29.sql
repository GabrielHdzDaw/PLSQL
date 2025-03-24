-- Autor: Gabriel Hernández Collado
-- Fecha 24/3/2025
-- Descripción:  Crea un script PL/SQL que utilitze cursors per a obtindre la següent informació a partir de la 
-- nostra base de dades de països i ciutats: per a cada un dels països, es mostrarà el seu nom i la quantitat de 
-- ciutats seues que tenim emmagatzemades. En cas que eixa quantitat siga 0 per a algun país, no es mostrarà el 
-- número 0, sinó el text "Cap". Usa un bucle WHILE, com en l'exemple anterior. 

DECLARE 
    v_nomPais paises.nombre%TYPE;
    v_codiPais ciudades.codigoPais%TYPE;
    v_quantitat NUMBER;
    CURSOR cursorPais IS
        SELECT nombre, codigo FROM paises
        ORDER BY nombre;
BEGIN
    OPEN cursorPais;
    FETCH cursorPais INTO v_nomPais, v_codiPais;
    WHILE cursorPais%FOUND LOOP
        SELECT COUNT(*)
        INTO v_quantitat
        FROM ciudades
        WHERE codigoPais = v_codiPais;

        IF v_quantitat = 0 THEN
            dbms_output.put_line(v_nomPais || ': cap');
        ELSE
            dbms_output.put_line(v_nomPais || ': ' || v_quantitat);
        END IF;

        FETCH cursorPais INTO v_nomPais, v_codiPais;
    END LOOP;
    CLOSE cursorPais;
END;