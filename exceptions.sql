DECLARE 
    v_nom jocs.nom % TYPE;
BEGIN
    SELECT v_nom
    INTO v_nom
    FROM jocs;
    dbms_output.put_line(v_nom);

-- Sempre utilitzar NO_DATA_FOUND, TOO_MANY_ROWS i OTHERS
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        dbms_output.put_line('No hi ha dades');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Massa dades');
    WHEN OTHERS THEN
        dbms_output.put_line('Error inesperat');