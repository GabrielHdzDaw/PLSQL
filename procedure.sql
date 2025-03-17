CREATE OR REPLACE PROCEDURE EscriureDestacat(
    cadena IN VARCHAR2) IS
BEGIN
    dbms_output.put_line('--- ' || cadena || ' ---');
END EscriureDestacat;

DECLARE 
    missatge VARCHAR2(30);
BEGIN
    EscriureDestacat('Hola, món!');
END;
