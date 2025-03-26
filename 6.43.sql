-- Autor: Gabriel Hernández Collado
-- Fecha 26/3/2025
-- 8.- Ens han demanat un "trigger" que els permeta introduir informació 
-- de manera més ràpida: si el concepte és "d" i l'import és nul, es 
-- guardarà "Derrama" com a concepte i 100 com a import.

CREATE OR REPLACE TRIGGER autoCompletar
BEFORE INSERT ON rebuts
FOR EACH ROW
BEGIN
    IF :NEW.concepte = 'd' THEN
        :NEW.concepte := 'Derrama';
        :NEW.import := 100;
    END IF;
END;
