USE `actividades`;

SELECT APELLIDOS FROM empleados;

SELECT APELLIDOS FROM empleados GROUP BY APELLIDOS;

SELECT * FROM empleados WHERE APELLIDOS='Smith';

SELECT * FROM empleados WHERE APELLIDOS='Smith' OR APELLIDOS='Rogers';

SELECT * FROM empleados WHERE DEPARTAMENTO=14;

SELECT * FROM empleados WHERE DEPARTAMENTO=37 OR DEPARTAMENTO=77;

SELECT * FROM empleados WHERE APELLIDOS LIKE 'P%';

SELECT SUM(PRESUPUESTO) AS PRESUPUESTO_TOTAL FROM departamentos;

SELECT COUNT(DNI) AS NUMERO_DE_EMPLEADOS, DEPARTAMENTO FROM empleados GROUP BY DEPARTAMENTO;

SELECT empleados.DNI,empleados.NOMBRE,empleados.APELLIDOS,departamentos.NOMBRE FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO;

SELECT empleados.DNI,empleados.NOMBRE,empleados.APELLIDOS,
departamentos.NOMBRE,departamentos.PRESUPUESTO
FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO;

SELECT empleados.NOMBRE,empleados.APELLIDOS
FROM empleados
INNER JOIN departamentos ON empleados.DEPARTAMENTO=departamentos.CODIGO
WHERE departamentos.PRESUPUESTO > 60000;

-- Datos de los deparamentos con media por encima
SELECT * FROM departamentos WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM departamentos);

-- Nombres con departamentos de más de 2 empleados
SELECT NOMBRE FROM departamentos WHERE CODIGO IN (SELECT DEPARTAMENTO FROM
empleados GROUP BY DEPARTAMENTO HAVING COUNT(DEPARTAMENTO) > 2);

-- Añadir calidad
INSERT INTO departamentos VALUES (11, 'Calidad', 40000);
-- Añadir Ester
INSERT INTO empleados VALUES ('89267109', 'Esther', 'Vázquez', 11);

-- Aplicar recorte presupuesto del 10% (multiplicar por 0.9)
UPDATE departamentos SET PRESUPUESTO=PRESUPUESTO*0.9;

-- Reasignar empleados
UPDATE empleados SET DEPARTAMENTO=14 WHERE DEPARTAMENTO=77;

-- Despedir a todos los del 14
DELETE FROM empleados WHERE DEPARTAMENTO=14;

-- Despedir por encima a los 60000
DELETE FROM empleados WHERE DEPARTAMENTO IN (SELECT CODIGO FROM departamentos WHERE PRESUPUESTO > 60000);

-- Despedir a todos
TRUNCATE empleados;
