USE `actividades`;

-- Ejercicio 1
SELECT * FROM almacenes;

-- Ejercio 2
SELECT * FROM cajas WHERE VALOR > 150;

-- Ejercicio 3
SELECT CONTENIDO FROM cajas GROUP BY CONTENIDO;

-- Ejercicio 4
SELECT AVG(VALOR) FROM cajas;

-- Ejercicio 5 valor medio de cada almacén
SELECT AVG(VALOR), ALMACEN FROM cajas GROUP BY ALMACEN;

-- Ejercicio 6
SELECT ALMACEN FROM cajas GROUP BY ALMACEN HAVING AVG(VALOR) > 150;

-- Ejercicio 7
SELECT cajas.NUMREFERENCIA, almacenes.LUGAR FROM cajas
INNER JOIN almacenes
ON cajas.ALMACEN=almacenes.CODIGO;

-- Ejercicio 8
SELECT COUNT(NUMREFERENCIA) AS NUM_CAJAS, ALMACEN FROM cajas GROUP BY ALMACEN;

-- Ejercicio 9
SELECT cajas.ALMACEN FROM cajas
INNER JOIN almacenes ON almacenes.CODIGO=cajas.ALMACEN GROUP BY ALMACEN
HAVING COUNT(cajas.NUMREFERENCIA) > (SELECT CAPACIDAD FROM almacenes WHERE almacenes.CODIGO = cajas.ALMACEN);

-- Ejercicio 10
SELECT NUMREFERENCIA FROM cajas
WHERE ALMACEN = (SELECT CODIGO FROM almacenes WHERE LUGAR='Bilbao');

-- Ejercicio 11
INSERT INTO almacenes VALUES
(6, 'Barcelona', 3);

-- Ejercicio 12
INSERT INTO cajas VALUES
('H5RT', 'Papel', 200, 2);

-- Ejercicio 13: rebajar 15% es multiplicar por 0.85
UPDATE cajas SET VALOR=VALOR*0.85;

-- Ejercicio 14: rebajar 20% es multiplicar por 0.80
UPDATE cajas
INNER JOIN (
  SELECT AVG(VALOR) AS AVG_VALOR
  FROM cajas
) AS t ON cajas.VALOR > t.AVG_VALOR
SET cajas.VALOR = cajas.VALOR * 0.80;

-- Ejercicio 15: Eliminar cajas cuyo valor sea inferior a 100
DELETE FROM cajas WHERE VALOR < 100;

-- Ejercicio 16
DELETE FROM cajas
WHERE ALMACEN IN (
SELECT cajas.ALMACEN FROM (
SELECT ALMACEN, COUNT(NUMREFERENCIA) AS num_referencias
FROM cajas
GROUP BY ALMACEN
) AS cajas_referencias
INNER JOIN almacenes ON almacenes.CODIGO = cajas_referencias.ALMACEN
WHERE cajas_referencias.num_referencias > almacenes.CAPACIDAD
);
