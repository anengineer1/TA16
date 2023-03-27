USE `actividades`;

-- # Mostrar el nombre de los artículos

SELECT NOMBRE FROM articulos;

-- # Nombres y precios

SELECT NOMBRE,PRECIO FROM articulos;

-- # Nombres articuls <= 200

SELECT NOMBRE FROM articulos WHERE precio <= 200;

-- # Nombres precio comprendido entre 60 y 120

SELECT NOMBRE FROM articulos WHERE precio BETWEEN 60 AND 120;

-- # Nombre y precio en pesetas

SELECT NOMBRE, PRECIO*166.386 AS PRECIO_PESETAS FROM articulos;

-- # Precio medio de cada fabricante

SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO)
GROUP BY NOMBRE;

-- Precio medio mayor cuyo número de fabricante sea 2

SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) WHERE fabricantes.CODIGO=2 GROUP BY NOMBRE;

-- Número de articulos mayor a 180
SELECT COUNT(PRECIO) AS NUM_ARTICULOS_MAYOR_A_180 FROM articulos WHERE PRECIO > 180;

-- Ordenar descendentemente por precio si mayor a 180 y desc nombre
SELECT NOMBRE,PRECIO FROM articulos WHERE PRECIO > 180 ORDER BY PRECIO DESC, NOMBRE ASC;

-- Lista completa artículos con su fabricante
SELECT articulos.NOMBRE, fabricantes.NOMBRE FROM articulos
INNER JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;

-- List con precios también
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE FROM articulos
INNER JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;

-- Lista media por código fabricante
SELECT fabricantes.CODIGO, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY CODIGO;

-- Lista media por nombre fabricante
SELECT fabricantes.NOMBRE, AVG(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY NOMBRE;

-- Lista valor medio >= 150
SELECT fabricantes.NOMBRE FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO)
GROUP BY fabricantes.NOMBRE HAVING AVG(articulos.PRECIO) >= 150;

-- Articulos más barato
SELECT NOMBRE, PRECIO FROM articulos ORDER BY PRECIO LIMIT 1;

-- Articulo más caro de cada fabricante
SELECT articulos.NOMBRE, fabricantes.NOMBRE, MAX(articulos.PRECIO) FROM
(articulos INNER JOIN fabricantes ON articulos.FABRICANTE = fabricantes.CODIGO)
GROUP BY fabricantes.NOMBRE, articulos.NOMBRE;
-- Revisar

-- Añadir nuevo producto
INSERT INTO articulos VALUES (11, 'Altavoces', 70, 2);

-- Cambiar nombre producto 8
UPDATE articulos SET NOMBRE='Impresora Laser' WHERE CODIGO=8;

-- Descuento del 10%
UPDATE articulos SET PRECIO=PRECIO*0.9;

-- Descuento de 10€
UPDATE articulos SET PRECIO=(PRECIO-10) WHERE PRECIO >= 120;
