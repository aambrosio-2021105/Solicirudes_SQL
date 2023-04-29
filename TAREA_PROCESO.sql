-- Andy Josue Ambrosio Caal
-- Codigo Tecnico IN5BM
-- Grupo: 1
-- 2021105
CREATE DATABASE IF NOT EXISTS emprasa_IN5BM
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;
USE emprasa_IN5BM;
-- DDL
CREATE TABLE regiones(
id INT NOT NUlL AUTO_INCREMENT,
nombre_region VARCHAR(45),
PRIMARY KEY (id)
);
CREATE TABLE departamento_guate(
id INT NOT NULL AUTO_INCREMENT,
 nombre_depto_guate VARCHAR(45),
 region_id INT NOT NULL,
PRIMARY KEY (id),
 FOREIGN KEY (region_id) REFERENCES regiones (id) ON DELETE CASCADE ON UPDATE 
CASCADE
);
CREATE TABLE oficinas(
id INT NOT NULL AUTO_INCREMENT,
 direccion VARCHAR(45),
 departamento_guate_id INT NOT NULL,
PRIMARY KEY (id),
 FOREIGN KEY (departamento_guate_id) REFERENCES departamento_guate(id) ON DELETE 
CASCADE ON UPDATE CASCADE
);
CREATE TABLE telefonos(
id INT NOT NULL AUTO_INCREMENT,
 numero_telefono VARCHAR(8) NOT NULL,
 PRIMARY KEY(id)
);
CREATE TABLE departamento_empresas(
id INT NOT NULL AUTO_INCREMENT,
 nombre_depto_emp VARCHAR(45),
 PRIMARY KEY(id)
);
CREATE TABLE depto_emp_oficinas(
id INT NOT NULL AUTO_INCREMENT,
 departamento_empresa_id INT NOT NULL,
 oficina_id INT NOT NULL,
 telefono_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (departamento_empresa_id) REFERENCES departamento_empresas (id) ON 
DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (oficina_id) REFERENCES oficinas (id) ON DELETE CASCADE ON UPDATE 
CASCADE,
 FOREIGN KEY (telefono_id) REFERENCES telefonos (id) ON DELETE CASCADE ON UPDATE 
CASCADE
);
CREATE TABLE tipos_empleados(
id INT NOT NULL AUTO_INCREMENT,
 nombre_tipo_empleado VARCHAR (45) NOT NULL,
 sueldo_base DECIMAL(10,0) NOT NULL,
 bonificacion_les DECIMAL(10,0) NOT NULL,
 bonificacion_empresa DECIMAL(10,0),
 PRIMARY KEY(id)
);
CREATE TABLE empleados(
id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(45) NOT NULL,
 apellido VARCHAR(45) NOT NULL,
 fecha_nacimiento DATE NOT NULL,
 fecha_contratacion DATE NOT NULL,
 telefono VARCHAR(8),
 tipo_empleado_id INT NOT NULL,
 depto_emp_oficina_id INT NOT NULL,
 PRIMARY KEY(id),
 FOREIGN KEY (tipo_empleado_id) REFERENCES tipos_empleados (id) ON DELETE CASCADE
ON UPDATE CASCADE,
 FOREIGN KEY (depto_emp_oficina_id) REFERENCES depto_emp_oficinas (id) ON DELETE 
CASCADE ON UPDATE CASCADE
);
USE emprasa_IN5BM;
-- DML
INSERT INTO regiones VALUES (NULL, "Metropolitana");
INSERT INTO regiones VALUES (NULL, "Verapaz ");
INSERT INTO regiones VALUES (NULL, "Noriente");
INSERT INTO regiones VALUES (NULL, "Suroriente");
INSERT INTO regiones VALUES (NULL, " Central");
INSERT INTO regiones VALUES (NULL, "Suroccidente");
INSERT INTO regiones VALUES (NULL, " Noroccidente");
INSERT INTO regiones VALUES (NULL, " Petén");
INSERT INTO departamento_guate VALUES (NULL, " Guatemala",1);
INSERT INTO departamento_guate VALUES (NULL, " Alta Verapaz",2);
INSERT INTO departamento_guate VALUES (NULL, "Baja Verapaz",2);
INSERT INTO departamento_guate VALUES (NULL, "Chiquimula",3);
INSERT INTO departamento_guate VALUES (NULL, "Jutiapa",4);
INSERT INTO departamento_guate VALUES (NULL, "Chimaltenango",5);
INSERT INTO departamento_guate VALUES (NULL, " Quetzaltenango",6);
INSERT INTO departamento_guate VALUES (NULL, "Quiché",7);
INSERT INTO departamento_guate VALUES (NULL, "Huehuetenango",7);
INSERT INTO departamento_guate VALUES (NULL, "Peten",8);
INSERT INTO oficinas VALUES (NULL, "zona 3 11 avenida colonia Gallito ",1);
INSERT INTO oficinas VALUES (NULL, "zona 5 6 avenida colonia Coloquial",2);
INSERT INTO oficinas VALUES (NULL, "zona 8 3 avenida colonia El Recinto",3);
INSERT INTO oficinas VALUES (NULL, "zona 4 8 avenida colonia Aguilar",4);
INSERT INTO oficinas VALUES (NULL, "zona 9 7 avenida colonia Montes",5);
INSERT INTO oficinas VALUES (NULL, "zona 10 3 avenida colonia Linares",6);
INSERT INTO oficinas VALUES (NULL, "zona 11 2 avenida colonia Molino",7);
INSERT INTO oficinas VALUES (NULL, "zona 7 1 avenida colonia Modernos",8);
INSERT INTO oficinas VALUES (NULL, "zona 8 12 avenida colonia Limones",9);
INSERT INTO oficinas VALUES (NULL, "zona 9 13 avenida colonia Limonada",10);
INSERT INTO telefonos VALUES (NULL, "45875698");
INSERT INTO telefonos VALUES (NULL, "12542365");
INSERT INTO telefonos VALUES (NULL, "45872365");
INSERT INTO telefonos VALUES (NULL, "14785254");
INSERT INTO telefonos VALUES (NULL, "36985241");
INSERT INTO telefonos VALUES (NULL, "78945631");
INSERT INTO telefonos VALUES (NULL, "45875124");
INSERT INTO telefonos VALUES (NULL, "45877895");
INSERT INTO telefonos VALUES (NULL, "45870101");
INSERT INTO telefonos VALUES (NULL, "45874785");
INSERT INTO departamento_empresas VALUES (NULL, "Finianciero");
INSERT INTO departamento_empresas VALUES (NULL, "Presupuesto");
INSERT INTO departamento_empresas VALUES (NULL, "Tesoreria");
INSERT INTO departamento_empresas VALUES (NULL, "Logistica");
INSERT INTO departamento_empresas VALUES (NULL, "Control de genstion");
INSERT INTO departamento_empresas VALUES (NULL, "Rescursos Humanos");
INSERT INTO departamento_empresas VALUES (NULL, "Compras");
INSERT INTO departamento_empresas VALUES (NULL, "Comercial");
INSERT INTO departamento_empresas VALUES (NULL, "Markrting");
INSERT INTO departamento_empresas VALUES (NULL, "Administrativo");
INSERT INTO depto_emp_oficinas VALUES (NULL, 1,1,1);
INSERT INTO depto_emp_oficinas VALUES (NULL, 2,2,2);
INSERT INTO depto_emp_oficinas VALUES (NULL, 3,3,3);
INSERT INTO depto_emp_oficinas VALUES (NULL, 4,4,4);
INSERT INTO depto_emp_oficinas VALUES (NULL, 5,5,5);
INSERT INTO depto_emp_oficinas VALUES (NULL, 6,6,6);
INSERT INTO depto_emp_oficinas VALUES (NULL, 7,7,7);
INSERT INTO depto_emp_oficinas VALUES (NULL, 8,8,8);
INSERT INTO depto_emp_oficinas VALUES (NULL, 9,9,9);
INSERT INTO depto_emp_oficinas VALUES (NULL, 10,10,10);
INSERT INTO tipos_empleados VALUES (NULL, "Mantenimiento",26000,2000,255);
INSERT INTO tipos_empleados VALUES (NULL, "Informatica",45600,1000,500);
INSERT INTO tipos_empleados VALUES (NULL, "Tesoreria",48600,1000,300);
INSERT INTO tipos_empleados VALUES (NULL, "Cafeteria",4400,14000,"500");
INSERT INTO tipos_empleados VALUES (NULL, "Limpieza",20000,1000,500);
INSERT INTO tipos_empleados VALUES (NULL, "Contabilidad",26000,1200,450);
INSERT INTO tipos_empleados VALUES (NULL, "Auditoria",36600,1000,500);
INSERT INTO tipos_empleados VALUES (NULL, "Comercial",38000,10000,250);
INSERT INTO tipos_empleados VALUES (NULL, "Control Gestiones",27600,900,250);
INSERT INTO tipos_empleados VALUES (NULL, "Cuentas por cobrar",45600,800,300);
INSERT INTO tipos_empleados VALUES (NULL, "Jefe contabilidad",25600,800,300);
INSERT INTO tipos_empleados VALUES (NULL, "Jefe ingenieros",65600,800,300);
INSERT INTO tipos_empleados VALUES (NULL, "Jefe auditoria",35600,800,300);
INSERT INTO empleados VALUES (NULL, "Luis","Perez","1999-03-12","2022-01-26",12545698,1,1);
INSERT INTO empleados VALUES (NULL, "Jose","Esquibel","1998-12-12","2021-02-12",12545698,2,2);
INSERT INTO empleados VALUES (NULL, "Andy","Ambrosio","2000-05-01","2020-04-15",45840101,3,3);
INSERT INTO empleados VALUES (NULL, "Angi","Martinez","1997-04-14","2021-03-19",45875622,4,4);
INSERT INTO empleados VALUES (NULL, "Sucely","Reyes","2000-02-01","2022-04-30",45784587,5,5);
INSERT INTO empleados VALUES (NULL, "Gabriel","Monroy","1999-12-31","2019-10-23",56982365,6,6);
INSERT INTO empleados VALUES (NULL, "Fernando","Chavez","1998-12-12","2021-03-19",52367854,7,7);
INSERT INTO empleados VALUES (NULL, "Diego","Reyes","1997-04-14","2022-01-26",58744521,10,8);
INSERT INTO empleados VALUES (NULL, "Perfecto","De leon","1999-03-12","2019-10-23",74125896,12,9);
INSERT INTO empleados VALUES (NULL, "Alfenigo","Fuentes","1980-02-01","2020-04-15",36925814,11,10);
-- -----------------SOLICITUDES-------------------
-- 1) Nombre y edad de los empleados
SELECT empleados.nombre, empleados.fecha_nacimiento
FROM empleados;
-- 2) Fecha de contratación de cada empleado
SELECT empleados.nombre, empleados.fecha_contratacion
FROM empleados;
-- 3) Edades de los empleados.
SELECT e.nombre,
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) AS edad
FROM empleados AS e ;
-- 4) Número de empleados que hay para cada una de las edade
SELECT 
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) as Edades,
count(*) repetidos
FROM empleados AS e 
GROUP BY e.fecha_nacimiento HAVING count(*);
-- 5) Edad media de los empleados por departamento.
SELECT m.nombre_depto_emp,
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) as Edades,
count(*) repetidos
FROM empleados AS e
INNER JOIN depto_emp_oficinas AS d
INNER JOIN departamento_empresas AS m
ON e.depto_emp_oficina_id=d.id
AND d.departamento_empresa_id=m.id
GROUP BY e.fecha_nacimiento HAVING count(*);
-- 6) Tipos de Empleados que superan las 35.000 de salario.
SELECT t.nombre_tipo_empleado
FROM tipos_empleados AS t
WHERE t.sueldo_base>35000;
-- 7) Datos del empleado número 
SELECT * FROM empleados 
WHERE id=1;
-- 8) Empleados del departamento de empresa X 
SELECT concat(e.nombre,' ', e.apellido) AS nombre_apellido,
m.nombre_depto_emp AS nombre_empresa
FROM empleados AS e
INNER JOIN depto_emp_oficinas AS d
INNER JOIN departamento_empresas AS m 
ON e.depto_emp_oficina_id=d.id 
AND d.departamento_empresa_id=m.id
AND nombre_depto_emp="Rescursos Humanos";
-- 9) Empleados cuya contratación se produjo en el año X.
SELECT concat(e.nombre,' ',e.apellido) as nombre_apellido,
e.fecha_contratacion
FROM empleados AS e 
WHERE fecha_contratacion 
BETWEEN "2022-01-01" AND "2022-12-31";
-- 10) Empleados que no sean jefe de Departamento (atributo nombre tipo
-- empleado dentro de la entidad Tipos Empleados) X
SELECT concat(e.nombre,' ',e.apellido),
t.nombre_tipo_empleado
FROM empleados AS e
INNER JOIN tipos_empleados AS t
ON e.tipo_empleado_id=t.id
AND nombre_tipo_empleado LIKE"%Jefe%";
-- 11) Empleados contratados entre los años X y X
SELECT concat(e.nombre,' ',e.apellido) as nombre_apellido,
e.fecha_contratacion
FROM empleados AS e 
WHERE fecha_contratacion 
BETWEEN "2020-01-01" AND "2022-12-31";
-- 12) Tipos de Empleado que tienen un salario superior a 35.000 e inferior a 40.000.
SELECT e.nombre_tipo_empleado, e.sueldo_base
FROM tipos_empleados AS e 
WHERE e.sueldo_base BETWEEN 35000 AND 40000;
-- 13) Empleados cuyo tipo de empleado es director o jefe de sección
SELECT concat(e.nombre,' ',e.apellido),
t.nombre_tipo_empleado
FROM empleados AS e
INNER JOIN tipos_empleados AS t
ON e.tipo_empleado_id=t.id
AND nombre_tipo_empleado LIKE"%Jefe%";
-- 14) Empleados de nombre 'Jose
SELECT e.id,e.nombre, e.apellido
FROM empleados as e WHERE nombre="Jose";
-- 15) Empleados que pertenecen al departamento administrativo y que tienen una edad 
-- mayor a 35 años
SELECT e.nombre, m.nombre_depto_emp
FROM empleados AS e
INNER JOIN depto_emp_oficinas as d 
INNER JOIN departamento_empresas as m 
ON e.depto_emp_oficina_id=d.id 
AND d.departamento_empresa_id=m.id 
AND nombre_depto_emp="Administrativo" 
AND TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE())>35;
-- 16) Empleados que no pertenecen al departamento de la empresa 
SELECT concat(e.nombre,' ', e.apellido) 
AS nombre_apellido,
m.nombre_depto_emp AS nombre_empresa
FROM empleados AS e
INNER JOIN depto_emp_oficinas AS d
INNER JOIN departamento_empresas AS m 
ON e.depto_emp_oficina_id=d.id 
AND d.departamento_empresa_id=m.id 
AND NOT nombre_depto_emp="Rescursos Humanos";
-- 17) Nombre y edad de los empleados ordenados de menor a mayor edad.
SELECT e.nombre, 
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) AS edad
FROM empleados AS e 
ORDER BY edad ASC;
-- 18) Nombre y edad de los empleados ordenados por nombre de forma descendente.
SELECT e.nombre, 
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) 
AS edad
FROM empleados AS e 
ORDER BY edad DESC;
-- 19) Nombre del empleado y el departamento de la empresa en la que trabaja. 
SELECT e.nombre,m.nombre_depto_emp
FROM empleados AS e
INNER JOIN depto_emp_oficinas AS d
INNER JOIN departamento_empresas AS m
ON e.depto_emp_oficina_id=d.id
AND d.departamento_empresa_id=m.id;
-- 20) Código y teléfonos de los departamentos de las oficinas de la región 'Centro'.
SELECT t.numero_telefono, d.nombre_depto_guate
FROM telefonos AS t
INNER JOIN regiones AS r
INNER JOIN departamento_guate AS d
INNER JOIN oficinas AS f
INNER JOIN depto_emp_oficinas AS o 
ON o.telefono_id=t.id
AND o.oficina_id=f.id
AND f.departamento_guate_id=d.id
AND d.region_id=r.id
AND r.nombre_region=" Central";
-- 21) Nombre del empleado y departamento de Guatemala en el que trabaja
SELECT concat(e.nombre,' ',e.apellido) AS nombre_apellid,
g.nombre_depto_guate AS nombre_departamento
FROM empleados AS e
INNER JOIN depto_emp_oficinas AS d
INNER JOIN oficinas AS o
INNER JOIN departamento_guate AS g 
ON e.depto_emp_oficina_id=d.id 
AND d.oficina_id=o.id
AND o.departamento_guate_id=g.id;
-- 22) Sueldo de cada empleado y sus bonificaciones
SELECT concat(e.nombre,' ',e.apellido) AS nombre_apellido,
t.sueldo_base AS sueldo,
t.bonificacion_les AS bonificacion
FROM tipos_empleados AS t
INNER JOIN empleados AS e
ON e.tipo_empleado_id=t.id;
-- 23) Nombre de los empleados y de sus jefes de departamento
SELECT concat(e.nombre,' ',e.apellido),
t.nombre_tipo_empleado
FROM empleados AS e
INNER JOIN tipos_empleados AS t
ON e.tipo_empleado_id=t.id
AND nombre_tipo_empleado LIKE"%Jefe%";
-- 24) Suma del sueldo de los empleados, sin la bonificación empresa
SELECT e.nombre,
 t.sueldo_base+t.bonificacion_les
FROM tipos_empleados AS t
INNER JOIN empleados AS e
ON e.tipo_empleado_id=t.id ;
-- 25) Promedio del sueldo, sin contar bonificación
SELECT sum(t.sueldo_base)/count(t.id) AS promedio_sueldo
FROM tipos_empleados AS t;
-- 26) Salarios máximo y mínimo de los empleados, incluyendo bonificación.
SELECT e.nombre, e.apellido, 
min(t.sueldo_base),
max(t.sueldo_base)
FROM empleados AS e
INNER JOIN tipos_empleados AS t 
ON e.tipo_empleado_id=t.id ;
-- 27) Número de empleados que superan los 40 años.
SELECT count(e.fecha_nacimiento)<40
FROM empleados AS e;
-- 28) Número de edades diferentes que tienen los empleados.
SELECT 
count(*) repetidos,
TIMESTAMPDIFF(YEAR,e.fecha_nacimiento,CURDATE() ) as Edades
FROM empleados AS e 
group by e.fecha_nacimiento having count(*)