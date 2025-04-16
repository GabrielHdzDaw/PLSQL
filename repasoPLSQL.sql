-- 1.- Crea una vista "LlenguatgesICompiladors" que mostre tota la informació, donant prioritat als llenguatges: haurà d'aparéixer cada llenguatge (codi, nom i any) al costat de cada compilador (codi i nom) i cada versió (número i data de llançament). El resultat ha d'aparéixer ordenat per llenguatge, compilador i número de versió.

-- bas  BASIC     1964                                      
-- c    C         1972 tc     Turbo C                       
-- cs   C#       
-- 2000 vs     Visual Studio     2022   
-- 2021
-- (...)

 

-- 2.- Crea un bloc anònim que mostre, de cada llenguatge, la quantitat de compiladors (sense tindre en compte les seues diferents versions) dels quals tenim constància. 
-- En cas que d'algun no tinguem cap compilador, haurà d'aparéixer "(Cap)" en comptes del número 0.

-- BASIC: (Cap)
-- C: 1
-- C#: 1
-- C++: 2
-- (...)

DECLARE
    quantitat_compiladors NUMBER(5) := 0;
BEGIN
    FOR i IN (
        SELECT ll.nom, COUNT(c.id) AS quantitat
        FROM llenguatges ll LEFT JOIN compiladors C
        ON ll.codi = c.codiLlenguatge
        GROUP BY ll.nom
        ORDER BY ll.nom;
    ) LOOP
        IF i.quantitat = 0 THEN
            dbms_output.put_line(i.nom || ': (Cap)');
        ELSE
            dbms_output.put_line(i.nom);
        END IF
    END LOOP
END

      
 

-- 3.- Crea una funció "AnyMitjaCompilador" que retorne l'any mitjà d'un cert compilador, el codi del qual se li passarà com a paràmetre. 
-- Si aqueix compilador no existeix, retornarà -1. Prova-la.

-- tp: 1987,5
-- xp: -1

CREATE OR REPLACE FUNCTION AnyMitjaCompilador (
    codiCompilador IN compiladors.codi%TYPE
) RETURN NUMBER AS
    anyCompilador NUMBER := -1;
BEGIN
    SELECT AVG(dataLlanc) AS mitjaCompilador
    INTO anyCompilador
    FROM versionsCompiladors
    WHERE codiComp = codiCompilador;

    IF mitjaCompilador IS NULL THEN
        RETURN -1;
    ELSE
        RETURN anyCompilador;
    END IF;
END AnyMitjaCompilador;

EXECUTE dbms_output.put_line(AnyMitjaCompilador())

-- 4.- Crea un procediment "MostrarCompiladors", que a partir del nom d'un llenguatge que se li passarà com a paràmetre (i que potser està totalment en majúscules
--  o totalment en minúscules), mostre els compiladors que tenim per a aqueix llenguatge, incloent-hi versions. Si no existeix cap compilador, o 
--  no existeix aqueix llenguatge, no escriurà res. Empra un bucle "FOR".

-- -pascal:
-- fp - Free Pascal -
-- 3.2.2 - 2021
-- tp - Turbo Pascal -
-- 1.0 - 1983
-- tp - Turbo Pascal -
-- 7.0 - 1992
-- -go:
 
CREATE OR REPLACE PROCEDURE MostrarCompiladors (
    nomLlenguatgeParam IN llenguatges.nom%TYPE
) AS 
    nomLlenguatge llenguatges.nom%TYPE;
    nomComp compiladors.nom%TYPE;
    versio versionsCompiladors.numVersio%TYPE;
BEGIN
    FOR l in (
        SELECT LOWER(ll.nom), c.nom, v.numVersio
        INTO nomLlenguatge, nomComp, versio
        FROM llenguatges ll JOIN compiladors c
        ON ll.codi = c.codiLlenguatge
        JOIN versionsCompiladors
        ON v.codiComp = c.codi
        WHERE LOWER(nomLlenguatgeParam) = LOWER(ll.nom);
    ) LOOP
        IF nomLlenguatge IS NOT NULL OR nomComp IS NOT NULL THEN
            dbms_output.put_line(nomLlenguatge || ':');
            dbms_output.put_line(nomComp || ':');
            dbms_output.put_line(versio || ':');
        END IF;
    END LOOP;
END



-- 5.- Crea un procediment "MostrarCompiladors2", similar a "Mostrar Compiladors" però amb dues diferències: usarà un bucle LOOP i, en cas de no trobar cap dada,
--  respondrà "No hi ha compiladors".

-- -pascal:
-- fp - Free Pascal -
-- 3.2.2 - 2021
-- tp - Turbo Pascal -
-- 1.0 - 1983
-- tp - Turbo Pascal -
-- 7.0 - 1992
-- -go:
-- No hi ha compiladors

CREATE OR REPLACE PROCEDURE MostrarCompiladors (
    nomLlenguatgeParam IN llenguatges.nom%TYPE
) AS 
    nomLlenguatge llenguatges.nom%TYPE;
    nomComp compiladors.nom%TYPE;
    versio versionsCompiladors.numVersio%TYPE;
    contador NUMBER;

    CURSOR c IS
        SELECT LOWER(ll.nom) AS nomLlenguatge, c.nom AS nomComp, v.numVersio AS versio
        FROM llenguatges ll JOIN compiladors c
        ON ll.codi = c.codiLlenguatge
        JOIN versionsCompiladors
        ON v.codiComp = c.codi
        WHERE LOWER(nomLlenguatgeParam) = LOWER(ll.nom);
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO nomLlenguatge, nomComp, versio;
        EXIT WHEN nomLlenguatge%NOT_FOUND OR nomComp$NOT_FOUND;
        IF nomLlenguatge IS NOT NULL OR nomComp IS NOT NULL THEN
            dbms_output.put_line(nomLlenguatge || ':');
            dbms_output.put_line(nomComp || ':');
            dbms_output.put_line(versio || ':');
        END IF;
        contador := contador + 1;
    END LOOP;
    CLOSE c;
    IF contador = 0 THEN
        dbms_output.put_line('No hi ha compiladors');
    END IF;
END


-- 6.- Crea un procediment "MostrarVersionsCompilador" que, per a un cert compilador, el nom del qual rebrà com a paràmetre, mostrarà 
-- totes les versions que tenim disponibles (número i any), emprant un bucle WHILE. Abans de mostrar aquestes versions, en la línia anterior,
--  escriurà el nom del compilador, i, emprant CASE (i sense consultar la taula "llenguatges"), si es tracta d'un compilador de llenguatge
--   Pascal (codi "pas"), C++ (codi "cpp") o altres. Hauràs d'usar excepcions per a comprovar el cas que el compilador no existisca o que 
--   hi haja 2 amb el mateix nom. Prova-ho emprant un bloc anònim

-- -Turbo Pascal:
-- Turbo Pascal
-- Pascal
-- 1.0, 1983
-- 7.0, 1992
-- -XCS:
-- No trobat

CREATE OR REPLACE PROCEDURE MostrarVersionsCompilador(
    nomCompParam IN VARCHAR2(20)
) AS
    v_nomComp VARCHAR2(20);
    v_codiComp VARCHAR2(5);
    v_versio VARCHAR2(10);
    CURSOR c IS 
        SELECT c.nom AS nomCompilador, v.numVersio AS versio, v.codi AS codiComp
        FROM compiladors c LEFT JOIN versionsCompiladors v
        ON c.codi = v.codiComp
        WHERE LOWER(c.nom) = LOWER(nomCompParam);
BEGIN
    OPEN c;
    WHILE c%FOUND LOOP
        FETCH c INTO v_nomComp, v_versio, v_codiComp;
        dbms_output.put_line(v_versio);
        dbms_output.put_line(v_nomComp);
        CASE v_codiComp
            WHEN 'pas' THEN
                dbms_output.put_line(v_versio);
        FETCH c INTO v_nomComp, v_versio, v_codiComp;
    END LOOP;
    CLOSE c;
END
 

-- 7.- Crea un procediment "AnalitzarAnys", que reba com a paràmetres un any inicial i un any final. Des del primer d'aqueixos anys fins a l'últim 
-- (tots dos inclosos), mostrarà l'any i la quantitat de compiladors que tenim emmagatzemats per a aqueix any. Prova-ho emprant EXECUTE.

-- -- 1989: 0
-- -- 1990: 0
-- -- 1991: 0
-- -- 1992: 2
-- -- 1993: 0

CREATE OR REPLACE PROCEDURE AnalitzarAnys(
    anyInicial IN NUMBER,
    anyFinal IN NUMBER
) AS
    v_quantitat NUMBER := 0;
BEGIN
    FOR i IN anyInicial..anyFinal LOOP
        SELECT COUNT(*) AS quantitat
        INTO v_quantitat
        FROM versionsCompiladors
        WHERE dataLlanc = i;
        dbms_output.put_line(i || ': ' || v_quantitat);   
    END LOOP;
END

 

-- 8.- Crea una funció "AnyDeCompilador", que, a partir d'un cert codi de compilador i un número de versió que rebrà com a paràmetres, 
-- retorne com a text l'any d'aqueixa versió, o bé el text "Inexistent" si no existeix aqueixa versió d'aqueix compilador.
--  Has d'emprar excepcions per a filtrar el cas que no existisca.

-- tp 7.0: 1992
-- xp 1: Inexistent
 

 

-- 9.- Crea un trigger "ValidarAny" que, a l'hora d'afegir una certa versió d'un compilador, li afija 1900 si l'any que
--  introdueix l'usuari està entre el 60 i el 99, i li afija 2000 si està entre 0 i 59. Si és any és major o igual que 100,
--   es guardarà sense canvis. Per exemple, si és usuari introdueix una dada amb l'any 90, es guardarà com 1990, i si guarda un de l'any 22, es guardarà com 2022.

-- INSERT INTO versionsCompiladors VALUES ('tp', '5.5', 89);
-- INSERT INTO versionsCompiladors VALUES ('fp', '2.4.0', 10);
 
-- SELECT * FROM versionsCompiladors 
-- WHERE codiComp = 'tp' OR codiComp = 'fp';
 
-- tp     1.0              1983
-- tp     7.0              1992
-- fp     3.2.2            2021
-- tp     5.5              1989
-- fp     2.4.0            2010
 
CREATE OR REPLACE TRIGGER ValidarAny
BEFORE INSERT
ON versionsCompiladors
FOR EACH ROW    
BEGIN
    IF :NEW.dataLlanc <= 59 THEN   
        :NEW.dataLlanc := :NEW.dataLlanc + 2000;
    ELSIF :NEW.dataLlanc <= 99 THEN
        :NEW.dataLlanc := :NEW.dataLlanc + 1900;
    ELSE

END


BEGIN
END
 

-- 10.- Crea una funció "QuantitatDeCompiladorsComAText", que reba com a paràmetre el nom d'un llenguatge, i retorne el text "Cap compilador trobat", 
-- "Un compilador trobat" o "Més d''un compilador trobat", segons corresponga a partir de la quantitat de versions de compiladors existents per a aqueix 
-- llenguatge, usant IF i sense control d'excepcions.

-- Pascal: Més d'un compilador trobat
-- C: Un compilador trobat
-- Lisp: Cap compilador trobat

 

-- 11.- Crea una funció "QuantitatDeCompiladorsComAText2", que reba com a paràmetre el nom d'un llenguatge, i retorne el text "Cap compilador trobat", 
-- "Un compilador trobat" o "Més d''un compilador trobat", segons corresponga a partir de la quantitat de versions de compiladors existents per a aqueix
-- llenguatge. No ha d'usar IF (ni CASE) sinó control d'excepcions.

CREATE OR REPLACE FUNCTION QuantitatDeCompiladorsComAText2(
    nomLlenguatgeParam IN llenguatges.nom%TYPE
) RETURN VARCHAR2 AS
    v_quantitat NUMBER := 0;
    v_texto VARCHAR2(50);
BEGIN

    SELECT COUNT(*) AS quantitat
    INTO v_quantitat
    FROM llenguatges ll JOIN compiladors c
    ON ll.codi = c.codiLlenguatge
    WHERE LOWER(nomLlenguatgeParam) = LOWER(ll.nom);
    
    EXCEPTIONS
        WHEN NO_DATA_FOUND THEN
            v_texto := 'Cap compilador trobat';
        WHEN TOO_MANY_ROWS THEN
            v_texto := 'Més d''un compilador trobat';
        WHEN OTHERS THEN
            v_texto := 'Un compilador trobat';
    END EXCEPTIONS;
    RETURN v_texto;
END QuantitatDeCompiladorsComAText2;




-- Pascal: Més d'un compilador trobat
-- C: Un compilador trobat
-- Lisp: Cap compilador trobat


-- 12.- Crea un procediment "MostrarLlistaCompiladors", que reba com a paràmetre el nom d'un llenguatge, i mostre en una primera línia el text "Cap compilador trobat", 
-- "Un compilador trobat" o "Més d'un compilador trobat", segons corresponga, ajudant-se d'una de les dues funcions anteriors, i després mostre les versions
--  de compiladors (codi, nom, versió, data), cadascuna en una línia.

-- -Pascal:
-- Pascal: Més d'un
-- compilador trobat
-- fp - Free Pascal - 2.4.0 - 2010
-- fp - Free Pascal - 3.2.2 - 2021
-- tp - Turbo Pascal -
-- 1.0 - 1983
-- tp - Turbo Pascal -
-- 5.5 - 1989
-- tp - Turbo Pascal -
-- 7.0 - 1992
-- -go:
-- go: Cap compilador
-- trobat