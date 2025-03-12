-- 12/03/2025
-- Gabriel Hernández Collado
-- Crea un bucle FOR que mostre els números del 20 al 30.

BEGIN
    FOR i IN 20 .. 30 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;