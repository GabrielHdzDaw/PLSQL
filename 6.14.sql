-- 12/03/2025
-- Gabriel Hernández Collado
--  Crea un bucle WHILE que mostre els números del 10 al 100, Aumentant 10 en 10.

DECLARE
    i NUMBER;
BEGIN   
    i := 10;
    WHILE i >= 1 LOOP
        dbms_output.put_line(i);
        i := i - 1;
    END LOOP;
END;