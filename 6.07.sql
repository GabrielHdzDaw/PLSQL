-- 11/03/2025
-- Gabriel Hernández Collado
-- Crea un script que guarde en una variable la quantitat de ciutats que tenim del pais el codi del qual es 'IN'. En una altra variable, guarda la quantitat de ciutats que tenim
-- del pais el codi del cual es 'US'. Finalment mostra el missatge "Tenim més ciutats de l'Índia que dels Estats Units" si tenim més ciutats de l'Índia que dels Estats Units,
-- "Tenim més ciutats dels Estats Units que de l'Índia" si tenim més ciutats dels Estats Units que de l'Índia

DECLARE
    v_quantitatCiutatsIndia NUMBER(9);
    v_quantitatCiutatsUSA NUMBER(9);
BEGIN
    SELECT COUNT(*)
    INTO v_quantitatCiutatsIndia
    FROM ciudades
    WHERE codigoPais = 'IN';

    SELECT COUNT(*)
    INTO v_quantitatCiutatsUSA
    FROM ciudades
    WHERE codigoPais = 'US';

    IF v_quantitatCiutatsIndia > v_quantitatCiutatsUSA THEN
        dbms_output.put_line('Mès ciutats en India que en EEUU');
    ELSIF v_quantitatCiutatsIndia < v_quantitatCiutatsUSA THEN
        dbms_output.put_line('Mès ciutats en EEUU que en India');
    ELSE 
        dbms_output.put_line('India i EEUU tenen igual quantitat de ciutats');
    END IF;
END;