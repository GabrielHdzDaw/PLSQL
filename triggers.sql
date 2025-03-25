CREATE TRIGGER nom
BEFORE/AFTER
    INSERT/UPDATE/DELETE
ON
    taula
FOR EACH ROW
    operació

CREATE TRIGGER nouJoc
BEFORE INSERT ON jocs
FOR EACH ROW
    SET NEW.codiPLataforma = 
    LOWER(NEW.codiPLataforma);


--ORACLE
--Insertar
CREATE OR REPLACE TRIGGER nouJoc
BEFORE INSERT ON jocs
FOR EACH ROW
BEGIN
    :NEW.codiPLataforma := 
    LOWER(:NEW.codiPLataforma);
END;


--Borrar y guardar en otra tabla
CREATE OR REPLACE TRIGGER jocEsborrat
AFTER DELETE ON jocs
FOR EACH ROW
BEGIN
    INSERT INTO jocsEsborrats
    VALUES(:OLD.codi, :OLD.nom);
END;