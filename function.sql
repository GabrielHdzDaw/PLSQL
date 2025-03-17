CREATE OR REPLACE FUNCTION Factorial(
    n IN NUMBER
)
    RETURN NUMBER AS
BEGIN
    if n < 0 THEN
        RETURN -1;
    ELSIF N = 0 THEN
        RETURN 1;
    ELSE
        RETURN n * Factorial(n - 1);
    END IF;
END Factorial;
