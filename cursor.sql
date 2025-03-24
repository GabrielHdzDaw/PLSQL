
--Con WHILE
DECLARE
    v_codi empleats.codi%TYPE;
    v_nom empleats.nom%TYPE;
    CURSOR cursorEmpl IS
        SELECT codi, nom FROM empleats; -- 
BEGIN
    OPEN cursorEmpl;
    FETCH cursorEmpl INTO v_codi, v_nom;
    WHILE cursorEmpl%FOUND LOOP
        -- Processar la dada
        FETCH cursorEmpl INTO v_codi, v_nom;
    END LOOP;
    CLOSE cursorEmpl;
END;

--Con LOOP
DECLARE
    v_codi empleats.codi%TYPE;
    v_nom empleats.nom%TYPE;
    CURSOR cursorEmpl IS
        SELECT codi, nom FROM empleats; -- 
BEGIN
    OPEN cursorEmpl;
    LOOP
        FETCH cursorEmpl into v_codi, v_nom;
        EXIT WHEN cursorEmpl%ROWCOUNT > 10
            OR cursorEmpl %NOTFOUND;
        END LOOP;
        CLOSE cursorEmpl;
END;


--Con FOR
DECLARE 
    CURSOR cursorEmpl IS
        SELECT nom, salari, antiguitat
        FROM empleats
        WHERE codi > 10;

BEGIN
    FOR v_empl IN cursorEmpl LOOP
        dbms_output.put_line('Nom: ' || v_empl.nom);
        dbms_output.put_line('Salari: ' || v_empl.salari);
        dbms_output.put_line('Antiguitat: ' || v_empl.antiguitat);
    END LOOP;
END;