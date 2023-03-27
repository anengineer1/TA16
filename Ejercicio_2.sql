USE `actividades`;

-- Ejercicio 1
SELECT APELLIDOS FROM empleados;

-- Ejercicio 2
SELECT APELLIDOS FROM empleados GROUP BY APELLIDOS;

-- Ejercicio 3
SELECT * FROM empleados WHERE APELLIDOS='Smith';

-- Ejercicio 4
SELECT * FROM empleados WHERE APELLIDOS='Smith' OR APELLIDOS='Rogers';

-- Ejercicio 5
SELECT * FROM empleados WHERE DEPARTAMENTO=14;

-- Ejercicio 6
SELECT * FROM empleados WHERE DEPARTAMENTO=37 OR DEPARTAMENTO=77;

-- Ejercicio 7
SELECT * FROM empleados WHERE APELLIDOS LIKE 'P%';

-- Ejercicio 8
SELECT SUM(PRESUPUESTO) AS PRESUPUESTO_TOTAL FROM departamentos;

-- Ejercicio 9
SELECT COUNT(DNI) AS NUMERO_DE_EMPLEADOS, DEPARTAMENTO FROM empleados GROUP BY DEPARTAMENTO;

-- Ejercicio 10
SELECT empleados.DNI,empleados.NOMBRE,empleados.APELLIDOS,departamentos.NOMBRE FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO;

-- Ejercicio 11
SELECT empleados.DNI,empleados.NOMBRE,empleados.APELLIDOS,
departamentos.NOMBRE,departamentos.PRESUPUESTO
FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO;

-- Ejercicio 12
SELECT empleados.NOMBRE,empleados.APELLIDOS
FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO
WHERE departamentos.PRESUPUESTO > 60000;

-- Datos de los deparamentos con media por encima
-- Ejercicio 13
SELECT * FROM departamentos WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);

-- Nombres con departamentos de más de 2 empleados
-- Ejercicio 14
SELECT NOMBRE FROM departamentos WHERE CODIGO IN (SELECT DEPARTAMENTO FROM
empleados GROUP BY DEPARTAMENTO HAVING COUNT(DEPARTAMENTO) > 2);

-- Añadir calidad
-- Ejercicio 15
INSERT INTO departamentos VALUES (11, 'Calidad', 40000);
-- Añadir Ester
INSERT INTO empleados VALUES ('89267109', 'Esther', 'Vázquez', 11);

-- Aplicar recorte presupuesto del 10% (multiplicar por 0.9)
-- Ejercicio 16
UPDATE departamentos SET PRESUPUESTO=PRESUPUESTO*0.9;

-- Reasignar empleados
-- Ejercicio 17
UPDATE empleados SET DEPARTAMENTO=14 WHERE DEPARTAMENTO=77;

-- Despedir a todos los del 14
-- Ejercicio 18
DELETE FROM empleados WHERE DEPARTAMENTO=14;

-- Despedir por encima a los 60000
-- Ejercicio 19
DELETE FROM empleados WHERE DEPARTAMENTO IN (SELECT CODIGO FROM departamentos WHERE PRESUPUESTO > 60000);

-- Despedir a todos
-- Ejercicio 20
TRUNCATE empleados;
