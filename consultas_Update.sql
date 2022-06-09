--  Creación de la base de datos:
create database aprendizaje;

--  Creación de la tabla people:
create table people(
first_name varchar(20),
last_name varchar(20),
age int
);

-- INSERTAR DATOS A LA TABLA RECIÉN CREADA:
use aprendizaje;
insert into people (first_name, last_name, age)
values
('Pedro', 'Pérez', 21),
('Carlos', 'Gómez', 22),
('Glenn', 'Doman', 35),
('Colonel', 'sanderes', 60);

Select * from people;

-- Actualizar registros:

-- Cambia el valor de la edad para lor registros de apellido Pérez
UPDATE people set age = 28 where age = 21;
UPDATE people SET last_name = 'Pérez' WHERE first_name = 'Colonel';