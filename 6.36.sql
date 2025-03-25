-- Autor: Gabriel Hernández Collado
-- Fecha 25/3/2025
-- Descripción: Crea una taula de còpia de seguretat per a les ciutats, a la qual s'enviaran les ciutats que s'esborren.
-- Comprova que es comporta correctament.

CREATE TABLE ciutatsEsborrades AS
    SELECT * FROM ciudades
    -- Aquesta clàusula WHERE 1 = 0 fa que no s'afegeixi cap fila a la taula
    WHERE 1 = 0;

CREATE OR REPLACE TRIGGER esborrarCiutat
AFTER DELETE ON ciudades
FOR EACH ROW
BEGIN
    INSERT INTO ciutatsEsborrades VALUES(:OLD.codigo, :OLD.nombre, :OLD.poblacion, :OLD.codigoPais);
END;

DELETE FROM ciudades 
WHERE nombre = 'Bagdad';

SELECT * FROM ciutatsEsborrades;