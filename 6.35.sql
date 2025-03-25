-- Autor: Gabriel Hernández Collado
-- Fecha 25/3/2025
-- Descripción: Crea un trigger que anote "Sense revisar" en el nom d'un paí, en el cas
-- que no s'haja indicat aquest nom

CREATE OR REPLACE TRIGGER revisarPais
BEFORE INSERT ON paises
FOR EACH ROW
BEGIN
    IF :NEW.nombre IS NULL THEN
        :NEW.nombre := 'Sense revisar';
    END IF;
END;

INSERT INTO paises VALUES ('LE', NULL, 15245);

SELECT nombre FROM paises WHERE codigo = 'LE';