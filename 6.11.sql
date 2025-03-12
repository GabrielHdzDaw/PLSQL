-- 12/03/2025
-- Gabriel Hernández Collado

DECLARE 
    v_quantitat NUMBER(10);
    resposta VARCHAR2(10);
BEGIN
    SELECT COUNT(*) 
    INTO v_quantitat
    FROM paises 
    WHERE LOWER(nombre) LIKE '%unido%';

    resposta := CASE v_quantitat
        WHEN 0 THEN 'Zero'
        WHEN 1 THEN 'Un'
        WHEN 2 THEN 'Dos'
        ELSE 'Més de dos'
        END;
    dbms_output.put_line(resposta);
END;
    