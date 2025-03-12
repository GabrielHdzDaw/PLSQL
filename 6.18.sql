DECLARE
    max_codigo NUMBER(3);
    ciudad ciudades % ROWTYPE;
BEGIN
    SELECT MAX(codigo)
    INTO max_codigo
    FROM ciudades;

    

    FOR i IN 1 .. max_codigo LOOP
        SELECT *
        INTO ciudad
        FROM CIUDADES
        WHERE codigo = i;
        IF i % 2 = 0 THEN
            dbms_output.put_line(ciudades.nombre);
        END IF;
    END LOOP;
END;