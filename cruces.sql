CREATE database cruzar;
USE cruzar;
CREATE TABLE tabla1(
    especie varchar(10) primary key not null,
    sitio varchar(10)
);

INSERT INTO tabla1(especie, sitio)
VALUES
('sp1', 'sitio1'),
('sp2', 'sitio1'),
('sp3', 'sitio1'),
('sp4', 'sitio1');

CREATE TABLE tabla2(
	especie varchar(10) primary key not null,
    sitio varchar(10)
);
INSERT INTO tabla2(especie, sitio)
VALUES
('sp1', 'sitio2'),
('sp2', 'sitio2'),
('sp3', 'sitio2'),
('sp4', 'sitio2'),
('sp5', 'sitio2'),
('sp6', 'sitio2'),
('sp7', 'sitio2'),
('sp8', 'sitio2'),
('sp9', 'sitio2');

SELECT * FROM tabla1;
SELECT * FROM tabla2;

-- comparar cuáles especies están en la tabla 2 pero no en la tabla 1 :
SELECT 
	t2.especie, t1.sitio, t2.sitio
FROM
	tabla2 t2
LEFT JOIN 
	tabla1 t1
ON
	t2.	especie = t1.especie;
    
-- usando not in-------------------------------------------------------------
-- --------------------------------------------------------------------------
SELECT *
FROM
  gct
WHERE gct.especie NOT IN (
SELECT
  ESPECIE
FROM
  vrc);
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
  
-- Crear tablas que contendrán la información de las especies

CREATE TABLE vrc(
	ESPECIE VARCHAR(50) PRIMARY KEY NOT NULL,
    T_DISTRIB VARCHAR(50),
    VEDA VARCHAR(20),
    RESOLUCION VARCHAR(20),
    ENTID_VEDA VARCHAR(100),
    CATEG_CIT VARCHAR(20),
    CATEG_UICN VARCHAR(50),
    CATE_MINIS VARCHAR(50),
    MIGRACION VARCHAR(50),
    TIPO_MIGR VARCHAR(50),
    VIGEN_VEDA VARCHAR(50),
    USO VARCHAR(20),
    DIETA VARCHAR(50),
    DISTR_ALT VARCHAR(50),
    TABLA VARCHAR(10)    
);

CREATE TABLE gct(
	ESPECIE VARCHAR(50) PRIMARY KEY NOT NULL,
    T_DISTRIB VARCHAR(50),
    VEDA VARCHAR(20),
    RESOLUCION VARCHAR(20),
    ENTID_VEDA VARCHAR(100),
    CATEG_CIT VARCHAR(20),
    CATEG_UICN VARCHAR(50),
    CATE_MINIS VARCHAR(50),
    MIGRACION VARCHAR(50),
    TIPO_MIGR VARCHAR(50),
    VIGEN_VEDA VARCHAR(50),
    USO VARCHAR(20),
    DIETA VARCHAR(50),
    DISTR_ALT VARCHAR(50),
    TABLA VARCHAR(10)    
);

-- provide a query showing species information including the table they belong to
SELECT
	g.ESPECIE, g.T_DISTRIB, g.VEDA, g.RESOLUCION, g.ENTID_VEDA, 
    g.CATEG_CIT, g.CATEG_UICN, g.CATE_MINIS, g.MIGRACION, g.TIPO_MIGR,
    g.VIGEN_VEDA, g.USO, g.DIETA, g.DISTR_ALT, g.TABLA, v.TABLA
FROM 
	gct g
LEFT JOIN 
	vrc v
ON g.ESPECIE = v.ESPECIE;

 