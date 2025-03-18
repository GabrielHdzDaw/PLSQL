-- Autor: Gabriel Hernández Collado
-- Fecha 18/5/2025
-- Descripción:  Crea una funció anomenada "QuantitatCiutats", que reba un codi de país i
-- retorne el text "No té ciutats", "Té una ciutat" o "Té més d'una ciutat", segons corresponga. Has d'emprar excepcions.

CREATE OR REPLACE FUNCTION QuantitatCiutats(
    codiPais paises.codigo % TYPE
) RETURN VARCHAR2 AS
    v_text VARCHAR2(25);
BEGIN
    SELECT c.nombre
    INTO v_text
    FROM paises p JOIN ciudades c 
    ON p.codigo = c.codigoPais
    WHERE codiPais = c.codigoPais;
    RETURN 'Té una ciutat';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No té ciutats';
    WHEN TOO_MANY_ROWS THEN
        RETURN 'Té més d''una ciutat';
END QuantitatCiutats;

