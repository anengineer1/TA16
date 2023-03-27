USE `actividades`;

SELECT * FROM articulos;
SELECT * FROM fabricantes;

-- # Mostrar el nombre de los artículos
-- Ejercicio 1
SELECT NOMBRE FROM articulos;

-- # Nombres y precios
-- Ejercicio 2
SELECT NOMBRE,PRECIO FROM articulos;

-- # Nombres articuls <= 200
-- Ejercicio 3
SELECT NOMBRE FROM articulos WHERE precio <= 200;

-- # Nombres precio comprendido entre 60 y 120
-- Ejercicio 4
SELECT NOMBRE FROM articulos WHERE precio BETWEEN 60 AND 120;

-- # Nombre y precio en pesetas
-- Ejercicio 5
SELECT NOMBRE, PRECIO*166.386 AS PRECIO_PESETAS FROM articulos;

-- # Precio medio de cada fabricante
-- Ejercicio 6
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO)
GROUP BY NOMBRE;

-- Precio medio mayor cuyo número de fabricante sea 2
-- Ejercicio 7
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) WHERE fabricantes.CODIGO=2 GROUP BY NOMBRE;

-- Número de articulos mayor a 180
-- Ejercicio 8
SELECT COUNT(PRECIO) AS NUM_ARTICULOS_MAYOR_A_180 FROM articulos WHERE PRECIO > 180;

-- Ordenar descendentemente por precio si mayor a 180 y desc nombre
-- Ejercicio 9
SELECT NOMBRE,PRECIO FROM articulos WHERE PRECIO > 180 ORDER BY PRECIO DESC, NOMBRE ASC;

-- Lista completa artículos con su fabricante
-- Ejercicio 10
SELECT articulos.NOMBRE, fabricantes.NOMBRE FROM articulos
INNER JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;

-- List con precios también
-- Ejercicio 11
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE FROM articulos
INNER JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;

-- Lista media por código fabricante
-- Ejercicio 12
SELECT fabricantes.CODIGO, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY CODIGO;

-- Lista media por nombre fabricante
-- Ejercicio 13
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY NOMBRE;

-- Lista valor medio >= 150
-- Ejercicio 14
SELECT fabricantes.NOMBRE FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO)
GROUP BY fabricantes.NOMBRE HAVING AVG(articulos.PRECIO) >= 150;

-- Articulos más barato
-- Ejercicio 15
SELECT NOMBRE, PRECIO FROM articulos ORDER BY PRECIO LIMIT 1;

-- Articulo más caro de cada fabricante
-- Ejercicio 16
SELECT articulos.NOMBRE, fabricantes.NOMBRE, articulos.PRECIO FROM articulos
JOIN fabricantes ON fabricantes.CODIGO=articulos.FABRICANTE
WHERE articulos.PRECIO IN (SELECT MAX(articulos.PRECIO) FROM articulos GROUP BY FABRICANTE);

-- Añadir nuevo product
-- Ejercicio 17
INSERT INTO articulos VALUES (11, 'Altavoces', 70, 2);

-- Cambiar nombre producto 8
-- Ejercicio 18
UPDATE articulos SET NOMBRE='Impresora Laser' WHERE CODIGO=8;

-- Descuento del 10%
-- Ejercicio 19
UPDATE articulos SET PRECIO=PRECIO*0.9;

-- Descuento de 10€
-- Ejercicio 20
UPDATE articulos SET PRECIO=(PRECIO-10) WHERE PRECIO >= 120;
