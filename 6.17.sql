-- 12/03/2025
-- Gabriel Hernández Collado
-- Crea un bucle FOR que mostre els números del 20 al 200 avançant de 10 en 10.

BEGIN
    FOR i IN 20 .. 200 BY 10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;

BEGIN
    FOR i IN 2 .. 20 LOOP
        dbms_output.put_line(i * 10);
    END LOOP;
END;