-- 12/03/2025
-- Gabriel Hernández Collado
--  Crea un bucle LOOP que mostre els números del 10 al 100, augmentant de 10 en 10. Has d'emprar la sintaxi EXIT WHEN.
DECLARE 
    i NUMBER;
BEGIN 
    i := 10;
    LOOP
        dbms_output.put_line(i);
        EXIT WHEN i = 100;
        i := i + 10;
    END LOOP;
END;